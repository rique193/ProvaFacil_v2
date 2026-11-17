import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/ui/correcao/correcao_rotas.dart';
import 'package:provafacil/ui/correcao/corrigir/correcao_view_model.dart';
import 'package:provafacil/ui/theme/theme.dart';

Future<void> esperar(WidgetTester t) async {
  for (var i = 0; i < 3; i++) {
    await t.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await t.pump();
  }
  await t.pumpAndSettle();
}

void main() {
  setUpAll(() => initializeDateFormatting('pt_BR'));
  test('rota codifica aluno, turma e respostas; omite campos vazios', () {
    final uri = Uri.parse(
      rotaCorrecao(
        provaId: 7,
        aluno: 'Ana & João/?',
        turma: 'Turma A+B',
        respostasLidas: {
          1: {'A'},
          3: {'D', 'B'},
        },
      ),
    );
    expect(uri.path, '/correcao');
    expect(uri.queryParameters, {
      'provaId': '7',
      'aluno': 'Ana & João/?',
      'turma': 'Turma A+B',
      'respostas': 'A,,BD',
    });
    expect(rotaCorrecao(), '/correcao?provaId=-1');
    expect(rotaResultado(42), '/resultados/42');
  });
  for (final escuro in [false, true]) {
    testWidgets(
      'confirma folha e substitui rota de correção (${escuro ? 'escuro' : 'claro'})',
      (t) async {
        final db = AppDatabase(
          DatabaseConnection(
            NativeDatabase.memory(),
            closeStreamsSynchronously: true,
          ),
        );
        late int provaId;
        await t.runAsync(() async {
          final provas = ProvaRepository(db);
          provaId = await provas.salvarConteudoProva(
            provaId: null,
            titulo: 'Prova teste',
            disciplina: 'Matemática',
            descricao: '',
            questoes: [
              for (var i = 1; i <= 4; i++)
                QuestaoInput(
                  enunciado: 'Enunciado $i',
                  alternativas: [
                    for (final l in ['A', 'B', 'C', 'D', 'E'])
                      AlternativaInput(texto: 'Alternativa $l'),
                  ],
                ),
            ],
          );
          final p = (await provas.observarProva(provaId).first)!;
          await provas.salvarGabarito(provaId, {
            for (final q in p.questoes)
              q.questao.id: q.alternativas.firstWhere((a) => a.ordem == 0).id,
          });
        });
        final router = GoRouter(
          initialLocation: '/inicio',
          routes: [
            GoRoute(
              path: '/inicio',
              builder: (context, state) => Scaffold(
                body: TextButton(
                  onPressed: () => context.push(
                    rotaCorrecao(
                      provaId: provaId,
                      aluno: 'Ana',
                      turma: 'Turma A',
                      respostasLidas: {
                        1: {'A'},
                        2: {'B', 'D'},
                        4: {'A'},
                      },
                    ),
                  ),
                  child: const Text('Abrir correção'),
                ),
              ),
            ),
            ...rotasDeCorrecao(aoConcluir: (context) => context.go('/inicio')),
          ],
        );
        t.view
          ..physicalSize = const Size(360, 780)
          ..devicePixelRatio = 1;
        addTearDown(t.view.reset);
        addTearDown(() async {
          await t.pumpWidget(const SizedBox.shrink());
          router.dispose();
          await t.runAsync(db.close);
        });
        await t.pumpWidget(
          Provider<AppDatabase>.value(
            value: db,
            child: MaterialApp.router(
              routerConfig: router,
              theme: escuro ? ProvaFacilTheme.escuro : ProvaFacilTheme.claro,
            ),
          ),
        );
        await t.tap(find.text('Abrir correção'));
        await esperar(t);
        expect(find.text('3 de 4 marcadas'), findsOneWidget);
        expect(t.takeException(), isNull);
        final vm = t
            .element(find.text('Respostas do aluno'))
            .read<CorrecaoViewModel>();
        await t.tap(find.widgetWithText(FilledButton, 'Corrigir Prova'));
        await t.pumpAndSettle();
        expect(find.text('Respostas incompletas'), findsOneWidget);
        expect(
          find.text('Em branco (contam como não respondidas): questão(ões) 3.'),
          findsOneWidget,
        );
        expect(
          find.text(
            'Mais de uma alternativa marcada (serão anuladas): questão(ões) 2.',
          ),
          findsOneWidget,
        );
        await t.tap(find.text('Revisar'));
        await t.pumpAndSettle();
        expect(vm.uiState.resultadoId, isNull);
        await t.tap(find.widgetWithText(FilledButton, 'Corrigir Prova'));
        await t.pumpAndSettle();
        await t.tap(find.text('Corrigir assim mesmo'));
        await esperar(t);
        expect(find.text('Resultado'), findsOneWidget);
        expect(find.text('5,0'), findsOneWidget);
        expect(find.text('50% de acerto'), findsOneWidget);
        await t.ensureVisible(find.text('Erros (1)'));
        await t.pumpAndSettle();
        await t.tap(find.text('Erros (1)'));
        await t.pumpAndSettle();
        expect(find.text('Anulada'), findsOneWidget);
        expect(t.takeException(), isNull);
        router.pop();
        await t.pumpAndSettle();
        expect(find.text('Abrir correção'), findsOneWidget);
        expect(find.text('Corrigir Prova'), findsNothing);
        await t.tap(find.text('Abrir correção'));
        await esperar(t);
        await t.tap(find.widgetWithText(FilledButton, 'Corrigir Prova'));
        await t.pumpAndSettle();
        await t.tap(find.text('Corrigir assim mesmo'));
        await esperar(t);
        await t.tap(find.text('Concluir'));
        await t.pumpAndSettle();
        expect(find.text('Abrir correção'), findsOneWidget);
      },
    );
  }
}
