import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/formatacao_numeros.dart';
import '../components/prova_facil_card.dart';
import 'estatisticas_ui_state.dart';
import 'estatisticas_view_model.dart';

class EstatisticasScreen extends StatelessWidget {
  const EstatisticasScreen({
    required this.provaId,
    required this.onVoltar,
    super.key,
  });

  final int provaId;
  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    final uiState = context.watch<EstatisticasViewModel>().uiState;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text('Estatísticas', style: TextStyle(fontWeight: FontWeight.w600)),
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
          if (uiState.totalAlunosCorrigidos == 0) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Nenhum resultado salvo para esta prova.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            );
          }
          return Column(
            children: [
              _CabecalhoEstatisticas(uiState: uiState),
              _FiltrosRow(
                filtroSelecionado: uiState.filtroSelecionado,
                onFiltroSelecionado: context.read<EstatisticasViewModel>().selecionarFiltro,
              ),
              Expanded(
                child: uiState.questoesExibidas.isEmpty
                    ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      'Nenhuma questão para este filtro.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                )
                    : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: uiState.questoesExibidas.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final questao = uiState.questoesExibidas[index];
                    return _QuestaoEstatisticaCard(
                      key: ValueKey(questao.numero),
                      questao: questao,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CabecalhoEstatisticas extends StatelessWidget {
  const _CabecalhoEstatisticas({required this.uiState});

  final EstatisticasUiState uiState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final turmasSub = [uiState.disciplina, uiState.turmas]
        .where((it) => it.isNotEmpty)
        .join(' — ');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            uiState.tituloProva,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (turmasSub.isNotEmpty)
            Text(
              turmasSub,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _IndicadorEstatistica(rotulo: 'Média da turma', valor: formatarMedia(uiState.mediaDaTurma)),
              _IndicadorEstatistica(rotulo: 'Maior nota', valor: formatarNota(uiState.maiorNota)),
              _IndicadorEstatistica(rotulo: 'Menor nota', valor: formatarNota(uiState.menorNota)),
              _IndicadorEstatistica(rotulo: 'Corrigidas', valor: '${uiState.totalAlunosCorrigidos}'),
            ],
          ),
        ],
      ),
    );
  }
}

class _IndicadorEstatistica extends StatelessWidget {
  const _IndicadorEstatistica({required this.rotulo, required this.valor});

  final String rotulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Text(
            valor,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          Text(
            rotulo,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FiltrosRow extends StatelessWidget {
  const _FiltrosRow({
    required this.filtroSelecionado,
    required this.onFiltroSelecionado,
  });

  final FiltroEstatisticas filtroSelecionado;
  final ValueChanged<FiltroEstatisticas> onFiltroSelecionado;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: FiltroEstatisticas.values.map((filtro) {
          final selecionado = filtroSelecionado == filtro;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              selected: selecionado,
              onSelected: (_) => onFiltroSelecionado(filtro),
              label: Text(filtro.rotulo),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _QuestaoEstatisticaCard extends StatelessWidget {
  const _QuestaoEstatisticaCard({required this.questao, super.key});

  final QuestaoEstatisticaUiState questao;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final percentual = questao.percentualAcerto;

    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Questão ${questao.numero}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  percentual != null
                      ? '${(percentual * 100).toInt()}% de acerto'
                      : 'Sem respostas registradas',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: percentual?.toDouble() ?? 0.0,
              minHeight: 8,
              borderRadius: BorderRadius.circular(50),
            ),
            const SizedBox(height: 16),
            ...questao.distribuicao.map(
                  (alternativa) => _AlternativaDistribuicaoRow(
                alternativa: alternativa,
                totalRespostas: questao.totalRespostas,
              ),
            ),
            if (questao.quantidadeEmBranco > 0 || questao.quantidadeMultipla > 0) ...[
              const SizedBox(height: 4),
              Text(
                [
                  if (questao.quantidadeEmBranco > 0) '${questao.quantidadeEmBranco} em branco',
                  if (questao.quantidadeMultipla > 0) '${questao.quantidadeMultipla} com marcação múltipla',
                ].join(' · '),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (questao.gabaritoAlterado) ...[
              const SizedBox(height: 4),
              Text(
                'Gabarito alterado entre correções; recorrija as folhas antigas para atualizar.',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (questao.divergeDoGabarito) ...[
              const SizedBox(height: 8),
              Text(
                'Maioria marcou ${questao.alternativaMaisMarcada}; gabarito é ${questao.letraDoGabarito}',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AlternativaDistribuicaoRow extends StatelessWidget {
  const _AlternativaDistribuicaoRow({
    required this.alternativa,
    required this.totalRespostas,
  });

  final AlternativaDistribuicaoUiState alternativa;
  final int totalRespostas;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final corDestaque = alternativa.ehMaisMarcada
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;
    final fracao = totalRespostas > 0 ? alternativa.quantidade / totalRespostas : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              alternativa.letra,
              style: TextStyle(
                fontWeight: alternativa.ehMaisMarcada ? FontWeight.bold : FontWeight.normal,
                color: corDestaque,
              ),
            ),
          ),
          SizedBox(
            width: 16,
            child: alternativa.ehGabarito
                ? Icon(Icons.check, size: 16, color: colorScheme.primary)
                : null,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: fracao,
                minHeight: 8,
                backgroundColor: colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(corDestaque),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 24,
            child: Text(
              '${alternativa.quantidade}',
              style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}