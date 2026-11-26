import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/repository/auth_repository.dart';
import 'package:provafacil/ui/auth/auth_rotas.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../ajudantes/app_de_teste.dart';
import '../../ajudantes/autenticacao_falsa.dart';

const _subtituloLogin = 'Entre com sua conta de professor';

void main() {
  group('redirecionarPorLogin', () {
    String? redirecionar(bool logado, String local) =>
        redirecionarPorLogin(logado: logado, local: local, aposEntrar: rotaLista);

    test('deslogado vai para o login, menos no login e no cadastro', () {
      expect(redirecionar(false, rotaLista), rotaLogin);
      expect(redirecionar(false, rotaAlunos), rotaLogin);
      expect(redirecionar(false, '/provas/3/gabarito'), rotaLogin);
      expect(redirecionar(false, rotaLogin), isNull);
      expect(redirecionar(false, rotaCadastro), isNull);
    });

    test('logado sai do login e do cadastro e abre o resto normalmente', () {
      expect(redirecionar(true, rotaLogin), rotaLista);
      expect(redirecionar(true, rotaCadastro), rotaLista);
      expect(redirecionar(true, rotaLista), isNull);
      expect(redirecionar(true, rotaHistorico), isNull);
    });
  });

  group('rotas com login', () {
    late ServicoAutenticacaoFalso servico;
    late AuthRepository auth;

    setUp(() {
      servico = ServicoAutenticacaoFalso();
      auth = AuthRepository(servico);
    });

    tearDown(() => auth.dispose());

    Future<void> digitar(WidgetTester tester, String campo, String texto) =>
        tester.enterText(find.widgetWithText(TextField, campo), texto);

    testWidgets('deslogado, abrir a lista de provas leva ao login', (tester) async {
      await abrirApp(tester, rotaLista, auth: auth);

      expect(find.text(_subtituloLogin), findsOneWidget);
      expect(find.text('Dashboard'), findsNothing);
    });

    testWidgets('deslogado pode abrir o cadastro', (tester) async {
      await abrirApp(tester, rotaCadastro, auth: auth);

      expect(find.text('Nova conta'), findsOneWidget);
    });

    testWidgets('logado, abrir o login leva à lista de provas', (tester) async {
      final logado = authLogado();
      addTearDown(logado.dispose);

      await abrirApp(tester, rotaLogin, auth: logado);

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text(_subtituloLogin), findsNothing);
    });

    testWidgets('criar uma conta pela tela já entra no app', (tester) async {
      await abrirApp(tester, rotaLista, auth: auth);

      await tester.tap(find.widgetWithText(TextButton, 'Criar conta'));
      await tester.pumpAndSettle();
      expect(find.text('Nova conta'), findsOneWidget);

      await digitar(tester, 'Nome', 'Bruno Costa');
      await digitar(tester, 'E-mail', 'bruno@escola.com');
      await digitar(tester, 'Senha', 'segredo1');
      await digitar(tester, 'Confirmar senha', 'segredo1');
      await tester.tap(find.widgetWithText(FilledButton, 'Criar conta'));
      await esperarBanco(tester);

      expect(find.text('Dashboard'), findsOneWidget);
      expect(auth.usuario?.nome, 'Bruno Costa');
    });

    testWidgets('cadastro com senhas diferentes avisa e não cria a conta', (tester) async {
      await abrirApp(tester, rotaCadastro, auth: auth);

      await digitar(tester, 'Nome', 'Bruno Costa');
      await digitar(tester, 'E-mail', 'bruno@escola.com');
      await digitar(tester, 'Senha', 'segredo1');
      await digitar(tester, 'Confirmar senha', 'segredo2');
      await tester.tap(find.widgetWithText(FilledButton, 'Criar conta'));
      await tester.pumpAndSettle();

      expect(find.text('As senhas não conferem.'), findsOneWidget);
      expect(servico.chamadasCadastrar, 0);
    });

    testWidgets('fazer login com a conta criada', (tester) async {
      servico.adicionarConta(email: 'ana@escola.com', senha: 'segredo1', nome: 'Ana Lima');
      await abrirApp(tester, rotaLogin, auth: auth);

      await digitar(tester, 'E-mail', 'ana@escola.com');
      await digitar(tester, 'Senha', 'segredo1');
      await tester.tap(find.widgetWithText(FilledButton, 'Entrar'));
      await esperarBanco(tester);

      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('senha errada mostra o erro e continua no login', (tester) async {
      servico.adicionarConta(email: 'ana@escola.com', senha: 'segredo1');
      await abrirApp(tester, rotaLogin, auth: auth);

      await digitar(tester, 'E-mail', 'ana@escola.com');
      await digitar(tester, 'Senha', 'errada1');
      await tester.tap(find.widgetWithText(FilledButton, 'Entrar'));
      await tester.pumpAndSettle();

      expect(find.text('E-mail ou senha incorretos.'), findsOneWidget);
      expect(find.text(_subtituloLogin), findsOneWidget);
    });

    testWidgets('mostrar senha troca o ícone do campo', (tester) async {
      await abrirApp(tester, rotaLogin, auth: auth);

      await tester.tap(find.byTooltip('Mostrar senha'));
      await tester.pump();

      expect(find.byTooltip('Ocultar senha'), findsOneWidget);
    });

    testWidgets('o menu da conta mostra o professor e Sair volta ao login', (tester) async {
      final logado = authLogado();
      addTearDown(logado.dispose);
      await abrirApp(tester, rotaLista, auth: logado);

      await tester.tap(find.byTooltip('Conta'));
      await tester.pumpAndSettle();
      expect(find.text('Ana Lima'), findsOneWidget);
      expect(find.text('ana@escola.com'), findsOneWidget);

      await tester.tap(find.text('Sair'));
      await tester.pumpAndSettle();

      expect(logado.logado, isFalse);
      expect(find.text(_subtituloLogin), findsOneWidget);
      expect(find.text('Dashboard'), findsNothing);
    });

    testWidgets('sem login ligado, a lista não mostra o menu da conta', (tester) async {
      await abrirApp(tester, rotaLista);

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.byTooltip('Conta'), findsNothing);
    });
  });
}
