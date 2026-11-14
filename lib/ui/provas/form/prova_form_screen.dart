import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_card.dart';
import '../../components/prova_facil_text_field.dart';
import 'prova_form_ui_state.dart';
import 'prova_form_view_model.dart';

class ProvaFormScreen extends StatefulWidget {
  const ProvaFormScreen({super.key, required this.onSalvo, required this.onVoltar});

  final ValueChanged<int> onSalvo;
  final VoidCallback onVoltar;

  @override
  State<ProvaFormScreen> createState() => _ProvaFormScreenState();
}

class _ProvaFormScreenState extends State<ProvaFormScreen> {
  late final ProvaFormViewModel _viewModel;
  bool _salvoAvisado = false;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<ProvaFormViewModel>()..addListener(_aoMudarEstado);
  }

  void _aoMudarEstado() {
    final estado = _viewModel.uiState;
    final provaId = estado.provaId;
    if (estado.salvo && provaId != null && !_salvoAvisado) {
      _salvoAvisado = true;
      widget.onSalvo(provaId);
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_aoMudarEstado);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProvaFormViewModel>();
    final uiState = viewModel.uiState;
    final travado = uiState.carregando || uiState.salvo;
    final tema = Theme.of(context);
    final tituloSecao = tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          uiState.estaEditando ? 'Editar Prova' : 'Nova Prova',
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
          IconButton(
            onPressed: travado ? null : viewModel.salvar,
            tooltip: 'Salvar prova',
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text('Informações Básicas', style: tituloSecao),
          const SizedBox(height: 8),
          ProvaFacilTextField(
            value: uiState.titulo,
            onChanged: viewModel.atualizarTitulo,
            label: 'Título da prova',
            singleLine: true,
            enabled: !travado,
          ),
          const SizedBox(height: 16),
          ProvaFacilTextField(
            value: uiState.disciplina,
            onChanged: viewModel.atualizarDisciplina,
            label: 'Disciplina',
            singleLine: true,
            enabled: !travado,
          ),
          const SizedBox(height: 16),
          ProvaFacilTextField(
            value: uiState.descricao,
            onChanged: viewModel.atualizarDescricao,
            label: 'Descrição (opcional)',
            enabled: !travado,
          ),
          const SizedBox(height: 24),
          Divider(color: tema.colorScheme.outlineVariant),
          const SizedBox(height: 8),
          Text('Questões', style: tituloSecao),
          for (final (questaoIndice, questao) in uiState.questoes.indexed) ...[
            const SizedBox(height: 16),
            _QuestaoFormCard(
              key: ValueKey(questaoIndice),
              numero: questaoIndice + 1,
              questao: questao,
              podeRemover: uiState.questoes.length > 1,
              habilitado: !travado,
              onRemoverQuestao: () => viewModel.removerQuestao(questaoIndice),
              onEnunciadoChange: (valor) => viewModel.atualizarEnunciado(questaoIndice, valor),
              onTextoAlternativaChange: (alternativaIndice, valor) =>
                  viewModel.atualizarTextoAlternativa(questaoIndice, alternativaIndice, valor),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: travado ? null : viewModel.adicionarQuestao,
              child: const Text('+ Adicionar Nova Questão'),
            ),
          ),
          if (uiState.erro case final mensagem?) ...[
            const SizedBox(height: 16),
            Text(mensagem, style: TextStyle(color: tema.colorScheme.error)),
          ],
          if (uiState.carregando) ...[
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator()),
          ],
          const SizedBox(height: 56),
        ],
      ),
    );
  }
}

class _QuestaoFormCard extends StatelessWidget {
  const _QuestaoFormCard({
    super.key,
    required this.numero,
    required this.questao,
    required this.podeRemover,
    required this.habilitado,
    required this.onRemoverQuestao,
    required this.onEnunciadoChange,
    required this.onTextoAlternativaChange,
  });

  final int numero;
  final QuestaoFormState questao;
  final bool podeRemover;
  final bool habilitado;
  final VoidCallback onRemoverQuestao;
  final ValueChanged<String> onEnunciadoChange;
  final void Function(int alternativaIndice, String valor) onTextoAlternativaChange;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Questão $numero',
                  style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (podeRemover)
                  IconButton(
                    onPressed: habilitado ? onRemoverQuestao : null,
                    tooltip: 'Excluir questão',
                    icon: Icon(Icons.delete, color: tema.colorScheme.error),
                  ),
              ],
            ),
            ProvaFacilTextField(
              value: questao.enunciado,
              onChanged: onEnunciadoChange,
              label: 'Enunciado',
              enabled: habilitado,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Alternativas',
                style: tema.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            for (final (alternativaIndice, alternativa) in questao.alternativas.indexed)
              ProvaFacilTextField(
                value: alternativa.texto,
                onChanged: (valor) => onTextoAlternativaChange(alternativaIndice, valor),
                label: 'Alternativa ${String.fromCharCode(65 + alternativaIndice)}',
                singleLine: true,
                enabled: habilitado,
              ),
            Text(
              'A resposta correta é definida na tela de Gabarito.',
              style: tema.textTheme.bodySmall?.copyWith(color: tema.colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
