import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../domain/scanner/qr_code_prova.dart';
import 'componentes_scanner.dart';
import 'qr_code_scanner_view_model.dart';

/// Tela "Ler QR Code". Liga a câmera do celular e lê o QR Code impresso na folha de respostas;
/// mostra o que foi identificado (prova, aluno e turma) ou o motivo de o QR Code ser inválido.
/// Só deixa continuar com um QR Code válido e da prova escolhida.
///
/// Sem câmera (emulador, permissão negada), dá para trocar para o modo simulação, que monta o
/// QR Code com um aluno cadastrado.
///
/// [onContinuar] recebe o texto lido do QR Code, que segue para a leitura das respostas.
class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key, required this.onVoltar, required this.onContinuar});

  final VoidCallback onVoltar;
  final void Function(String textoQr) onContinuar;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<QrCodeScannerViewModel>();
    final uiState = vm.uiState;

    return Scaffold(
      backgroundColor: corFundoCamera,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, restricoes) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: restricoes.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    CabecalhoScanner(titulo: 'Ler QR Code', onVoltar: onVoltar),
                    const Spacer(),
                    if (uiState.usarCamera)
                      _VisorCamera(
                        onDetectar: vm.lerQrCodeDaCamera,
                        corBorda: _corDaBorda(uiState),
                        onUsarSimulacao: () => vm.alternarCamera(false),
                      )
                    else
                      _VisorSimulado(corBorda: _corDaBorda(uiState)),
                    const SizedBox(height: 16),
                    const Text(
                      'Aponte a câmera para o QR Code\nimpresso no cabeçalho da folha de respostas',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const Spacer(),
                    CartaoScanner(child: _conteudo(context, vm)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _corDaBorda(QrCodeScannerUiState uiState) {
    if (uiState.carregando || uiState.aguardandoCamera) return Colors.white;
    return uiState.podeContinuar ? corSucesso : corErroScanner;
  }

  Widget _conteudo(BuildContext context, QrCodeScannerViewModel vm) {
    final uiState = vm.uiState;
    if (uiState.carregando) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (uiState.erro != null) {
      return Text(uiState.erro!, style: const TextStyle(color: corErroScanner, fontSize: 14));
    }
    if (uiState.usarCamera) return _conteudoCamera(vm);
    return _conteudoSimulacao(vm);
  }

  Widget _conteudoCamera(QrCodeScannerViewModel vm) {
    final uiState = vm.uiState;
    final trocarParaSimulacao = SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () => vm.alternarCamera(false),
        icon: const Icon(Icons.science_outlined, size: 18),
        label: const Text('Sem câmera? Usar a simulação'),
      ),
    );

    if (uiState.aguardandoCamera) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Procurando o QR Code…',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Enquadre o QR Code dentro da moldura. A leitura é automática.',
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
          const SizedBox(height: 8),
          trocarParaSimulacao,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ..._resultadoLeitura(uiState),
        const SizedBox(height: 16),
        _botaoContinuar(uiState),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            onPressed: vm.lerDeNovo,
            icon: const Icon(Icons.qr_code_scanner, size: 18),
            label: const Text('Ler outra folha'),
          ),
        ),
      ],
    );
  }

  Widget _conteudoSimulacao(QrCodeScannerViewModel vm) {
    final uiState = vm.uiState;
    final voltarParaCamera = SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () => vm.alternarCamera(true),
        icon: const Icon(Icons.photo_camera_outlined, size: 18),
        label: const Text('Usar a câmera'),
      ),
    );

    if (uiState.provaId == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Nenhuma prova cadastrada. Cadastre uma prova e o gabarito antes de corrigir.',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          voltarParaCamera,
        ],
      );
    }
    if (uiState.alunos.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Nenhum aluno cadastrado. Cadastre os alunos na tela de Alunos para simular a leitura das folhas.',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          voltarParaCamera,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ..._resultadoLeitura(uiState),
        const SizedBox(height: 16),
        // Controles da simulação (no lugar da câmera de verdade).
        const Text(
          'Simulação',
          style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        InputDecorator(
          decoration: const InputDecoration(
            labelText: 'Folha de',
            border: OutlineInputBorder(),
            isDense: true,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              key: const Key('seletor_aluno'),
              value: uiState.alunoSelecionadoId,
              isExpanded: true,
              isDense: true,
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              items: [
                for (final aluno in uiState.alunos)
                  DropdownMenuItem(
                    value: aluno.id,
                    child: Text(
                      aluno.turma.isEmpty ? aluno.nome : '${aluno.nome} (${aluno.turma})',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: uiState.simularQrInvalido
                  ? null
                  : (id) {
                      if (id != null) vm.selecionarAluno(id);
                    },
            ),
          ),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Simular QR Code inválido',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          value: uiState.simularQrInvalido,
          onChanged: vm.alternarQrInvalido,
        ),
        const SizedBox(height: 12),
        _botaoContinuar(uiState),
        voltarParaCamera,
      ],
    );
  }

  Widget _botaoContinuar(QrCodeScannerUiState uiState) => BotaoScanner(
    texto: 'Continuar para as respostas',
    icone: Icons.arrow_forward,
    onPressed: uiState.podeContinuar ? () => onContinuar(uiState.textoLido) : null,
  );

  /// Título, dados do QR Code (ou o motivo de ele não servir) e aviso de prova diferente.
  List<Widget> _resultadoLeitura(QrCodeScannerUiState uiState) => switch (uiState.leitura) {
    Valido(:final dados) => [
      const Row(
        children: [
          Icon(Icons.check_circle, color: corSucesso),
          SizedBox(width: 8),
          Text(
            'QR Code identificado',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            LinhaDado(
              titulo: 'Prova',
              valor: uiState.tituloDaProva(dados.provaId) ?? 'Prova nº ${dados.provaId}',
            ),
            LinhaDado(titulo: 'Aluno', valor: dados.aluno),
            LinhaDado(titulo: 'Turma', valor: dados.turma.isEmpty ? '—' : dados.turma),
          ],
        ),
      ),
      if (uiState.avisoProvaDiferente case final aviso?) ...[
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.warning, color: corErroScanner, size: 18),
            const SizedBox(width: 6),
            Expanded(
              child: Text(aviso, style: const TextStyle(color: corErroScanner, fontSize: 14)),
            ),
          ],
        ),
      ],
    ],
    Invalido(:final mensagem) => [
      const Row(
        children: [
          Icon(Icons.warning, color: corErroScanner),
          SizedBox(width: 8),
          Text(
            'QR Code inválido',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(mensagem, style: const TextStyle(color: corErroScanner, fontSize: 14)),
    ],
  };
}

/// Tamanho do visor quadrado onde aparece a imagem da câmera.
const _tamanhoVisor = 260.0;

/// Visor com a imagem da câmera de verdade. Cada QR Code detectado vai para [onDetectar].
class _VisorCamera extends StatefulWidget {
  const _VisorCamera({
    required this.onDetectar,
    required this.corBorda,
    required this.onUsarSimulacao,
  });

  final void Function(String? texto) onDetectar;
  final Color corBorda;
  final VoidCallback onUsarSimulacao;

  @override
  State<_VisorCamera> createState() => _VisorCameraState();
}

class _VisorCameraState extends State<_VisorCamera> with WidgetsBindingObserver {
  final _controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.normal,
  );

  /// `false` enquanto outra tela (a de respostas) está por cima desta.
  bool _visivel = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  /// Desliga a câmera quando outra tela é aberta por cima e religa ao voltar.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final visivel = TickerMode.valuesOf(context).enabled;
    if (visivel == _visivel) return;
    _visivel = visivel;
    if (!_controller.value.hasCameraPermission) return;
    unawaited(visivel ? _controller.start() : _controller.stop());
  }

  /// Com um controller próprio, o MobileScanner não cuida do app ir para o segundo plano.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_controller.value.hasCameraPermission) return;
    switch (state) {
      case AppLifecycleState.resumed:
        if (_visivel) unawaited(_controller.start());
      case AppLifecycleState.inactive:
        unawaited(_controller.stop());
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_controller.dispose());
    super.dispose();
  }

  /// Pede a câmera de novo (por exemplo, depois de o professor negar a permissão sem querer).
  Future<void> _tentarNovamente() async {
    if (_controller.value.isStarting) return;
    try {
      await _controller.start();
    } on MobileScannerException {
      // O erro fica no estado do controller e aparece de novo pelo errorBuilder.
    }
  }

  void _aoDetectar(BarcodeCapture captura) {
    for (final codigo in captura.barcodes) {
      final texto = codigo.rawValue;
      if (texto != null && texto.trim().isNotEmpty) {
        widget.onDetectar(texto);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _tamanhoVisor,
      height: _tamanhoVisor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: MobileScanner(
              controller: _controller,
              fit: BoxFit.cover,
              onDetect: _aoDetectar,
              errorBuilder: (context, erro) => _ErroCamera(
                erro: erro,
                onTentarNovamente: _tentarNovamente,
                onUsarSimulacao: widget.onUsarSimulacao,
              ),
            ),
          ),
          IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: widget.corBorda, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          // Lanterna, para ler a folha em sala com pouca luz.
          Positioned(
            right: 4,
            bottom: 4,
            child: ValueListenableBuilder<MobileScannerState>(
              valueListenable: _controller,
              builder: (context, estado, _) {
                if (estado.torchState == TorchState.unavailable) return const SizedBox.shrink();
                final ligada = estado.torchState == TorchState.on;
                return IconButton(
                  tooltip: ligada ? 'Desligar a lanterna' : 'Ligar a lanterna',
                  isSelected: ligada,
                  style: IconButton.styleFrom(backgroundColor: Colors.black45),
                  onPressed: _controller.toggleTorch,
                  icon: Icon(
                    ligada ? Icons.flash_on : Icons.flash_off,
                    color: ligada ? Colors.yellow : Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// O que aparece no visor quando a câmera não pôde ser ligada.
class _ErroCamera extends StatelessWidget {
  const _ErroCamera({
    required this.erro,
    required this.onTentarNovamente,
    required this.onUsarSimulacao,
  });

  final MobileScannerException erro;
  final VoidCallback onTentarNovamente;
  final VoidCallback onUsarSimulacao;

  @override
  Widget build(BuildContext context) {
    final mensagem = switch (erro.errorCode) {
      MobileScannerErrorCode.permissionDenied =>
        'O ProvaFácil precisa da câmera para ler o QR Code. Toque em "Tentar novamente" e permita o '
            'acesso. Se a janela não aparecer, libere a câmera em Configurações > Apps > ProvaFacil.',
      MobileScannerErrorCode.unsupported => 'Este aparelho não tem uma câmera compatível.',
      _ => 'Não foi possível ligar a câmera. Tente novamente ou use a simulação.',
    };
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.no_photography_outlined, color: Colors.white, size: 40),
              const SizedBox(height: 12),
              Text(
                mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 8),
              if (erro.errorCode != MobileScannerErrorCode.unsupported)
                TextButton.icon(
                  onPressed: onTentarNovamente,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Tentar novamente'),
                ),
              TextButton(onPressed: onUsarSimulacao, child: const Text('Usar a simulação')),
            ],
          ),
        ),
      ),
    );
  }
}

/// Visor do modo simulação, com a linha azul do "laser" no lugar da imagem da câmera.
class _VisorSimulado extends StatelessWidget {
  const _VisorSimulado({required this.corBorda});

  final Color corBorda;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: corBorda, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(height: 2, color: Colors.blue),
      ),
    );
  }
}
