import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../util/formatacao_numeros.dart';
import '../components/prova_facil_card.dart';
import 'historico_ui_state.dart';
import 'historico_view_model.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({
    required this.onVoltar,
    required this.onAbrirEstatisticas,
    required this.onAbrirRelatorio,
    super.key,
  });

  final VoidCallback onVoltar;
  final void Function(int provaId) onAbrirEstatisticas;
  final void Function(int provaId) onAbrirRelatorio;

  @override
  Widget build(BuildContext context) {
    final uiState = context.watch<HistoricoViewModel>().uiState;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text(
          'Histórico de Avaliações',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: onVoltar,
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar',
        ),
      ),
      body: Builder(
        builder: (context) {
          if (uiState.carregando) {
            return const SizedBox.shrink();
          }
          if (uiState.avaliacoes.isEmpty()) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Nenhuma prova corrigida ainda.\nAs provas aparecem aqui depois da primeira correção.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: uiState.avaliacoes.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final avaliacao = uiState.avaliacoes[index];
              return _AvaliacaoCard(
                key: ValueKey(avaliacao.provaId),
                avaliacao: avaliacao,
                onAbrirEstatisticas: () => onAbrirEstatisticas(avaliacao.provaId),
                onAbrirRelatorio: () => onAbrirRelatorio(avaliacao.provaId),
              );
            },
          );
        },
      ),
    );
  }
}

class _AvaliacaoCard extends StatelessWidget {
  const _AvaliacaoCard({
    required this.avaliacao,
    required this.onAbrirEstatisticas,
    required this.onAbrirRelatorio,
    super.key,
  });

  final AvaliacaoHistoricoUiState avaliacao;
  final VoidCallback onAbrirEstatisticas;
  final VoidCallback onAbrirRelatorio;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ProvaFacilCard(
      onTap: onAbrirEstatisticas,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              avaliacao.titulo,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              avaliacao.disciplina,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
            if (avaliacao.turmas.isNotEmpty)
              Text(
                avaliacao.turmas,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(height: 2),
            Text(
              'Última correção: ${_formatarData(avaliacao.ultimaCorrecaoEm)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  avaliacao.totalCorrigidos == 1
                      ? '1 aluno corrigido'
                      : '${avaliacao.totalCorrigidos} alunos corrigidos',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  'Média: ${formatarMedia(avaliacao.media)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onAbrirRelatorio,
                child: const Text('Relatório de notas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatarData(int millis) {
  final data = DateTime.fromMillisecondsSinceEpoch(millis);
  return DateFormat("dd/MM/yyyy 'às' HH:mm", 'pt_BR').format(data);
}