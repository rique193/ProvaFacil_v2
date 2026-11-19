import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../ajudantes/app_de_teste.dart';
import '../../ajudantes/correcao_simulada.dart';

void main() {
  testWidgets('mostra a nota com 1 casa e a média com 2 casas, com vírgula', (tester) async {
    final db = criarBancoParaWidgetTest();
    final provaId = (await tester.runAsync(() async {
      final id = await criarProvaComGabarito(db, gabarito: ['A', 'B']);
      await gravarCorrecao(
        db,
        provaId: id,
        nome: 'Ana',
        turma: 'Turma A',
        respostas: {1: {'A'}, 2: {'B'}},
      );
      await gravarCorrecao(
        db,
        provaId: id,
        nome: 'Bia',
        turma: 'Turma A',
        respostas: {1: {'A'}, 2: {'C'}},
      );
      return id;
    }))!;

    await abrirApp(tester, rotaRelatorio(provaId), database: db);

    expect(find.text('7,50'), findsOneWidget);
    expect(find.text('10,0'), findsNWidgets(2));
    expect(find.text('5,0'), findsNWidgets(2));
    expect(find.textContaining('.'), findsNothing);
  });
}
