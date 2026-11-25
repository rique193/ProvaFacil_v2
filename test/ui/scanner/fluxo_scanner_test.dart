import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provafacil/data/backup/backup_resultados.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../ajudantes/app_de_teste.dart';

/// Cadastra uma prova de [totalQuestoes] questões com gabarito (alternativa A em todas).
Future<int> _cadastrarProva(AppDatabase db, {int totalQuestoes = 10, bool comGabarito = true}) async {
  final provas = ProvaRepository(db);
  final provaId = await provas.salvarConteudoProva(
    provaId: null,
    titulo: 'Prova de Matemática',
    disciplina: 'Matemática',
    descricao: '',
    questoes: [
      for (var i = 1; i <= totalQuestoes; i++)
        QuestaoInput(
          enunciado: 'Enunciado $i',
          alternativas: [
            for (final l in ['A', 'B', 'C', 'D', 'E']) AlternativaInput(texto: 'Alternativa $l'),
          ],
        ),
    ],
  );
  if (comGabarito) {
    final prova = (await provas.observarProva(provaId).first)!;
    await provas.salvarGabarito(provaId, {
      for (final q in prova.questoes) q.questao.id: q.alternativas.firstWhere((a) => a.ordem == 0).id,
    });
  }
  return provaId;
}

Future<void> _cadastrarAluno(AppDatabase db, String nome, String turma) =>
    db.into(db.alunos).insert(AlunosCompanion.insert(nome: nome, turma: Value(turma)));

void main() {
  setUpAll(() => initializeDateFormatting('pt_BR'));

  testWidgets('lê o QR Code, a folha e abre a correção já preenchida', (tester) async {
    final db = criarBancoParaWidgetTest();
    late int provaId;
    await tester.runAsync(() async {
      provaId = await _cadastrarProva(db);
      await _cadastrarAluno(db, 'Ana Souza', 'A');
    });

    await abrirApp(tester, rotaScanQr(provaId), database: db, backup: BackupResultados.desativado);

    expect(find.text('QR Code identificado'), findsOneWidget);
    expect(find.text('Prova de Matemática'), findsOneWidget);
    expect(find.text('Ana Souza'), findsWidgets);

    await tester.tap(find.text('Continuar para as respostas'));
    await esperarBanco(tester);
    expect(find.text('Ler Respostas'), findsOneWidget);
    expect(find.text('Aguardando a leitura da folha'), findsOneWidget);

    await tester.tap(find.byKey(const Key('botao_ler_folha')));
    await esperarBanco(tester);
    expect(find.text('Folha lida'), findsOneWidget);
    expect(find.textContaining('questões detectadas'), findsOneWidget);

    await tester.tap(find.text('Conferir e corrigir'));
    await esperarBanco(tester);
    expect(find.text('Corrigir Prova'), findsWidgets);
    expect(find.text('Ana Souza'), findsWidgets);
  });

  testWidgets('QR Code inválido não deixa continuar', (tester) async {
    final db = criarBancoParaWidgetTest();
    late int provaId;
    await tester.runAsync(() async {
      provaId = await _cadastrarProva(db);
      await _cadastrarAluno(db, 'Ana Souza', 'A');
    });

    await abrirApp(tester, rotaScanQr(provaId), database: db);
    await tester.tap(find.text('Simular QR Code inválido'));
    await tester.pumpAndSettle();

    expect(find.text('QR Code inválido'), findsOneWidget);
    expect(find.text('Este QR Code não é de uma folha de respostas do ProvaFácil.'), findsOneWidget);
    final botao = tester.widget<FilledButton>(
      find.ancestor(of: find.text('Continuar para as respostas'), matching: find.byType(FilledButton)),
    );
    expect(botao.onPressed, isNull);
  });

  testWidgets('sem alunos cadastrados pede o cadastro', (tester) async {
    final db = criarBancoParaWidgetTest();
    late int provaId;
    await tester.runAsync(() async => provaId = await _cadastrarProva(db));

    await abrirApp(tester, rotaScanQr(provaId), database: db);

    expect(find.textContaining('Nenhum aluno cadastrado'), findsOneWidget);
  });

  testWidgets('folha em branco é bloqueada', (tester) async {
    final db = criarBancoParaWidgetTest();
    late int provaId;
    await tester.runAsync(() async => provaId = await _cadastrarProva(db));

    await abrirApp(tester, rotaScanRespostas(provaId, 'PROVAFACIL|1|$provaId|Ana Souza|A'), database: db);
    await tester.ensureVisible(find.text('Folha em branco'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Folha em branco'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('botao_ler_folha')));
    await esperarBanco(tester);

    expect(find.text('Leitura não aceita'), findsOneWidget);
    expect(find.textContaining('Nenhuma marcação foi detectada'), findsOneWidget);
  });

  testWidgets('prova sem gabarito é bloqueada', (tester) async {
    final db = criarBancoParaWidgetTest();
    late int provaId;
    await tester.runAsync(() async => provaId = await _cadastrarProva(db, comGabarito: false));

    await abrirApp(tester, rotaScanRespostas(provaId, 'PROVAFACIL|1|$provaId|Ana Souza|A'), database: db);
    await tester.tap(find.byKey(const Key('botao_ler_folha')));
    await esperarBanco(tester);

    expect(find.text('Leitura não aceita'), findsOneWidget);
    expect(find.textContaining('ainda não tem gabarito'), findsOneWidget);
  });
}
