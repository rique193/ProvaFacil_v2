import 'dart:io';

import 'package:drift/drift.dart' show DatabaseConnection, driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/id_instalacao.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/nome_banco_conta.dart';
import 'package:provafacil/data/repository/auth_repository.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/ui/conta/sessao_da_conta.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ajudantes/app_de_teste.dart';
import '../../ajudantes/autenticacao_falsa.dart';

void main() {
  late Directory pasta;
  late ServicoAutenticacaoFalso servico;
  late AuthRepository auth;
  late List<String> bancosAbertos;
  late List<AppDatabase> bancos;
  late Map<String, int> routersPorSessao;

  // Bancos de contas diferentes (arquivos diferentes) coexistem por um instante na troca de conta.
  setUpAll(() => driftRuntimeOptions.dontWarnAboutMultipleDatabases = true);

  setUp(() {
    pasta = Directory.systemTemp.createTempSync('provafacil_sessao_');
    servico = ServicoAutenticacaoFalso()
      ..adicionarConta(email: 'a@escola.com', senha: '123456', nome: 'Ana')
      ..adicionarConta(email: 'b@escola.com', senha: '123456', nome: 'Bia');
    auth = AuthRepository(servico);
    bancosAbertos = [];
    bancos = [];
    routersPorSessao = {};
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() {
    auth.dispose();
    if (pasta.existsSync()) pasta.deleteSync(recursive: true);
  });

  /// Cada conta tem um arquivo próprio na pasta temporária: sair e voltar reabre os mesmos dados.
  AppDatabase abrirBanco(String uid) {
    final nome = nomeBancoDaConta(uid);
    bancosAbertos.add(nome);
    final banco = AppDatabase(
      DatabaseConnection(
        NativeDatabase(File('${pasta.path}/$nome.sqlite')),
        closeStreamsSynchronously: true,
      ),
    );
    bancos.add(banco);
    return banco;
  }

  Future<void> abrirSessao(WidgetTester tester) async {
    tester.view
      ..physicalSize = const Size(800, 3000)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    addTearDown(() => tester.pumpWidget(const SizedBox.shrink()));
    await tester.pumpWidget(
      SessaoDaConta(
        auth: auth,
        idInstalacao: IdInstalacao(gerarId: () => 'inst'),
        abrirBanco: abrirBanco,
        criarRouter: (uid) {
          routersPorSessao.update(uid ?? 'sem-conta', (n) => n + 1, ifAbsent: () => 1);
          return provaFacilNavHost(
            auth: auth,
            uidDaSessao: (uid: uid),
            initialLocation: uid == null ? '/login' : rotaLista,
            usarCamera: false,
          );
        },
        construir: (context, router) => MaterialApp.router(routerConfig: router),
      ),
    );
    await esperarBanco(tester);
  }

  Future<void> entrar(WidgetTester tester, String email) async {
    await auth.entrar(email: email, senha: '123456');
    await esperarBanco(tester);
  }

  Future<void> sair(WidgetTester tester) async {
    await auth.sair();
    await esperarBanco(tester);
  }

  /// Só o login está aberto, e nenhuma exceção (provider ausente, banco fechado) ocorreu.
  void esperarNoLogin(WidgetTester tester) {
    expect(tester.takeException(), isNull);
    expect(find.text('Entre com sua conta de professor'), findsOneWidget);
    expect(find.text('Dashboard'), findsNothing);
  }

  void esperarNaLista(WidgetTester tester) {
    expect(tester.takeException(), isNull);
    expect(find.text('Dashboard'), findsOneWidget);
  }

  Future<void> criarProva(WidgetTester tester, String titulo) async {
    final banco = Provider.of<AppDatabase>(tester.element(find.text('Dashboard')), listen: false);
    await tester.runAsync(
      () => ProvaRepository(banco).salvarConteudoProva(
        provaId: null,
        titulo: titulo,
        disciplina: 'Ciências',
        turma: 'Turma A',
        descricao: '',
        questoes: [
          QuestaoInput(
            enunciado: 'Pergunta?',
            alternativas: [for (final l in ['A', 'B', 'C', 'D', 'E']) AlternativaInput(texto: 'Resposta $l')],
          ),
        ],
      ),
    );
    await esperarBanco(tester);
  }

  testWidgets('sem login abre só o login, sem banco aberto nem provider de banco', (tester) async {
    await abrirSessao(tester);

    esperarNoLogin(tester);
    expect(bancosAbertos, isEmpty);
    expect(routersPorSessao, {'sem-conta': 1});
    final contexto = tester.element(find.text('Entre com sua conta de professor'));
    expect(() => contexto.read<AppDatabase>(), throwsA(isA<ProviderNotFoundException>()));
  });

  testWidgets('cada conta vê só os próprios dados: A → sair → B → sair → A', (tester) async {
    await abrirSessao(tester);
    esperarNoLogin(tester);

    // Conta A cria uma prova.
    await entrar(tester, 'a@escola.com');
    esperarNaLista(tester);
    expect(bancosAbertos, ['provafacil_u1']);
    await criarProva(tester, 'Prova da Ana');
    expect(find.text('Prova da Ana'), findsOneWidget);

    // Sair: volta ao login, e a prova da Ana não fica na árvore.
    await sair(tester);
    esperarNoLogin(tester);
    expect(find.text('Prova da Ana'), findsNothing);

    // Conta B não vê a prova da A e cria a dela.
    await entrar(tester, 'b@escola.com');
    esperarNaLista(tester);
    expect(bancosAbertos, ['provafacil_u1', 'provafacil_u2']);
    expect(find.text('Prova da Ana'), findsNothing);
    expect(find.text('Você tem 0 prova(s) cadastrada(s).'), findsOneWidget);
    await criarProva(tester, 'Prova da Bia');
    expect(find.text('Prova da Bia'), findsOneWidget);

    await sair(tester);
    esperarNoLogin(tester);
    expect(find.text('Prova da Bia'), findsNothing);

    // A volta e vê só a dela.
    await entrar(tester, 'a@escola.com');
    esperarNaLista(tester);
    expect(bancosAbertos, ['provafacil_u1', 'provafacil_u2', 'provafacil_u1']);
    expect(find.text('Prova da Ana'), findsOneWidget);
    expect(find.text('Prova da Bia'), findsNothing);
    expect(find.text('Você tem 1 prova(s) cadastrada(s).'), findsOneWidget);

    // Um router por sessão: a lista só abre no router novo da conta, nunca no "sem conta".
    expect(routersPorSessao, {'sem-conta': 3, 'u1': 2, 'u2': 1});
    expect(tester.takeException(), isNull);
  });

  testWidgets('o banco da conta que saiu é fechado', (tester) async {
    await abrirSessao(tester);
    await entrar(tester, 'a@escola.com');
    await criarProva(tester, 'Prova da Ana');
    final bancoDaAna = bancos.single;

    await sair(tester);

    await tester.runAsync(() async {
      await expectLater(bancoDaAna.select(bancoDaAna.provas).get(), throwsA(anything));
    });
    expect(tester.takeException(), isNull);
  });

  testWidgets('trocar direto de conta troca o banco', (tester) async {
    await abrirSessao(tester);
    await entrar(tester, 'a@escola.com');
    await criarProva(tester, 'Prova da Ana');

    await entrar(tester, 'b@escola.com');

    esperarNaLista(tester);
    expect(bancosAbertos, ['provafacil_u1', 'provafacil_u2']);
    expect(find.text('Prova da Ana'), findsNothing);
  });

  testWidgets('atualizar o perfil da mesma conta não reabre o banco', (tester) async {
    await abrirSessao(tester);
    await entrar(tester, 'a@escola.com');

    // O aviso do AuthRepository sem mudar de conta (como a atualização do perfil).
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    auth.notifyListeners();
    await esperarBanco(tester);

    expect(bancosAbertos, ['provafacil_u1']);
    esperarNaLista(tester);
  });
}
