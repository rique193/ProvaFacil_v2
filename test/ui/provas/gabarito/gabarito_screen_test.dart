import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../../ajudantes/app_de_teste.dart';

Future<int> criarProva(WidgetTester tester, AppDatabase db) async {
  final id = await tester.runAsync(
    () => ProvaRepository(db).salvarConteudoProva(
      provaId: null,
      titulo: 'Relevo',
      disciplina: 'Geografia',
      descricao: '',
      questoes: [
        for (final enunciado in ['Q1', 'Q2'])
          QuestaoInput(
            enunciado: enunciado,
            alternativas: [for (var i = 1; i <= 5; i++) AlternativaInput(texto: '$enunciado-$i')],
          ),
      ],
    ),
  );
  return id!;
}

Finder letra(int questao, String letra) => find.descendant(
  of: find.ancestor(of: find.text('Questão $questao'), matching: find.byType(Row)).first,
  matching: find.text(letra),
);

void main() {
  testWidgets('mostra o cabeçalho e o progresso das questões marcadas', (tester) async {
    final db = criarBancoParaWidgetTest();
    final id = await criarProva(tester, db);
    await abrirApp(tester, rotaGabarito(id), database: db);

    expect(find.text('Geografia — Relevo · 2 questões'), findsOneWidget);
    expect(find.text('0 de 2 preenchidas'), findsOneWidget);
    expect(find.text('0%'), findsOneWidget);

    await tester.tap(letra(1, 'C'));
    await tester.pump();

    expect(find.text('1 de 2 preenchidas'), findsOneWidget);
    expect(find.text('50%'), findsOneWidget);
  });

  testWidgets('salvar incompleto mostra o erro', (tester) async {
    final db = criarBancoParaWidgetTest();
    final id = await criarProva(tester, db);
    await abrirApp(tester, rotaGabarito(id), database: db);

    await tester.tap(letra(1, 'A'));
    await tester.tap(find.text('Salvar Gabarito'));
    await tester.pumpAndSettle();

    expect(find.text('Defina a resposta correta de todas as questões.'), findsOneWidget);
  });

  testWidgets('salvar completo grava e volta para a lista', (tester) async {
    final db = criarBancoParaWidgetTest();
    await criarProva(tester, db);
    await abrirApp(tester, rotaLista, database: db);
    await tester.tap(find.text('Ver Gabarito'));
    await esperarBanco(tester);

    await tester.tap(letra(1, 'B'));
    await tester.tap(letra(2, 'E'));
    await tester.tap(find.text('Salvar Gabarito'));
    await esperarBanco(tester);

    expect(find.text('Dashboard'), findsOneWidget);
    final corretas = await tester.runAsync(
      () => (db.select(db.alternativas)..where((a) => a.correta.equals(true))).get(),
    );
    expect(corretas!.map((a) => a.texto), unorderedEquals(['Q1-2', 'Q2-5']));
  });

  testWidgets('desabilita salvar quando a prova não tem questões', (tester) async {
    await abrirApp(tester, rotaGabarito(42));

    final botao = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(botao.onPressed, isNull);
  });
}
