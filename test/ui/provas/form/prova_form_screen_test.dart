import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/data/repository/turma_repository.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../../ajudantes/app_de_teste.dart';

Future<void> digitar(WidgetTester tester, String label, String texto) async {
  final campo = find.widgetWithText(TextField, label);
  await tester.ensureVisible(campo);
  await tester.enterText(campo, texto);
}

Future<void> selecionarDropdown(WidgetTester tester, Key key, String texto) async {
  final campo = find.byKey(key);
  await tester.ensureVisible(campo);
  await tester.tap(campo);
  await tester.pumpAndSettle();
  await tester.tap(find.text(texto).last);
  await tester.pumpAndSettle();
}

Future<void> cadastrarBase(WidgetTester tester, AppDatabase db) async {
  await tester.runAsync(() async {
    await DisciplinaRepository(db).salvar('Ciências');
    await TurmaRepository(db).salvar('A');
  });
  await esperarBanco(tester);
}

Future<void> preencherProva(WidgetTester tester) async {
  await digitar(tester, 'Título da prova', 'Prova de Ciências');
  await selecionarDropdown(tester, const Key('dropdown_disciplina_prova'), 'Ciências');
  await selecionarDropdown(tester, const Key('dropdown_turma_prova'), 'Turma A');
  await digitar(tester, 'Enunciado', 'O que é fotossíntese?');
  for (final letra in ['A', 'B', 'C', 'D', 'E']) {
    await digitar(tester, 'Alternativa $letra', 'Resposta $letra');
  }
}

Future<void> salvar(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Salvar prova'));
  await esperarBanco(tester);
}

void main() {
  testWidgets('mostra os textos do formulário de prova nova', (tester) async {
    await abrirApp(tester, rotaFormulario(null));

    expect(find.text('Informações Básicas'), findsOneWidget);
    expect(find.text('Nenhuma disciplina cadastrada.'), findsOneWidget);
    expect(find.text('Nenhuma turma cadastrada.'), findsOneWidget);
    expect(find.text('Questões'), findsOneWidget);
    expect(find.text('Questão 1'), findsOneWidget);
    expect(find.text('Alternativas'), findsOneWidget);
    expect(find.text('A resposta correta é definida na tela de Gabarito.'), findsOneWidget);
    expect(find.text('+ Adicionar Nova Questão'), findsOneWidget);
    expect(find.byTooltip('Excluir questão'), findsNothing);
  });

  testWidgets('salvar sem título mostra o erro', (tester) async {
    await abrirApp(tester, rotaFormulario(null));

    await tester.tap(find.byTooltip('Salvar prova'));
    await tester.pumpAndSettle();

    expect(find.text('Informe o título da prova.'), findsOneWidget);
  });

  testWidgets('adicionar questão mostra a lixeira em todas', (tester) async {
    await abrirApp(tester, rotaFormulario(null));

    await tester.ensureVisible(find.text('+ Adicionar Nova Questão'));
    await tester.tap(find.text('+ Adicionar Nova Questão'));
    await tester.pumpAndSettle();

    expect(find.text('Questão 2', skipOffstage: false), findsOneWidget);
    expect(find.byTooltip('Excluir questão', skipOffstage: false), findsNWidgets(2));
  });

  testWidgets('prova nova salva fecha o formulário e abre o Gabarito dela', (tester) async {
    final db = await abrirApp(tester, rotaLista);
    await cadastrarBase(tester, db);

    await tester.tap(find.byType(FloatingActionButton));
    await esperarBanco(tester);

    await preencherProva(tester);
    await salvar(tester);

    expect(find.text('Salvar Gabarito'), findsOneWidget);
    expect(find.text('Ciências — Prova de Ciências · 1 questões'), findsOneWidget);

    await tester.tap(find.byTooltip('Voltar'));
    await tester.pumpAndSettle();
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('edição salva só fecha o formulário e preserva a turma', (tester) async {
    final db = await abrirApp(tester, rotaLista);
    await cadastrarBase(tester, db);

    await tester.tap(find.byType(FloatingActionButton));
    await esperarBanco(tester);
    await preencherProva(tester);
    await salvar(tester);
    await tester.tap(find.byTooltip('Voltar'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Prova de Ciências'));
    await esperarBanco(tester);
    expect(find.text('Editar Prova'), findsOneWidget);

    await digitar(tester, 'Título da prova', 'Prova Editada');
    await salvar(tester);

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Prova Editada'), findsOneWidget);
    final provas = await tester.runAsync(() => db.select(db.provas).get());
    expect(provas!.single.titulo, 'Prova Editada');
    expect(provas.single.turma, 'Turma A');
  });
}