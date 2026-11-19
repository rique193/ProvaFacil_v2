import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provafacil/data/backup/backup_resultados.dart';
import 'package:provafacil/data/backup/dados_backup.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../ajudantes/app_de_teste.dart';
import '../../ajudantes/correcao_simulada.dart';

void main() {
  setUpAll(() => initializeDateFormatting('pt_BR'));

  testWidgets('abrir o Histórico envia os alunos e resultados salvos para o backup', (tester) async {
    final db = criarBancoParaWidgetTest();
    await tester.runAsync(() async {
      final provaId = await criarProvaComGabarito(db, gabarito: ['A', 'B']);
      await gravarCorrecao(
        db,
        provaId: provaId,
        nome: 'Ana',
        turma: 'Turma A',
        respostas: {
          1: {'A'},
          2: {'B'},
        },
      );
    });
    final envios = <(List<AlunoEntity>, List<ResultadoParaBackup>)>[];

    await abrirApp(
      tester,
      rotaHistorico,
      database: db,
      backup: BackupResultados((alunos, resultados) async => envios.add((alunos, resultados))),
    );
    await esperarBanco(tester);

    expect(envios, hasLength(1));
    final (alunos, resultados) = envios.single;
    expect(alunos.map((a) => a.nome), ['Ana']);
    expect(resultados, hasLength(1));
    expect(resultados.single.resultado.nomeAluno, 'Ana');
    expect(resultados.single.respostas, hasLength(2));
  });
}
