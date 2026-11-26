import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../../ajudantes/app_de_teste.dart';
import '../../../ajudantes/cenarios_geracao_prova.dart';

Future<void> escolherCadastro(
  WidgetTester tester,
  int indice,
  String valor,
) async {
  await tester.tap(find.byType(DropdownButtonFormField<String>).at(indice));
  await tester.pumpAndSettle();
  await tester.tap(find.text(valor).last);
  await tester.pumpAndSettle();
}

Future<AppDatabase> prepararGeracao(WidgetTester tester) async {
  final db = criarBancoParaWidgetTest();
  await tester.runAsync(() async {
    await cadastrarTurmaEDisciplinas(db);
    await cadastrarQuestoesBanco(db, quantidade: 2);
    await cadastrarQuestoesBanco(db, quantidade: 1, disciplina: 'História');
  });
  await abrirApp(tester, rotaLista, database: db);
  await tester.tap(find.byType(FloatingActionButton));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Gerar prova do banco'));
  await esperarBanco(tester);
  return db;
}

void main() {
  testWidgets(
    'menu abre geração, filtra questões e gera uma prova pronta para visualizar',
    (tester) async {
      final db = await prepararGeracao(tester);
      expect(
        find.text('Escolha uma disciplina para ver as questões.'),
        findsOneWidget,
      );
      expect(
        tester
            .widget<SwitchListTile>(
              find.widgetWithText(SwitchListTile, 'Embaralhar questões'),
            )
            .value,
        isTrue,
      );
      expect(
        tester
            .widget<SwitchListTile>(
              find.widgetWithText(SwitchListTile, 'Embaralhar alternativas'),
            )
            .value,
        isTrue,
      );
      await tester.enterText(
        find.widgetWithText(TextField, 'Título da prova'),
        'Prova gerada',
      );
      await escolherCadastro(tester, 0, 'Matemática');
      await escolherCadastro(tester, 1, 'Turma A');
      expect(find.text('Questão 1 de História'), findsNothing);
      await tester.tap(find.text('Selecionar todas'));
      await tester.pump();
      expect(find.text('2 selecionada(s)'), findsOneWidget);
      await tester.tap(find.text('Embaralhar questões'));
      await tester.tap(find.text('Embaralhar alternativas'));
      await tester.tap(find.widgetWithText(FilledButton, 'Gerar prova'));
      await esperarBanco(tester);
      expect(find.text('Visualizar prova'), findsOneWidget);
      expect(find.text('Prova gerada'), findsOneWidget);
      expect(find.text('Turma: Turma A'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsNWidgets(2));
      final provas = await tester.runAsync(
        () => ProvaRepository(db).observarProvas().first,
      );
      expect(provas, hasLength(1));
      expect(provas!.single.questoes, hasLength(2));
      await tester.tap(find.byTooltip('Voltar'));
      await esperarBanco(tester);
      expect(find.text('Dashboard'), findsOneWidget);
    },
  );

  testWidgets(
    'trocar disciplina limpa seleção e formulário vazio informa o erro',
    (tester) async {
      await prepararGeracao(tester);
      await tester.tap(find.widgetWithText(FilledButton, 'Gerar prova'));
      await tester.pump();
      expect(find.text('Informe o título da prova.'), findsOneWidget);
      await escolherCadastro(tester, 0, 'Matemática');
      await tester.tap(find.text('Selecionar todas'));
      await tester.pump();
      expect(find.text('2 selecionada(s)'), findsOneWidget);
      await escolherCadastro(tester, 0, 'História');
      expect(find.text('0 selecionada(s)'), findsOneWidget);
      expect(find.text('Questão 1 de História'), findsOneWidget);
      expect(find.text('Questão 1 de Matemática'), findsNothing);
    },
  );

  testWidgets(
    'disciplina sem questões mostra aviso e atalho do contrato combinado',
    (tester) async {
      final db = criarBancoParaWidgetTest();
      await tester.runAsync(() => cadastrarTurmaEDisciplinas(db));
      await abrirApp(tester, rotaGerarProva(), database: db);
      await escolherCadastro(tester, 0, 'História');
      expect(
        find.text('Nenhuma questão cadastrada nesta disciplina.'),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(OutlinedButton, 'Abrir Banco de Questões'),
        findsOneWidget,
      );
    },
  );
}
