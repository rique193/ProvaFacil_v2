import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/local/relation/banco_questao_com_alternativas.dart';
import '../components/prova_facil_card.dart';
import 'banco_questoes_view_model.dart';

class BancoQuestoesScreen extends StatefulWidget {
  const BancoQuestoesScreen({
    super.key,
    required this.onVoltar,
    required this.onNovaQuestao,
    required this.onEditarQuestao,
  });

  final VoidCallback onVoltar;
  final VoidCallback onNovaQuestao;
  final ValueChanged<int> onEditarQuestao;

  @override
  State<BancoQuestoesScreen> createState() => _BancoQuestoesScreenState();
}

class _BancoQuestoesScreenState extends State<BancoQuestoesScreen> {
  late final BancoQuestoesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<BancoQuestoesViewModel>()..addListener(_aoMudarEstado);
  }

  void _aoMudarEstado() {
    final mensagem = _viewModel.uiState.mensagem;
    if (mensagem == null) return;
    _viewModel.mensagemExibida();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  void dispose() {
    _viewModel.removeListener(_aoMudarEstado);
    super.dispose();
  }

  Future<void> _confirmarExclusao(BancoQuestaoComAlternativas item) async {
    final tema = Theme.of(context);
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Excluir questão'),
        content: const Text('Deseja excluir esta questão do banco?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text('Excluir', style: TextStyle(color: tema.colorScheme.error)),
          ),
        ],
      ),
    );
    if (confirmou == true) {
      await _viewModel.excluirQuestao(item.questao.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BancoQuestoesViewModel>();
    final uiState = viewModel.uiState;
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Questões', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: tema.scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        leading: BackButton(onPressed: widget.onVoltar),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: widget.onNovaQuestao,
        icon: const Icon(Icons.add),
        label: const Text('Nova Questão'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: DropdownMenu<String?>(
              expandedInsets: EdgeInsets.zero,
              label: const Text('Filtrar por disciplina'),
              initialSelection: uiState.disciplinaSelecionada,
              onSelected: viewModel.selecionarDisciplina,
              dropdownMenuEntries: [
                const DropdownMenuEntry<String?>(value: null, label: 'Todas'),
                for (final disciplina in uiState.disciplinas)
                  DropdownMenuEntry<String?>(value: disciplina.nome, label: disciplina.nome),
              ],
            ),
          ),
          Expanded(
            child: uiState.carregando
                ? const SizedBox.shrink()
                : uiState.questoes.isEmpty
                ? Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Text(
                  uiState.disciplinaSelecionada == null
                      ? 'Nenhuma questão cadastrada no banco.\nToque em "Nova Questão" para começar.'
                      : 'Nenhuma questão encontrada para "${uiState.disciplinaSelecionada}".',
                  textAlign: TextAlign.center,
                  style: tema.textTheme.bodyLarge?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            )
                : ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 96),
              itemCount: uiState.questoes.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (_, indice) {
                final item = uiState.questoes[indice];
                return _QuestaoBancoCard(
                  key: ValueKey(item.questao.id),
                  item: item,
                  onTap: () => widget.onEditarQuestao(item.questao.id),
                  onExcluir: () => _confirmarExclusao(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestaoBancoCard extends StatelessWidget {
  const _QuestaoBancoCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onExcluir,
  });

  final BancoQuestaoComAlternativas item;
  final VoidCallback onTap;
  final VoidCallback onExcluir;

  String _letraCorreta() {
    for (final alt in item.alternativas) {
      if (alt.correta) return String.fromCharCode(65 + alt.ordem);
    }
    return '-';
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final letra = _letraCorreta();

    return ProvaFacilCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.questao.disciplina,
                          style: tema.textTheme.labelLarge?.copyWith(
                            color: tema.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: tema.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Correta: $letra',
                          style: tema.textTheme.labelSmall?.copyWith(
                            color: tema.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.questao.enunciado,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: tema.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onExcluir,
              tooltip: 'Excluir questão',
              icon: Icon(Icons.delete, color: tema.colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}