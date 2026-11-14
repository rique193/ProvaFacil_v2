import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../../ajudantes/app_de_teste.dart';

Future<void> digitar(WidgetTester tester, String label, String texto) async {
  final campo = find.widgetWithText(TextField, label);
  await tester.ensureVisible(campo);
  await tester.enterText(campo, texto);
}

Future<void> preencherProva(WidgetTester tester) async {
  await digitar(tester, 'Título da prova', 'Prova de Ciências');
  await digitar(tester, 'Disciplina', 'Ciências');
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
    await abrirApp(tester, rotaLista);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await preencherProva(tester);
    await salvar(tester);

    expect(find.text('Salvar Gabarito'), findsOneWidget);
    expect(find.text('Ciências — Prova de Ciências · 1 questões'), findsOneWidget);

    await tester.tap(find.byTooltip('Voltar'));
    await tester.pumpAndSettle();
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('edição salva só fecha o formulário', (tester) async {
    final db = await abrirApp(tester, rotaLista);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
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
  });
}
