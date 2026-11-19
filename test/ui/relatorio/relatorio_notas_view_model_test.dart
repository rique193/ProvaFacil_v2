import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/exportacao/exportador_relatorio.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/historico_repository.dart';
import 'package:provafacil/ui/relatorio/relatorio_notas_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';
import '../../ajudantes/correcao_simulada.dart';

void main() {
  late AppDatabase db;
  late int provaId;
  late RelatorioNotasViewModel viewModel;

  setUp(() async {
    db = criarBancoEmMemoria();
    provaId = await criarProvaComGabarito(db, gabarito: ['A', 'B'], titulo: 'Prova 1');
    viewModel = RelatorioNotasViewModel(
      repository: HistoricoRepository(db),
      exportador: ExportadorRelatorio(db),
      provaId: provaId,
    );
  });

  tearDown(() async {
    viewModel.dispose();
    await db.close();
  });

  Future<void> esperarAte(bool Function() condicao) async {
    for (var i = 0; i < 200 && !condicao(); i++) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    expect(condicao(), isTrue, reason: 'o estado não chegou ao esperado a tempo');
  }

  test('carrega a prova sem resultados', () async {
    await esperarAte(() => !viewModel.uiState.carregando);

    expect(viewModel.uiState.tituloProva, 'Prova 1');
    expect(viewModel.uiState.linhas, isEmpty);
  });

  test('uma correção nova atualiza o relatório aberto', () async {
    await esperarAte(() => !viewModel.uiState.carregando);

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
    await esperarAte(() => viewModel.uiState.linhas.length == 1);

    expect(viewModel.uiState.linhas.single.nome, 'Ana');
    expect(viewModel.uiState.linhas.single.nota, 10);
    expect(viewModel.uiState.mediaDaTurma, 10);

    await gravarCorrecao(
      db,
      provaId: provaId,
      nome: 'Bia',
      turma: 'Turma A',
      respostas: {
        1: {'A'},
        2: {'C'},
      },
    );
    await esperarAte(() => viewModel.uiState.linhas.length == 2);

    expect(viewModel.uiState.linhas.map((l) => l.nome), ['Ana', 'Bia']);
    expect(viewModel.uiState.mediaDaTurma, 7.5);
    expect(viewModel.uiState.maiorNota, 10);
    expect(viewModel.uiState.menorNota, 5);
  });
}
