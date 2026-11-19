import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/scanner/qr_code_prova.dart';
import 'componentes_scanner.dart';
import 'qr_code_scanner_view_model.dart';

/// Tela "Ler QR Code" (simulada). Mostra o que foi identificado no QR Code da folha (prova, aluno
/// e turma) ou o motivo de o QR Code ser inválido. Só deixa continuar com um QR Code válido.
///
/// [onContinuar] recebe o texto lido do QR Code, que segue para a leitura
/// das respostas.
class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key, required this.onVoltar, required this.onContinuar});

  final VoidCallback onVoltar;
  final void Function(String textoQr) onContinuar;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<QrCodeScannerViewModel>();
    final uiState = vm.uiState;
    final valido = uiState.leitura is Valido;

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
                    // Visor da câmera (simulado), com a linha azul do "laser".
                    Container(
                      width: 220,
                      height: 220,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: valido || uiState.carregando ? Colors.white : corErroScanner,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Container(height: 2, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Aponte a câmera para o QR Code\nimpresso no cabeçalho da prova',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const Spacer(),
                    CartaoScanner(
                      child: _conteudo(context, vm),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
    if (uiState.provaId == null) {
      return const Text(
        'Nenhuma prova cadastrada. Cadastre uma prova e o gabarito antes de corrigir.',
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
    }
    if (uiState.alunos.isEmpty) {
      return const Text(
        'Nenhum aluno cadastrado. Cadastre os alunos na tela de Alunos para simular a leitura das folhas.',
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...switch (uiState.leitura) {
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
                  LinhaDado(titulo: 'Prova', valor: uiState.provaTitulo ?? 'Prova nº ${dados.provaId}'),
                  LinhaDado(titulo: 'Aluno', valor: dados.aluno),
                  LinhaDado(titulo: 'Turma', valor: dados.turma.isEmpty ? '—' : dados.turma),
                ],
              ),
            ),
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
        },
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
        BotaoScanner(
          texto: 'Continuar para as respostas',
          icone: Icons.arrow_forward,
          onPressed: uiState.leitura is Valido
              ? () => onContinuar(uiState.textoLido)
              : null,
        ),
      ],
    );
  }
}
