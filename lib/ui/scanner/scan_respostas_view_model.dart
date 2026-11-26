import 'package:flutter/foundation.dart';

import '../../data/repository/gabarito_mapper.dart';
import '../../data/repository/prova_repository.dart';
import '../../domain/correcao/fluxo_correcao.dart';
import '../../domain/scanner/leitor_folha_respostas.dart';
import '../../domain/scanner/qr_code_prova.dart';
import '../../util/mensagem_erro.dart';
import 'cenario_folha.dart';

/// Tira a foto da folha e devolve os bytes da imagem (nulo se o professor cancelar).
typedef FotografarFolha = Future<Uint8List?> Function();

/// Lê as marcações da foto (por padrão, em outro isolate, para não travar a tela).
typedef LerFotoDaFolha = Future<ResultadoLeituraFolha> Function(PedidoLeituraFolha pedido);

Future<ResultadoLeituraFolha> lerFotoEmSegundoPlano(PedidoLeituraFolha pedido) =>
    compute(LeitorFolhaRespostas.lerPedido, pedido);

@immutable
class ScanRespostasUiState {
  const ScanRespostasUiState({
    this.dadosQr,
    this.usarCamera = true,
    this.cenario = CenarioFolha.folhaDoAluno,
    this.lendo = false,
    this.conferencia,
    this.erro,
  });

  final DadosQrCode? dadosQr;

  /// `true`: as marcações vêm da foto da folha. `false`: modo simulação.
  final bool usarCamera;
  final CenarioFolha cenario;
  final bool lendo;

  /// Resultado da última leitura; nulo enquanto a folha não foi fotografada.
  final ConferenciaFolha? conferencia;
  final String? erro;

  ScanRespostasUiState copyWith({
    bool? usarCamera,
    CenarioFolha? cenario,
    bool? lendo,
    ConferenciaFolha? Function()? conferencia,
    String? Function()? erro,
  }) => ScanRespostasUiState(
    dadosQr: dadosQr,
    usarCamera: usarCamera ?? this.usarCamera,
    cenario: cenario ?? this.cenario,
    lendo: lendo ?? this.lendo,
    conferencia: conferencia != null ? conferencia() : this.conferencia,
    erro: erro != null ? erro() : this.erro,
  );
}

/// Tela "Ler Respostas": fotografa a folha, lê as bolinhas pintadas ([LeitorFolhaRespostas]) e
/// confere a leitura com a prova pelo [FluxoCorrecao.conferirFolha] (QR Code válido, prova certa,
/// gabarito completo, respostas coerentes). Se a folha estiver pronta, segue para a correção.
///
/// No modo simulação (sem câmera e nos testes), as marcações vêm de um [CenarioFolha].
class ScanRespostasViewModel extends ChangeNotifier {
  ScanRespostasViewModel(
    this._provaRepository, {
    this._provaEscolhidaId,
    this._textoQr,
    bool usarCamera = false,
    FotografarFolha? fotografar,
    this._lerFoto = lerFotoEmSegundoPlano,
  }) : _fotografar = fotografar,
       _uiState = ScanRespostasUiState(
         usarCamera: usarCamera && fotografar != null,
         dadosQr: switch (QrCodeProva.ler(_textoQr)) {
           Valido(:final dados) => dados,
           Invalido() => null,
         },
       );

  final ProvaRepository _provaRepository;
  final int? _provaEscolhidaId;
  final String? _textoQr;
  final FotografarFolha? _fotografar;
  final LerFotoDaFolha _lerFoto;
  ScanRespostasUiState _uiState;
  ScanRespostasUiState get uiState => _uiState;
  bool _descartado = false;

  /// Só dá para usar a câmera quando o app sabe tirar foto (nos testes, não).
  bool get cameraDisponivel => _fotografar != null;

  void selecionarCenario(CenarioFolha cenario) =>
      _atualizar((s) => s.copyWith(cenario: cenario, conferencia: () => null, erro: () => null));

  void alternarCamera(bool usarCamera) => _atualizar(
    (s) => s.copyWith(
      usarCamera: usarCamera && cameraDisponivel,
      conferencia: () => null,
      erro: () => null,
    ),
  );

  /// O botão da câmera: fotografa a folha (ou simula) e confere a leitura com a prova.
  Future<void> lerFolha() async {
    if (_uiState.lendo) return;
    _atualizar((s) => s.copyWith(lendo: true, erro: () => null));
    try {
      final provas = await _provaRepository.observarProvas().first;
      ProvaParaCorrecao? buscarProva(int provaId) =>
          provas.where((p) => p.prova.id == provaId).firstOrNull?.paraCorrecao();

      final estado = _uiState;
      final dadosQr = estado.dadosQr;
      final prova = dadosQr == null ? null : buscarProva(dadosQr.provaId);

      final Map<int, Set<String>> respostasLidas;
      if (estado.usarCamera && dadosQr != null && prova != null) {
        final foto = await _fotografar!();
        if (foto == null) {
          // O professor fechou a câmera sem tirar a foto.
          _atualizar((s) => s.copyWith(lendo: false));
          return;
        }
        final leitura = await _lerFoto((
          foto: foto,
          letrasPorQuestao: [for (final q in prova.questoes) q.letras],
        ));
        switch (leitura) {
          case FalhaLeituraFolha(:final mensagem):
            _atualizar((s) => s.copyWith(lendo: false, erro: () => mensagem));
            return;
          case FolhaLida(:final respostas):
            respostasLidas = respostas;
        }
      } else {
        respostasLidas = dadosQr == null
            ? const <int, Set<String>>{}
            : estado.cenario.lerFolha(prova, dadosQr.aluno);
      }

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
  void lerNovamente() => _atualizar((s) => s.copyWith(conferencia: () => null, erro: () => null));

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
