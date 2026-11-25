import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/formatacao_numeros.dart';
import 'relatorio_notas_view_model.dart';
import 'relatorio_ui_state.dart';

const _mimeXlsx = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';

/// Tela de Relatório de Notas de uma prova.
///
/// Exibe a tabela de alunos com acertos e nota, resumo estatístico e permite
/// exportar para Excel (.xlsx) com as abas de notas e de estatísticas.
class RelatorioNotasScreen extends StatelessWidget {
  const RelatorioNotasScreen({
    super.key,
    required this.provaId,
    required this.onVoltar,
  });

  final int provaId;
  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: RelatorioNotasViewModel.factory(provaId),
      child: _RelatorioNotasView(onVoltar: onVoltar),
    );
  }
}

class _RelatorioNotasView extends StatefulWidget {
  const _RelatorioNotasView({required this.onVoltar});

  final VoidCallback onVoltar;

  @override
  State<_RelatorioNotasView> createState() => _RelatorioNotasViewState();
}

class _RelatorioNotasViewState extends State<_RelatorioNotasView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RelatorioNotasViewModel>();
    final uiState = viewModel.uiState;
    final tema = Theme.of(context);

    // Exibe snackbar ao término da exportação
    if (uiState.mensagem != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(uiState.mensagem!)),
        );
        viewModel.mensagemExibida();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          uiState.tituloProva.isEmpty
              ? 'Relatório de Notas'
              : 'Relatório — ${uiState.tituloProva}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: tema.scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: widget.onVoltar,
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          if (uiState.podeExportar)
            IconButton(
              onPressed: uiState.exportando
                  ? null
                  : () => _exportar(viewModel),
              tooltip: 'Exportar relatório',
              icon: const Icon(Icons.download),
            ),
        ],
      ),
      body: uiState.carregando
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Painel de resumo estatístico
                _PainelResumo(
                  totalAlunos: uiState.linhas.length,
                  media: uiState.mediaDaTurma,
                  maiorNota: uiState.maiorNota,
                  menorNota: uiState.menorNota,
                ),
                // Cabeçalho clicável da tabela (ordenação)
                _CabecalhoTabela(
                  colunaOrdenacao: uiState.colunaOrdenacao,
                  direcaoOrdenacao: uiState.direcaoOrdenacao,
                  onOrdenarPorAluno: () =>
                      viewModel.ordenarPor(ColunaOrdenacao.aluno),
                  onOrdenarPorNota: () =>
                      viewModel.ordenarPor(ColunaOrdenacao.nota),
                ),
                const Divider(height: 1),
                // Lista de alunos
                Expanded(
                  child: uiState.linhas.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text(
                              'Nenhuma correção registrada para esta prova.',
                              textAlign: TextAlign.center,
                              style: tema.textTheme.bodyLarge?.copyWith(
                                color: tema.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: uiState.linhas.length,
                          separatorBuilder: (context, index) =>
                              const Divider(height: 1),
                          itemBuilder: (context, indice) {
                            return _LinhaAluno(
                              linha: uiState.linhas[indice],
                            );
                          },
                        ),
                ),
                // Barra de progresso de exportação
                if (uiState.exportando)
                  const LinearProgressIndicator(),
              ],
            ),
    );
  }

  Future<void> _exportar(RelatorioNotasViewModel viewModel) async {
    await viewModel.exportar((nomeArquivo, bytes) async {
      // O file_picker 13 grava os bytes no arquivo escolhido e devolve o Uri (null se cancelar).
      final destino = await FilePicker.saveFile(
        dialogTitle: 'Salvar relatório',
        fileName: nomeArquivo,
        mimeType: _mimeXlsx,
        bytes: bytes,
      );
      return destino?.toString();
    });
  }
}

// ---------------------------------------------------------------------------
// Widgets auxiliares da tela
// ---------------------------------------------------------------------------

class _PainelResumo extends StatelessWidget {
  const _PainelResumo({
    required this.totalAlunos,
    required this.media,
    required this.maiorNota,
    required this.menorNota,
  });

  final int totalAlunos;
  final double media;
  final double maiorNota;
  final double menorNota;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return ColoredBox(
      color: tema.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _ItemResumo(label: 'Alunos', valor: '$totalAlunos'),
            _ItemResumo(label: 'Média', valor: formatarMedia(media)),
            _ItemResumo(label: 'Maior', valor: formatarNota(maiorNota)),
            _ItemResumo(label: 'Menor', valor: formatarNota(menorNota)),
          ],
        ),
      ),
    );
  }
}

class _ItemResumo extends StatelessWidget {
  const _ItemResumo({required this.label, required this.valor});

  final String label;
  final String valor;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Column(
      children: [
        Text(
          valor,
          style: tema.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: tema.textTheme.bodySmall?.copyWith(
            color: tema.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CabecalhoTabela extends StatelessWidget {
  const _CabecalhoTabela({
    required this.colunaOrdenacao,
    required this.direcaoOrdenacao,
    required this.onOrdenarPorAluno,
    required this.onOrdenarPorNota,
  });

  final ColunaOrdenacao colunaOrdenacao;
  final DirecaoOrdenacao direcaoOrdenacao;
  final VoidCallback onOrdenarPorAluno;
  final VoidCallback onOrdenarPorNota;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final estilo = tema.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600);

    IconData iconeOrdenacao(ColunaOrdenacao coluna) {
      if (colunaOrdenacao != coluna) return Icons.unfold_more;
      return direcaoOrdenacao == DirecaoOrdenacao.ascendente
          ? Icons.arrow_upward
          : Icons.arrow_downward;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onOrdenarPorAluno,
              borderRadius: BorderRadius.circular(4),
              child: Row(
                children: [
                  Text('Aluno', style: estilo),
                  const SizedBox(width: 4),
                  Icon(iconeOrdenacao(ColunaOrdenacao.aluno), size: 16),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onOrdenarPorNota,
            borderRadius: BorderRadius.circular(4),
            child: Row(
              children: [
                Text('Nota', style: estilo),
                const SizedBox(width: 4),
                Icon(iconeOrdenacao(ColunaOrdenacao.nota), size: 16),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Text('Acertos', style: estilo),
        ],
      ),
    );
  }
}

class _LinhaAluno extends StatelessWidget {
  const _LinhaAluno({required this.linha});

  final LinhaRelatorioUiState linha;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  linha.nome,
                  style: tema.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (linha.matricula != null)
                  Text(
                    'Mat: ${linha.matricula}',
                    style: tema.textTheme.bodySmall?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 56,
            child: Text(
              formatarNota(linha.nota),
              textAlign: TextAlign.center,
              style: tema.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              '${linha.acertos}',
              textAlign: TextAlign.center,
              style: tema.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
