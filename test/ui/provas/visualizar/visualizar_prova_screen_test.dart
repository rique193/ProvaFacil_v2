import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../../ajudantes/app_de_teste.dart';
import '../../../ajudantes/cenarios_geracao_prova.dart';

Future<int> gerarParaVisualizar(WidgetTester tester, AppDatabase db) async {
  return (await tester.runAsync(() async {
    final ids = await cadastrarQuestoesBanco(db, quantidade: 2);
    return ProvaRepository(db).gerarProvaDoBanco(
      titulo: 'Prova pronta',
      disciplina: 'Matemática',
      turma: 'Turma A',
      bancoQuestaoIds: ids,
      embaralharQuestoes: false,
      embaralharAlternativas: false,
    );
  }))!;
}

void main() {
  testWidgets(
    'tocar no card abre visualização somente leitura com dados e correta',
    (tester) async {
      final db = await abrirApp(tester, rotaLista);
      await gerarParaVisualizar(tester, db);
      await esperarBanco(tester);
      await tester.tap(find.text('Prova pronta'));
      await esperarBanco(tester);
      expect(find.text('Visualizar prova'), findsOneWidget);
      expect(find.text('Disciplina: Matemática'), findsOneWidget);
      expect(find.text('Turma: Turma A'), findsOneWidget);
      expect(find.text('2 questão(ões)'), findsOneWidget);
      expect(find.text('1. Questão 1 de Matemática'), findsOneWidget);
      expect(find.text('A. Resposta 1.0'), findsOneWidget);
      expect(find.text('E. Resposta 1.4'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsNWidgets(2));
      expect(find.byType(TextField), findsNothing);
      expect(find.text('Gabarito não definido'), findsNothing);
    },
  );

  testWidgets(
    'editar mantém turma e gabarito e visualização recebe a alteração',
    (tester) async {
      final db = await abrirApp(tester, rotaLista);
      await gerarParaVisualizar(tester, db);
      await esperarBanco(tester);
      await tester.tap(find.text('Prova pronta'));
      await esperarBanco(tester);
      await tester.tap(find.widgetWithText(OutlinedButton, 'Editar'));
      await esperarBanco(tester);
      expect(find.text('Editar Prova'), findsOneWidget);
      await tester.enterText(
        find.widgetWithText(TextField, 'Título da prova'),
        'Prova editada',
      );
      await tester.tap(find.byTooltip('Salvar prova'));
      await esperarBanco(tester);
      expect(find.text('Visualizar prova'), findsOneWidget);
      expect(find.text('Prova editada'), findsOneWidget);
      expect(find.text('Turma: Turma A'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsNWidgets(2));
    },
  );

  testWidgets('ações abrem gabarito já marcado, seleção de PDF e correção', (
    tester,
  ) async {
    final db = await abrirApp(tester, rotaLista);
    await gerarParaVisualizar(tester, db);
    await esperarBanco(tester);
    await tester.tap(find.text('Prova pronta'));
    await esperarBanco(tester);
    await tester.tap(find.widgetWithText(OutlinedButton, 'Gabarito'));
    await esperarBanco(tester);
    expect(find.text('2 de 2 preenchidas'), findsOneWidget);
    await tester.tap(find.byTooltip('Voltar'));
    await esperarBanco(tester);
    await tester.tap(find.text('Gerar PDF'));
    await esperarBanco(tester);
    expect(find.text('Gerar PDF da prova'), findsOneWidget);
    expect(find.textContaining('Nenhum aluno cadastrado'), findsOneWidget);
    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Corrigir'));
    await esperarBanco(tester);
    expect(find.text('Ler QR Code'), findsOneWidget);
  });

  testWidgets('prova manual sem gabarito informa que ele não foi definido', (
    tester,
  ) async {
    final db = criarBancoParaWidgetTest();
    final id = await tester.runAsync(
      () => ProvaRepository(db).salvarConteudoProva(
        provaId: null,
        titulo: 'Manual',
        disciplina: 'História',
        descricao: '',
        questoes: [
          QuestaoInput(
            enunciado: 'Pergunta',
            alternativas: [
              for (var i = 0; i < 5; i++) AlternativaInput(texto: 'Opção $i'),
            ],
          ),
        ],
      ),
    );
    await abrirApp(tester, rotaVisualizarProva(id!), database: db);
    expect(find.text('Gabarito não definido'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsNothing);
    expect(find.text('Turma: Não informada'), findsOneWidget);
  });

  testWidgets('prova inexistente mostra mensagem', (tester) async {
    await abrirApp(tester, rotaVisualizarProva(999));
    expect(find.text('Prova não encontrada.'), findsOneWidget);
  });
}
