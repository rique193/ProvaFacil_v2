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
      titulo: 'Frações',
      disciplina: 'Matemática',
      descricao: '',
      questoes: [
        QuestaoInput(
          enunciado: 'Quanto é 1/2 + 1/2?',
          alternativas: [for (final t in ['0', '1', '2', '1/4', '1/2']) AlternativaInput(texto: t)],
        ),
      ],
    ),
  );
  await tester.pumpAndSettle();
  return id!;
}

void main() {
  testWidgets('lista vazia mostra o convite para criar a primeira prova', (tester) async {
    await abrirApp(tester, rotaLista);

    expect(find.text('Você tem 0 prova(s) cadastrada(s).'), findsOneWidget);
    expect(
      find.text("Nenhuma prova cadastrada ainda.\nToque em 'Nova Prova' para começar."),
      findsOneWidget,
    );
  });

  testWidgets('mostra a prova salva e atualiza ao excluir', (tester) async {
    final db = await abrirApp(tester, rotaLista);
    await criarProva(tester, db);

    expect(find.text('Você tem 1 prova(s) cadastrada(s).'), findsOneWidget);
    expect(find.text('Frações'), findsOneWidget);
    expect(find.text('Matemática'), findsOneWidget);
    expect(find.text('1 questão(ões)'), findsOneWidget);

    await tester.tap(find.byTooltip('Excluir prova'));
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
    await tester.pumpAndSettle();

    expect(find.text('Frações'), findsNothing);
    expect(find.text('Você tem 0 prova(s) cadastrada(s).'), findsOneWidget);
  });

  testWidgets('corrigir abre o scanner com o id da prova', (tester) async {
    final db = await abrirApp(tester, rotaLista);
    final id = await criarProva(tester, db);

    await tester.tap(find.text('Corrigir'));
    await tester.pumpAndSettle();

    expect(find.text('provaId: $id'), findsOneWidget);
  });

  testWidgets('alunos e histórico abrem as telas certas', (tester) async {
    await abrirApp(tester, rotaLista);

    await tester.tap(find.byTooltip('Alunos'));
    await tester.pumpAndSettle();
    expect(find.text('Alunos'), findsWidgets);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Histórico'));
    await tester.pumpAndSettle();
    expect(find.text('Historico'), findsWidgets);
  });

  testWidgets('nova prova abre o formulário', (tester) async {
    await abrirApp(tester, rotaLista);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsNothing);
  });
}
