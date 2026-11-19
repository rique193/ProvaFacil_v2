import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/correcao/fluxo_correcao.dart';
import 'cenario_folha.dart';
import 'componentes_scanner.dart';
import 'scan_respostas_view_model.dart';

/// Tela "Ler Respostas" (simulada). O botão redondo "fotografa" a folha; a leitura é conferida com
/// a prova (gabarito, número de questões, alternativas) e, se estiver tudo certo, segue para a
/// tela de correção já com a prova, o aluno e as respostas preenchidos.
///
/// [onFinalizar] recebe a folha conferida, com o aluno do QR Code e as respostas lidas.
class ScanRespostasScreen extends StatelessWidget {
  const ScanRespostasScreen({super.key, required this.onVoltar, required this.onFinalizar});

  final VoidCallback onVoltar;
  final void Function(Pronta folha) onFinalizar;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ScanRespostasViewModel>();
    final uiState = vm.uiState;
    final conferencia = uiState.conferencia;

    return Scaffold(
      backgroundColor: corFundoCamera,
      body: SafeArea(
        child: Column(
          children: [
            CabecalhoScanner(
              titulo: 'Ler Respostas',
              subtitulo: uiState.dadosQr?.aluno,
              onVoltar: onVoltar,
            ),
            _SeloStatus(conferencia: conferencia),
            const SizedBox(height: 12),
            // Cenário da simulação.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  for (final cenario in CenarioFolha.values)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(cenario.descricao),
                        selected: cenario == uiState.cenario,
                        onSelected: (_) => vm.selecionarCenario(cenario),
                        showCheckmark: false,
                        backgroundColor: corFundoCamera,
                        selectedColor: corAzul,
                        labelStyle: const TextStyle(color: Colors.white),
                        side: BorderSide(color: Colors.white.withValues(alpha: 0.5)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: conferencia == null
                  ? _Camera(vm: vm)
                  : _PainelResultadoLeitura(
                      conferencia: conferencia,
                      onContinuar: onFinalizar,
                      onLerNovamente: vm.lerNovamente,
                      onVoltar: onVoltar,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Camera extends StatelessWidget {
  const _Camera({required this.vm});

  final ScanRespostasViewModel vm;

  @override
  Widget build(BuildContext context) {
    final uiState = vm.uiState;
    return Column(
      children: [
        // Moldura da câmera com proporção parecida com uma folha A4.
        Expanded(
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: uiState.lendo
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 1),
                        Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 1),
                      ],
                    ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            uiState.erro ?? 'Alinhe a folha de respostas dentro da moldura e\nmantenha o celular parado',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: uiState.erro != null ? corErroScanner : Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Botão redondo de "tirar foto".
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Semantics(
            button: true,
            label: 'Ler folha',
            child: SizedBox(
              width: 80,
              height: 80,
              child: ElevatedButton(
                key: const Key('botao_ler_folha'),
                onPressed: uiState.lendo ? null : vm.lerFolha,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SeloStatus extends StatelessWidget {
  const _SeloStatus({required this.conferencia});

  final ConferenciaFolha? conferencia;

  @override
  Widget build(BuildContext context) {
    final (cor, texto) = switch (conferencia) {
      null => (corAzul, 'Aguardando a leitura da folha'),
      Pronta(:final validacao) => (
        validacao.completa ? corVerde : corAviso,
        '${validacao.detectadas} de ${validacao.totalQuestoes} questões detectadas',
      ),
      Bloqueada() => (corErroScanner, 'Não é possível corrigir esta folha'),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: cor, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              conferencia is Bloqueada ? Icons.warning : Icons.check,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                texto,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PainelResultadoLeitura extends StatelessWidget {
  const _PainelResultadoLeitura({
    required this.conferencia,
    required this.onContinuar,
    required this.onLerNovamente,
    required this.onVoltar,
  });

  final ConferenciaFolha conferencia;
  final void Function(Pronta folha) onContinuar;
  final VoidCallback onLerNovamente;
  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: CartaoScanner(
          child: switch (conferencia) {
            final Pronta pronta => _conteudoPronta(pronta),
            final Bloqueada bloqueada => _conteudoBloqueada(bloqueada),
          },
        ),
      ),
    );
  }

  Widget _conteudoPronta(Pronta pronta) {
    final validacao = pronta.validacao;
    final titulo = pronta.prova.titulo.trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Folha lida',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        const SizedBox(height: 8),
        LinhaDado(titulo: 'Prova', valor: titulo.isEmpty ? 'Prova nº ${pronta.prova.provaId}' : titulo),
        LinhaDado(titulo: 'Aluno', valor: pronta.dadosQr.aluno),
        LinhaDado(
          titulo: 'Lidas',
          valor: '${validacao.detectadas} de ${validacao.totalQuestoes} questões',
        ),
        if (validacao.temAvisos) ...[
          const SizedBox(height: 12),
          for (final aviso in validacao.avisos)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning, color: corAviso, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(aviso, style: const TextStyle(color: Colors.black87, fontSize: 13)),
                  ),
                ],
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Você pode ajustar as marcações na próxima tela antes de corrigir.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
        const SizedBox(height: 16),
        BotaoScanner(texto: 'Conferir e corrigir', onPressed: () => onContinuar(pronta)),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: onLerNovamente, child: const Text('Ler de novo')),
        ),
      ],
    );
  }

  Widget _conteudoBloqueada(Bloqueada bloqueada) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            Icon(Icons.warning, color: corErroScanner),
            SizedBox(width: 8),
            Text(
              'Leitura não aceita',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(bloqueada.mensagem, style: const TextStyle(color: corErroScanner, fontSize: 14)),
        const SizedBox(height: 16),
        BotaoScanner(texto: 'Ler de novo', onPressed: onLerNovamente),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: onVoltar, child: const Text('Voltar ao QR Code')),
        ),
      ],
    );
  }
}
