import 'package:drift/drift.dart' show DatabaseConnection;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/aluno_repository.dart';
import 'package:provafacil/ui/alunos/alunos_screen.dart';
import 'package:provafacil/ui/alunos/alunos_view_model.dart';
import 'package:provafacil/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../ajudantes/correcao_simulada.dart';

/// As consultas do drift só terminam com tempo real; o relógio falso do widget test não basta.
Future<void> esperarBanco(WidgetTester tester) async {
  for (var i = 0; i < 3; i++) {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

Future<AppDatabase> abrirTela(WidgetTester tester) async {
  final db = AppDatabase(
    DatabaseConnection(NativeDatabase.memory(), closeStreamsSynchronously: true),
  );
  tester.view
    ..physicalSize = const Size(800, 1600)
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  addTearDown(() async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.runAsync(db.close);
  });
  await tester.pumpWidget(
    MaterialApp(
      theme: ProvaFacilTheme.claro,
      home: ChangeNotifierProvider(
        create: (_) => AlunosViewModel(AlunoRepository(db)),
        child: AlunosScreen(onVoltar: () {}),
      ),
    ),
  );
  await esperarBanco(tester);
  return db;
}

Finder campo(String rotulo) => find.widgetWithText(TextField, rotulo);

Future<void> preencherAluno(
  WidgetTester tester, {
  String? nome,
  String? turma,
  String? matricula,
}) async {
  if (nome != null) await tester.enterText(campo('Nome'), nome);
  if (turma != null) await tester.enterText(campo('Turma'), turma);
  if (matricula != null) await tester.enterText(campo('Matrícula (opcional)'), matricula);
  await tester.pump();
}

Future<void> cadastrar(WidgetTester tester, String nome, String turma, {String? matricula}) async {
  await tester.tap(find.byType(FloatingActionButton));
  await tester.pumpAndSettle();
  await preencherAluno(tester, nome: nome, turma: turma, matricula: matricula);
  await tester.tap(find.text('Adicionar'));
  await esperarBanco(tester);
}

void main() {
  testWidgets('sem alunos mostra a orientação', (tester) async {
    await abrirTela(tester);
    expect(find.text('Alunos'), findsOneWidget);
    expect(
      find.text(
        'Nenhum aluno cadastrado ainda.\nToque em "Novo Aluno" ou corrija uma prova para começar.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('cadastra com a turma normalizada e agrupa pela turma', (tester) async {
    await abrirTela(tester);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Novo Aluno'), findsNWidgets(2)); // botão e título do diálogo
    expect(find.text('Ex.: "A" será salvo como "Turma A"'), findsOneWidget);
    await preencherAluno(tester, nome: 'Ana Souza', turma: '3b');
    expect(find.text('Será salvo como "Turma 3B"'), findsOneWidget);

    await tester.tap(find.text('Adicionar'));
    await esperarBanco(tester);

    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Turma 3B'), findsOneWidget);
    expect(find.text('Ana Souza'), findsOneWidget);
    expect(find.text('Sem matrícula'), findsOneWidget);
  });

  testWidgets('matrícula repetida mostra a recusa no diálogo', (tester) async {
    await abrirTela(tester);
    await cadastrar(tester, 'Ana Souza', 'A', matricula: '2023001');

    await cadastrar(tester, 'Bruno Lima', 'B', matricula: '2023001');

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(
      find.text('Já existe um aluno com a matrícula 2023001: Ana Souza (Turma A).'),
      findsOneWidget,
    );
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Bruno Lima'), findsNothing);
  });

  testWidgets('edita o aluno pelo mesmo diálogo', (tester) async {
    await abrirTela(tester);
    await cadastrar(tester, 'Ana Souza', 'A');

    await tester.tap(find.text('Ana Souza'));
    await tester.pumpAndSettle();
    expect(find.text('Editar aluno'), findsOneWidget);
    await preencherAluno(tester, nome: 'Ana Paula', matricula: '2023001');
    await tester.tap(find.text('Salvar'));
    await esperarBanco(tester);

    expect(find.text('Ana Paula'), findsOneWidget);
    expect(find.text('Matrícula: 2023001'), findsOneWidget);
  });

  testWidgets('excluir pede confirmação citando os resultados', (tester) async {
    final db = await abrirTela(tester);
    await cadastrar(tester, 'Ana Souza', 'A');
    await tester.runAsync(() async {
      final provaId = await criarProvaComGabarito(db, gabarito: ['A']);
      await gravarCorrecao(
        db,
        provaId: provaId,
        nome: 'Ana Souza',
        turma: 'Turma A',
        respostas: {
          1: {'A'},
        },
      );
    });
    await esperarBanco(tester);

    await tester.tap(find.text('Ana Souza'));
    await tester.pumpAndSettle();
    await preencherAluno(tester, nome: 'Nome sem salvar');
    await tester.tap(find.widgetWithText(TextButton, 'Excluir'));
    await esperarBanco(tester);

    expect(find.text('Excluir aluno'), findsOneWidget);
    expect(
      find.text('Excluir Ana Souza? 1 resultado de correção também será apagado.'),
      findsOneWidget,
    );

    await tester.tap(find.widgetWithText(TextButton, 'Excluir').last);
    await esperarBanco(tester);

    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Aluno excluído'), findsOneWidget);
    expect(await tester.runAsync(() => contarLinhas(db, 'resultados')), 0);
  });
}
