import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../ajudantes/app_de_teste.dart';
import '../../ajudantes/correcao_simulada.dart';

void main() {
  testWidgets('mostra a nota com 1 casa e a média com 2 casas, com vírgula', (
    tester,
  ) async {
    final db = criarBancoParaWidgetTest();
    final provaId = (await tester.runAsync(() async {
      final id = await criarProvaComGabarito(db, gabarito: ['A', 'B']);
      await gravarCorrecao(
        db,
        provaId: id,
        nome: 'Ana',
        turma: 'Turma A',
        respostas: {
          1: {'A'},
          2: {'B'},
        },
      );
      await gravarCorrecao(
        db,
        provaId: id,
        nome: 'Bia',
        turma: 'Turma A',
        respostas: {
          1: {'A'},
          2: {'C'},
        },
      );
      return id;
    }))!;

    await abrirApp(tester, rotaRelatorio(provaId), database: db);

    expect(find.text('7,50'), findsOneWidget);
    expect(find.text('10,0'), findsNWidgets(2));
    expect(find.text('5,0'), findsNWidgets(2));
    expect(find.textContaining('.'), findsNothing);
  });

  testWidgets(
    'mostra o status, o progresso e os alunos da turma ainda não corrigidos',
    (tester) async {
      final db = criarBancoParaWidgetTest();
      final provaId = (await tester.runAsync(() async {
        final id = await criarProvaComGabarito(db, gabarito: ['A', 'B']);
        await (db.update(db.provas)..where((p) => p.id.equals(id))).write(
          const ProvasCompanion(turma: Value('Turma A')),
        );
        await gravarCorrecao(
          db,
          provaId: id,
          nome: 'Ana',
          turma: 'Turma A',
          respostas: {
            1: {'A'},
          },
        );
        for (final nome in ['Bia', 'Caio']) {
          await db
              .into(db.alunos)
              .insert(
                AlunosCompanion.insert(
                  nome: nome,
                  turma: const Value('Turma A'),
                ),
              );
        }
        return id;
      }))!;

      await abrirApp(tester, rotaRelatorio(provaId), database: db);

      expect(find.text('Em correção'), findsOneWidget);
      expect(find.text('1 de 3 alunos corrigidos'), findsOneWidget);
      expect(find.text('Bia, Caio'), findsOneWidget);
    },
  );
}
