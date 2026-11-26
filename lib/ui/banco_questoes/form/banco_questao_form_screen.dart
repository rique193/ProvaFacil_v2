import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_card.dart';
import '../../components/prova_facil_text_field.dart';
import 'banco_questao_form_view_model.dart';

class BancoQuestaoFormScreen extends StatefulWidget {
  const BancoQuestaoFormScreen({
    super.key,
    required this.onVoltar,
    required this.onConcluido,
    this.onAbrirTurmasDisciplinas,
  });

  final VoidCallback onVoltar;
  final VoidCallback onConcluido;
  final VoidCallback? onAbrirTurmasDisciplinas;

  @override
  State<BancoQuestaoFormScreen> createState() => _BancoQuestaoFormScreenState();
}

class _BancoQuestaoFormScreenState extends State<BancoQuestaoFormScreen> {
  late final BancoQuestaoFormViewModel _viewModel;
  bool _concluidoAvisado = false;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<BancoQuestaoFormViewModel>()..addListener(_aoMudarEstado);
  }

  void _aoMudarEstado() {
    final estado = _viewModel.uiState;
    if ((estado.salvo || estado.excluida) && !_concluidoAvisado) {
      _concluidoAvisado = true;
      widget.onConcluido();
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_aoMudarEstado);
    super.dispose();
  }

  Future<void> _confirmarExclusao() async {
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
      await _viewModel.excluir();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BancoQuestaoFormViewModel>();
    final uiState = viewModel.uiState;
    final travado = uiState.carregando || uiState.salvo || uiState.excluida;
    final tema = Theme.of(context);

    final opcoesDisciplina = <String>[
      for (final d in uiState.disciplinas) d.nome,
      if (uiState.disciplina.isNotEmpty &&
          !uiState.disciplinas.any((d) => d.nome == uiState.disciplina))
        uiState.disciplina,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          uiState.estaEditando ? 'Editar Questão' : 'Nova Questão',
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
          if (uiState.estaEditando)
            IconButton(
              onPressed: travado ? null : _confirmarExclusao,
              tooltip: 'Excluir questão',
              icon: Icon(Icons.delete, color: tema.colorScheme.error),
            ),
          IconButton(
            onPressed: travado ? null : viewModel.salvar,
            tooltip: 'Salvar questão',
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          if (opcoesDisciplina.isEmpty)
            ProvaFacilCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nenhuma disciplina cadastrada.',
                      style: tema.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Cadastre ao menos uma disciplina antes de salvar questões no banco.',
                      style: tema.textTheme.bodyMedium?.copyWith(
                        color: tema.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (widget.onAbrirTurmasDisciplinas != null) ...[
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: widget.onAbrirTurmasDisciplinas,
                        child: const Text('Ir para Turmas e Disciplinas'),
                      ),
                    ],
                  ],
                ),
              ),
            )
          else
            DropdownMenu<String>(
              key: ValueKey('${uiState.questaoId}_${uiState.disciplina}_${opcoesDisciplina.length}'),
              expandedInsets: EdgeInsets.zero,
              enabled: !travado,
              label: const Text('Disciplina'),
              initialSelection: uiState.disciplina.isEmpty ? null : uiState.disciplina,
              onSelected: (valor) {
                if (valor != null) viewModel.atualizarDisciplina(valor);
              },
              dropdownMenuEntries: [
                for (final nome in opcoesDisciplina)
                  DropdownMenuEntry<String>(value: nome, label: nome),
              ],
            ),
          const SizedBox(height: 16),
          ProvaFacilTextField(
            value: uiState.enunciado,
            onChanged: viewModel.atualizarEnunciado,
            label: 'Enunciado',
            enabled: !travado,
          ),
          const SizedBox(height: 20),
          Text(
            'Alternativas',
            style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < 5; i++) ...[
            ProvaFacilTextField(
              value: uiState.alternativas[i],
              onChanged: (valor) => viewModel.atualizarAlternativa(i, valor),
              label: 'Alternativa ${String.fromCharCode(65 + i)}',
              singleLine: true,
              enabled: !travado,
            ),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 8),
          Text(
            'Alternativa correta',
            style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < 5; i++)
                ChoiceChip(
                  label: Text(String.fromCharCode(65 + i)),
                  selected: uiState.indiceCorreta == i,
                  onSelected: travado ? null : (_) => viewModel.marcarCorreta(i),
                ),
            ],
          ),
          if (uiState.erro case final mensagem?) ...[
            const SizedBox(height: 16),
            Text(mensagem, style: TextStyle(color: tema.colorScheme.error)),
          ],
          if (uiState.carregando) ...[
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator()),
          ],
          const SizedBox(height: 24),
          FilledButton(
            onPressed: travado ? null : viewModel.salvar,
            child: Text(uiState.estaEditando ? 'Salvar alterações' : 'Salvar questão'),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}