import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/local/relation/questao_com_alternativas.dart';
import '../../components/prova_facil_card.dart';
import '../pdf/acao_pdf_prova.dart';
import '../pdf/pdf_prova_view_model.dart';
import 'visualizar_prova_view_model.dart';

class VisualizarProvaScreen extends StatelessWidget {
  const VisualizarProvaScreen({
    super.key,
    required this.onVoltar,
    required this.onEditar,
    required this.onAbrirGabarito,
    required this.onCorrigir,
  });

  final VoidCallback onVoltar;
  final VoidCallback onEditar;
  final VoidCallback onAbrirGabarito;
  final VoidCallback onCorrigir;

  @override
  Widget build(BuildContext context) {
    final estado = context.watch<VisualizarProvaViewModel>().uiState;
    final pdf = context.watch<PdfProvaViewModel>();
    final dados = estado.prova;
    final tema = Theme.of(context);
    final questoes = [...?dados?.questoes]
      ..sort((a, b) {
        final ordem = a.questao.ordem.compareTo(b.questao.ordem);
        return ordem != 0 ? ordem : a.questao.id.compareTo(b.questao.id);
      });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar prova'),
        leading: IconButton(
          onPressed: onVoltar,
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: estado.carregando
          ? const Center(child: CircularProgressIndicator())
          : estado.erro != null
          ? Center(child: Text(estado.erro!))
          : dados == null
          ? const Center(child: Text('Prova não encontrada.'))
          : ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Text(dados.prova.titulo, style: tema.textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('Disciplina: ${dados.prova.disciplina}'),
                Text(
                  'Turma: ${dados.prova.turma.isEmpty ? 'Não informada' : dados.prova.turma}',
                ),
                Text('${questoes.length} questão(ões)'),
                if (dados.prova.descricao.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(dados.prova.descricao),
                ],
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    OutlinedButton.icon(
                      onPressed: onEditar,
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar'),
                    ),
                    OutlinedButton.icon(
                      onPressed: onAbrirGabarito,
                      icon: const Icon(Icons.checklist),
                      label: const Text('Gabarito'),
                    ),
                    OutlinedButton.icon(
                      onPressed: pdf.gerando
                          ? null
                          : () => gerarPdfDaProva(context, dados),
                      icon: const Icon(Icons.picture_as_pdf),
                      label: const Text('Gerar PDF'),
                    ),
                    FilledButton.icon(
                      onPressed: onCorrigir,
                      icon: const Icon(Icons.qr_code_scanner),
                      label: const Text('Corrigir'),
                    ),
                  ],
                ),
                if (pdf.erro != null)
                  Text(
                    pdf.erro!,
                    style: TextStyle(color: tema.colorScheme.error),
                  ),
                const SizedBox(height: 24),
                for (final (indice, questao) in questoes.indexed) ...[
                  _QuestaoVisualizada(numero: indice + 1, dados: questao),
                  const SizedBox(height: 16),
                ],
              ],
            ),
    );
  }
}

class _QuestaoVisualizada extends StatelessWidget {
  const _QuestaoVisualizada({required this.numero, required this.dados});

  final int numero;
  final QuestaoComAlternativas dados;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final alternativas = [...dados.alternativas]
      ..sort((a, b) {
        final ordem = a.ordem.compareTo(b.ordem);
        return ordem != 0 ? ordem : a.id.compareTo(b.id);
      });
    final gabaritoDefinido = alternativas.where((a) => a.correta).length == 1;
    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$numero. ${dados.questao.enunciado}',
              style: tema.textTheme.titleMedium,
            ),
            if (!gabaritoDefinido)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Gabarito não definido',
                  style: TextStyle(color: tema.colorScheme.error),
                ),
              ),
            const SizedBox(height: 8),
            for (final (indice, alternativa) in alternativas.indexed)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: gabaritoDefinido && alternativa.correta
                      ? tema.colorScheme.primaryContainer
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: gabaritoDefinido && alternativa.correta
                        ? tema.colorScheme.primary
                        : tema.colorScheme.outlineVariant,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${String.fromCharCode(65 + indice)}. ${alternativa.texto}',
                      ),
                    ),
                    if (gabaritoDefinido && alternativa.correta)
                      Icon(
                        Icons.check_circle,
                        color: tema.colorScheme.primary,
                        semanticLabel: 'Alternativa correta',
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
