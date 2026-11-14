import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_card.dart';
import 'gabarito_ui_state.dart';
import 'gabarito_view_model.dart';

class GabaritoScreen extends StatefulWidget {
  const GabaritoScreen({super.key, required this.onVoltar, required this.onSalvo});

  final VoidCallback onVoltar;
  final VoidCallback onSalvo;

  @override
  State<GabaritoScreen> createState() => _GabaritoScreenState();
}

class _GabaritoScreenState extends State<GabaritoScreen> {
  late final GabaritoViewModel _viewModel;
  bool _salvoAvisado = false;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<GabaritoViewModel>()..addListener(_aoMudarEstado);
  }

  void _aoMudarEstado() {
    if (_viewModel.uiState.salvo && !_salvoAvisado) {
      _salvoAvisado = true;
      widget.onSalvo();
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_aoMudarEstado);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GabaritoViewModel>();
    final uiState = viewModel.uiState;
    final tema = Theme.of(context);
    final podeSalvar = !uiState.carregando && !uiState.salvo && uiState.questoes.isNotEmpty;

    return Scaffold(
      body: Column(
        children: [
          _GabaritoHeader(
            titulo: uiState.tituloProva,
            disciplina: uiState.disciplina,
            totalQuestoes: uiState.totalQuestoes,
            preenchidas: uiState.preenchidas,
            progresso: uiState.progresso,
            onVoltar: widget.onVoltar,
          ),
          Expanded(
            child: uiState.carregando && uiState.questoes.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      if (uiState.erro case final mensagem?)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(mensagem, style: TextStyle(color: tema.colorScheme.error)),
                        ),
                      for (final questao in uiState.questoes)
                        Padding(
                          key: ValueKey(questao.questaoId),
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _GabaritoQuestaoRow(
                            questao: questao,
                            onSelecionar: (alternativaId) =>
                                viewModel.selecionarResposta(questao.questaoId, alternativaId),
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: tema.scaffoldBackgroundColor,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: podeSalvar ? viewModel.salvar : null,
              child: const Text('Salvar Gabarito'),
            ),
          ),
        ),
      ),
    );
  }
}

class _GabaritoHeader extends StatelessWidget {
  const _GabaritoHeader({
    required this.titulo,
    required this.disciplina,
    required this.totalQuestoes,
    required this.preenchidas,
    required this.progresso,
    required this.onVoltar,
  });

  final String titulo;
  final String disciplina;
  final int totalQuestoes;
  final int preenchidas;
  final double progresso;
  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final textoSecundario = tema.textTheme.bodyMedium?.copyWith(
      color: tema.colorScheme.onSurfaceVariant,
    );

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onVoltar,
                  tooltip: 'Voltar',
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gabarito',
                          style: tema.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$disciplina — $titulo · $totalQuestoes questões',
                          style: textoSecundario,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$preenchidas de $totalQuestoes preenchidas', style: textoSecundario),
                  Text(
                    '${(progresso * 100).toInt()}%',
                    style: tema.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: LinearProgressIndicator(value: progresso, minHeight: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GabaritoQuestaoRow extends StatelessWidget {
  const _GabaritoQuestaoRow({required this.questao, required this.onSelecionar});

  final GabaritoQuestaoState questao;
  final ValueChanged<int> onSelecionar;

  @override
  Widget build(BuildContext context) {
    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Questão ${questao.numero}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              spacing: 8,
              children: [
                for (final alternativa in questao.alternativas)
                  _AlternativaLetraButton(
                    letra: alternativa.letra,
                    selecionada: alternativa.alternativaId == questao.alternativaCorretaId,
                    onClick: () => onSelecionar(alternativa.alternativaId),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AlternativaLetraButton extends StatelessWidget {
  const _AlternativaLetraButton({
    required this.letra,
    required this.selecionada,
    required this.onClick,
  });

  final String letra;
  final bool selecionada;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final corFundo = selecionada ? cores.primary : cores.surfaceContainerHighest;
    final corTexto = selecionada ? cores.onPrimary : cores.onSurfaceVariant;

    return Material(
      color: corFundo,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: SizedBox.square(
          dimension: 36,
          child: Center(
            child: Text(
              letra,
              style: TextStyle(color: corTexto, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
