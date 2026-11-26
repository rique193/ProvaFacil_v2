import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/historico_repository.dart';
import 'package:provafacil/ui/historico/historico_ui_state.dart';
import 'package:provafacil/ui/historico/historico_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  final abertos = <HistoricoViewModel>[];

  setUp(() {
    db = criarBancoEmMemoria();
    HistoricoViewModel.resetarSincronizacaoParaTeste();
  });

  tearDown(() async {
    for (final viewModel in abertos) {
      viewModel.dispose();
    }
    abertos.clear();
    HistoricoViewModel.resetarSincronizacaoParaTeste();
    await db.close();
  });

  Future<HistoricoViewModel> abrirHistorico(
    Future<void> Function() enviarTudoNuvem, {
    String? contaId,
  }) async {
    final viewModel = HistoricoViewModel(
      repository: HistoricoRepository(db),
      enviarTudoNuvem: enviarTudoNuvem,
      contaId: contaId,
    );
    abertos.add(viewModel);
    for (var i = 0; i < 200 && viewModel.uiState.carregando; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    // Dá tempo de o envio (que roda sem ser esperado) terminar ou falhar.
    await Future<void>.delayed(const Duration(milliseconds: 20));
    return viewModel;
  }

  test('envia para a nuvem uma vez por execução: a segunda abertura não envia de novo', () async {
    var envios = 0;
    Future<void> enviar() async => envios++;

    await abrirHistorico(enviar);
    expect(envios, 1);

    await abrirHistorico(enviar);
    await abrirHistorico(enviar);
    expect(envios, 1);
  });

  test('a sincronização vale por conta: outra conta envia, a mesma não repete', () async {
    var envios = <String>[];
    Future<void> enviarComo(String conta) async => envios.add(conta);

    await abrirHistorico(() => enviarComo('A'), contaId: 'uidA');
    await abrirHistorico(() => enviarComo('B'), contaId: 'uidB');
    await abrirHistorico(() => enviarComo('A'), contaId: 'uidA');
    await abrirHistorico(() => enviarComo('B'), contaId: 'uidB');

    expect(envios, ['A', 'B']);
  });

  test('falha no envio não aparece na tela e a próxima abertura tenta de novo', () async {
    var tentativas = 0;

    final comFalha = await abrirHistorico(() async {
      tentativas++;
      throw StateError('sem internet');
    });

    expect(tentativas, 1);
    expect(comFalha.uiState, const HistoricoUiState(carregando: false));

    final seguinte = await abrirHistorico(() async => tentativas++);

    expect(tentativas, 2);
    expect(seguinte.uiState, const HistoricoUiState(carregando: false));

    await abrirHistorico(() async => tentativas++);
    expect(tentativas, 2);
  });

  test('sem função de envio, não sincroniza e abre normalmente', () async {
    final viewModel = HistoricoViewModel(repository: HistoricoRepository(db));
    abertos.add(viewModel);

    for (var i = 0; i < 200 && viewModel.uiState.carregando; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }

    expect(viewModel.uiState, const HistoricoUiState(carregando: false));
  });
}
