import 'package:flutter/foundation.dart';

import '../../data/repository/gabarito_mapper.dart';
import '../../data/repository/prova_repository.dart';
import '../../domain/correcao/fluxo_correcao.dart';
import '../../domain/scanner/qr_code_prova.dart';
import '../../util/mensagem_erro.dart';
import 'cenario_folha.dart';

@immutable
class ScanRespostasUiState {
  const ScanRespostasUiState({
    this.dadosQr,
    this.cenario = CenarioFolha.folhaDoAluno,
    this.lendo = false,
    this.conferencia,
    this.erro,
  });

  final DadosQrCode? dadosQr;
  final CenarioFolha cenario;
  final bool lendo;

  /// Resultado da última leitura; nulo enquanto a folha não foi "fotografada".
  final ConferenciaFolha? conferencia;
  final String? erro;

  ScanRespostasUiState copyWith({
    CenarioFolha? cenario,
    bool? lendo,
    ConferenciaFolha? Function()? conferencia,
    String? Function()? erro,
  }) => ScanRespostasUiState(
    dadosQr: dadosQr,
    cenario: cenario ?? this.cenario,
    lendo: lendo ?? this.lendo,
    conferencia: conferencia != null ? conferencia() : this.conferencia,
    erro: erro != null ? erro() : this.erro,
  );
}

/// Tela "Ler Respostas": simula a leitura da folha e a confere com a prova pelo
/// [FluxoCorrecao.conferirFolha] (QR Code válido, prova certa, gabarito completo, respostas
/// coerentes). Se a folha estiver pronta, a tela segue para a correção com os dados lidos.
class ScanRespostasViewModel extends ChangeNotifier {
  ScanRespostasViewModel(this._provaRepository, {this._provaEscolhidaId, this._textoQr})
    : _uiState = ScanRespostasUiState(
        dadosQr: switch (QrCodeProva.ler(_textoQr)) {
          Valido(:final dados) => dados,
          Invalido() => null,
        },
      );

  final ProvaRepository _provaRepository;
  final int? _provaEscolhidaId;
  final String? _textoQr;
  ScanRespostasUiState _uiState;
  ScanRespostasUiState get uiState => _uiState;
  bool _descartado = false;

  void selecionarCenario(CenarioFolha cenario) => _atualizar(
    (s) => s.copyWith(cenario: cenario, conferencia: () => null, erro: () => null),
  );

  /// O botão da câmera: "fotografa" a folha e confere a leitura com a prova.
  Future<void> lerFolha() async {
    if (_uiState.lendo) return;
    _atualizar((s) => s.copyWith(lendo: true, erro: () => null));
    try {
      final provas = await _provaRepository.observarProvas().first;
      ProvaParaCorrecao? buscarProva(int provaId) =>
          provas.where((p) => p.prova.id == provaId).firstOrNull?.paraCorrecao();

      final estado = _uiState;
      final dadosQr = estado.dadosQr;
      final respostasLidas = dadosQr == null
          ? const <int, Set<String>>{}
          : estado.cenario.lerFolha(buscarProva(dadosQr.provaId), dadosQr.aluno);
      final conferencia = FluxoCorrecao.conferirFolha(
        textoQr: _textoQr,
        respostasLidas: respostasLidas,
        provaEscolhidaId: _provaEscolhidaId,
        buscarProva: buscarProva,
      );
      _atualizar((s) => s.copyWith(lendo: false, conferencia: () => conferencia));
    } catch (erro) {
      _atualizar(
        (s) => s.copyWith(
          lendo: false,
          erro: () => mensagemDoErro(erro) ?? 'Não foi possível ler a folha.',
        ),
      );
    }
  }

  /// Descarta a leitura atual para tentar de novo.
  void lerNovamente() =>
      _atualizar((s) => s.copyWith(conferencia: () => null, erro: () => null));

  void _atualizar(ScanRespostasUiState Function(ScanRespostasUiState) mudanca) {
    if (_descartado) return;
    _uiState = mudanca(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}
