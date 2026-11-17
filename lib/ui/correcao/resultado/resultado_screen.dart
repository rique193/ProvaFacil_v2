import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../domain/correcao/corretor_prova.dart';
import '../../../util/formatacao_numeros.dart';
import '../../components/prova_facil_card.dart';
import '../componentes/letra_alternativa.dart';
import 'resultado_ui_state.dart';
import 'resultado_view_model.dart';

class ResultadoScreen extends StatelessWidget {
  const ResultadoScreen({
    super.key,
    required this.onVoltar,
    required this.onConcluir,
  });
  final VoidCallback onVoltar;
  final VoidCallback onConcluir;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ResultadoViewModel>();
    final s = vm.uiState;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        leading: IconButton(
          tooltip: 'Voltar',
          onPressed: onVoltar,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: onConcluir,
              child: const Text('Concluir'),
            ),
          ),
        ),
      ),
      body: s.carregando
          ? const Center(child: CircularProgressIndicator())
          : s.erro != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(s.erro!, textAlign: TextAlign.center),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _resumo(context, s),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: [
                      for (final (filtro, rotulo) in [
                        (FiltroQuestoes.todas, 'Todas (${s.questoes.length})'),
                        (FiltroQuestoes.acertos, 'Acertos (${s.acertos})'),
                        (FiltroQuestoes.erros, 'Erros (${s.erros})'),
                        (FiltroQuestoes.emBranco, 'Em branco (${s.emBranco})'),
                      ])
                        FilterChip(
                          label: Text(rotulo),
                          selected: s.filtro == filtro,
                          onSelected: (_) => vm.selecionarFiltro(filtro),
                        ),
                    ],
                  ),
                ),
                if (s.questoesFiltradas.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Nenhuma questão neste filtro.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                for (final q in s.questoesFiltradas)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _questao(context, q),
                  ),
              ],
            ),
    );
  }

  Widget _resumo(BuildContext context, ResultadoUiState s) {
    final tema = Theme.of(context);
    final cores = CoresCorrecao(context);
    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: tema.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.nomeAluno,
                        style: tema.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (s.turma.trim().isNotEmpty)
                        Text(s.turma, style: tema.textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${s.disciplina} — ${s.tituloProva}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'Corrigida em ${DateFormat("dd/MM/yyyy 'às' HH:mm", 'pt_BR').format(DateTime.fromMillisecondsSinceEpoch(s.corrigidoEm))}',
              style: tema.textTheme.bodySmall,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatarNota(s.nota),
                  style: tema.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: tema.colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    ' / ${formatarNota(s.notaMaxima)}',
                    style: tema.textTheme.titleMedium,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '${(s.percentualAcerto * 100).round()}% de acerto',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: LinearProgressIndicator(
                value: s.percentualAcerto,
                color: cores.acerto,
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _contador(context, 'Acertos', s.acertos, cores.acerto),
                _contador(context, 'Erros', s.erros, cores.erro),
                _contador(context, 'Em branco', s.emBranco, cores.onNeutro),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _contador(BuildContext context, String rotulo, int valor, Color cor) =>
      Expanded(
        child: Column(
          children: [
            Text(
              '$valor',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: cor),
            ),
            Text(rotulo, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      );

  Widget _questao(BuildContext context, ResultadoQuestaoState q) {
    final cores = CoresCorrecao(context);
    final cor = switch (q.situacao) {
      SituacaoQuestao.acerto => cores.acerto,
      SituacaoQuestao.erro || SituacaoQuestao.marcacaoMultipla => cores.erro,
      SituacaoQuestao.emBranco => cores.onNeutro,
    };
    final rotulo = switch (q.situacao) {
      SituacaoQuestao.acerto => 'Acertou',
      SituacaoQuestao.erro => 'Errou',
      SituacaoQuestao.emBranco => 'Em branco',
      SituacaoQuestao.marcacaoMultipla => 'Anulada',
    };
    final descricao = switch (q.situacao) {
      SituacaoQuestao.emBranco => 'O aluno não marcou nenhuma alternativa.',
      SituacaoQuestao.marcacaoMultipla =>
        'O aluno marcou mais de uma alternativa (${(q.letrasMarcadas.toList()..sort()).join(', ')}), por isso a questão foi anulada.',
      _ =>
        'O aluno marcou: ${q.letrasMarcadas.isEmpty ? '—' : _letraComTexto(q, q.letrasMarcadas.first)}',
    };
    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: q.situacao == SituacaoQuestao.emBranco
                      ? cores.neutro
                      : cor,
                  child: q.situacao == SituacaoQuestao.emBranco
                      ? Text('–', style: TextStyle(color: cores.onNeutro))
                      : Icon(
                          q.situacao == SituacaoQuestao.acerto
                              ? Icons.check
                              : Icons.close,
                          size: 18,
                          color: q.situacao == SituacaoQuestao.acerto
                              ? cores.onAcerto
                              : cores.onErro,
                        ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Questão ${q.numero}',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  rotulo,
                  style: TextStyle(fontWeight: FontWeight.w600, color: cor),
                ),
              ],
            ),
            if (q.enunciado.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  q.enunciado,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final letra in q.letras) _letra(context, q, letra),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              descricao,
              style: TextStyle(
                color: q.situacao == SituacaoQuestao.acerto
                    ? cores.acerto
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (q.situacao != SituacaoQuestao.acerto)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Resposta correta: ${_letraComTexto(q, q.letraCorreta)}',
                  style: TextStyle(
                    color: cores.acerto,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _letra(BuildContext context, ResultadoQuestaoState q, String letra) {
    final cores = CoresCorrecao(context);
    final marcada = q.letrasMarcadas.contains(letra);
    final correta = letra == q.letraCorreta;
    final acertou = q.situacao == SituacaoQuestao.acerto;
    return LetraAlternativa(
      letra: letra,
      fundo: marcada
          ? (correta && acertou ? cores.acerto : cores.erro)
          : cores.neutro,
      corTexto: marcada
          ? (correta && acertou ? cores.onAcerto : cores.onErro)
          : (correta ? cores.acerto : cores.onNeutro),
      borda: correta && !(marcada && acertou) ? cores.acerto : null,
    );
  }

  String _letraComTexto(ResultadoQuestaoState q, String letra) {
    final texto = q.textoDa(letra);
    return texto == null || texto.trim().isEmpty ? letra : '$letra) $texto';
  }
}
