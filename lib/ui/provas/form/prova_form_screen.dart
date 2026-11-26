import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_card.dart';
import '../../components/prova_facil_text_field.dart';
import 'prova_form_ui_state.dart';
import 'prova_form_view_model.dart';

class ProvaFormScreen extends StatefulWidget {
  const ProvaFormScreen({
    super.key,
    required this.onSalvo,
    required this.onVoltar,
    this.onAbrirTurmasDisciplinas,
  });

  final ValueChanged<int> onSalvo;
  final VoidCallback onVoltar;
  final VoidCallback? onAbrirTurmasDisciplinas;

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

    final opcoesDisciplina = <String>[
      for (final d in uiState.disciplinas) d.nome,
      if (uiState.disciplina.isNotEmpty &&
          !uiState.disciplinas.any((d) => d.nome == uiState.disciplina))
        uiState.disciplina,
    ];
    final opcoesTurma = <String>[
      for (final t in uiState.turmas) t.nome,
      if (uiState.turma.isNotEmpty && !uiState.turmas.any((t) => t.nome == uiState.turma))
        uiState.turma,
    ];

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
          _SeletorOuAviso(
            dropdownKey: const Key('dropdown_disciplina_prova'),
            rotulo: 'Disciplina',
            dica: 'Selecione uma disciplina',
            opcoes: opcoesDisciplina,
            selecionado: uiState.disciplina,
            habilitado: !travado,
            mensagemVazio: 'Nenhuma disciplina cadastrada.',
            onChanged: viewModel.atualizarDisciplina,
            onAbrirTurmasDisciplinas: widget.onAbrirTurmasDisciplinas,
          ),
          const SizedBox(height: 16),
          _SeletorOuAviso(
            dropdownKey: const Key('dropdown_turma_prova'),
            rotulo: 'Turma',
            dica: 'Selecione uma turma',
            opcoes: opcoesTurma,
            selecionado: uiState.turma,
            habilitado: !travado,
            mensagemVazio: 'Nenhuma turma cadastrada.',
            onChanged: viewModel.atualizarTurma,
            onAbrirTurmasDisciplinas: widget.onAbrirTurmasDisciplinas,
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
            const SizedBox(height: 12),
            ProvaFacilTextField(
              value: questao.enunciado,
              onChanged: onEnunciadoChange,
              label: 'Enunciado',
              enabled: habilitado,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(
                'Alternativas',
                style: tema.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            for (final (alternativaIndice, alternativa) in questao.alternativas.indexed) ...[
              ProvaFacilTextField(
                value: alternativa.texto,
                onChanged: (valor) => onTextoAlternativaChange(alternativaIndice, valor),
                label: 'Alternativa ${String.fromCharCode(65 + alternativaIndice)}',
                singleLine: true,
                enabled: habilitado,
              ),
              const SizedBox(height: 8),
            ],
            const SizedBox(height: 4),
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

class _SeletorOuAviso extends StatelessWidget {
  const _SeletorOuAviso({
    required this.dropdownKey,
    required this.rotulo,
    required this.dica,
    required this.opcoes,
    required this.selecionado,
    required this.habilitado,
    required this.mensagemVazio,
    required this.onChanged,
    this.onAbrirTurmasDisciplinas,
  });

  final Key dropdownKey;
  final String rotulo;
  final String dica;
  final List<String> opcoes;
  final String selecionado;
  final bool habilitado;
  final String mensagemVazio;
  final ValueChanged<String> onChanged;
  final VoidCallback? onAbrirTurmasDisciplinas;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    if (opcoes.isEmpty) {
      return ProvaFacilCard(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  mensagemVazio,
                  style: tema.textTheme.bodyMedium?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              if (onAbrirTurmasDisciplinas != null)
                TextButton(
                  onPressed: habilitado ? onAbrirTurmasDisciplinas : null,
                  child: const Text('Cadastrar'),
                ),
            ],
          ),
        ),
      );
    }

    final valorValido = opcoes.contains(selecionado) ? selecionado : null;
    return InputDecorator(
      decoration: InputDecoration(
        labelText: rotulo,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          key: dropdownKey,
          isExpanded: true,
          value: valorValido,
          hint: Text(dica),
          items: [
            for (final nome in opcoes) DropdownMenuItem<String>(value: nome, child: Text(nome)),
          ],
          onChanged: habilitado
              ? (valor) {
            if (valor != null) onChanged(valor);
          }
              : null,
        ),
      ),
    );
  }
}