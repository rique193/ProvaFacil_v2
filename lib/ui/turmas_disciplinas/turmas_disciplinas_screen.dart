import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/aluno/formato_turma.dart';
import '../components/prova_facil_card.dart';
import '../components/prova_facil_text_field.dart';
import 'turmas_disciplinas_view_model.dart';

class TurmasDisciplinasScreen extends StatefulWidget {
  const TurmasDisciplinasScreen({super.key, required this.onVoltar});

  final VoidCallback onVoltar;

  @override
  State<TurmasDisciplinasScreen> createState() => _TurmasDisciplinasScreenState();
}

class _TurmasDisciplinasScreenState extends State<TurmasDisciplinasScreen>
    with SingleTickerProviderStateMixin {
  late final TurmasDisciplinasViewModel _viewModel;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)..addListener(_aoMudarAba);
    _viewModel = context.read<TurmasDisciplinasViewModel>()..addListener(_aoMudarEstado);
  }

  void _aoMudarAba() {
    if (!_tabController.indexIsChanging) setState(() {});
  }

  void _aoMudarEstado() {
    final mensagem = _viewModel.uiState.mensagem;
    if (mensagem == null) return;
    _viewModel.mensagemExibida();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  void dispose() {
    _tabController.removeListener(_aoMudarAba);
    _tabController.dispose();
    _viewModel.removeListener(_aoMudarEstado);
    super.dispose();
  }

  Future<void> _abrirDialogoAdicionar() async {
    final ehTurma = _tabController.index == 0;
    final nome = await showDialog<String>(
      context: context,
      builder: (_) => _DialogoNovoCadastro(ehTurma: ehTurma),
    );
    if (nome == null || !mounted) return;
    if (ehTurma) {
      await _viewModel.adicionarTurma(nome);
    } else {
      await _viewModel.adicionarDisciplina(nome);
    }
  }

  Future<void> _confirmarExclusao({
    required String tipo,
    required String nome,
    required Future<void> Function() aoConfirmar,
  }) async {
    final tema = Theme.of(context);
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Excluir $tipo'),
        content: Text('Deseja excluir "$nome"?'),
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
      await aoConfirmar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final uiState = context.watch<TurmasDisciplinasViewModel>().uiState;
    final tema = Theme.of(context);
    final ehTurma = _tabController.index == 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas e Disciplinas', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: tema.scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        leading: BackButton(onPressed: widget.onVoltar),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Turmas'),
            Tab(text: 'Disciplinas'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirDialogoAdicionar,
        icon: const Icon(Icons.add),
        label: Text(ehTurma ? 'Nova Turma' : 'Nova Disciplina'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ListaItens(
            vazio: 'Nenhuma turma cadastrada ainda.\nToque em "Nova Turma" para começar.',
            carregando: uiState.carregando,
            itens: [
              for (final turma in uiState.turmas)
                (
                id: turma.id,
                nome: turma.nome,
                onExcluir: () => _confirmarExclusao(
                  tipo: 'turma',
                  nome: turma.nome,
                  aoConfirmar: () => _viewModel.excluirTurma(turma.id),
                ),
                ),
            ],
          ),
          _ListaItens(
            vazio: 'Nenhuma disciplina cadastrada ainda.\nToque em "Nova Disciplina" para começar.',
            carregando: uiState.carregando,
            itens: [
              for (final disciplina in uiState.disciplinas)
                (
                id: disciplina.id,
                nome: disciplina.nome,
                onExcluir: () => _confirmarExclusao(
                  tipo: 'disciplina',
                  nome: disciplina.nome,
                  aoConfirmar: () => _viewModel.excluirDisciplina(disciplina.id),
                ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ListaItens extends StatelessWidget {
  const _ListaItens({
    required this.vazio,
    required this.carregando,
    required this.itens,
  });

  final String vazio;
  final bool carregando;
  final List<({int id, String nome, VoidCallback onExcluir})> itens;

  @override
  Widget build(BuildContext context) {
    if (carregando) return const SizedBox.shrink();
    final tema = Theme.of(context);
    if (itens.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            vazio,
            textAlign: TextAlign.center,
            style: tema.textTheme.bodyLarge?.copyWith(color: tema.colorScheme.onSurfaceVariant),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 96),
      itemCount: itens.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (_, indice) {
        final item = itens[indice];
        return ProvaFacilCard(
          key: ValueKey(item.id),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.nome,
                    style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  onPressed: item.onExcluir,
                  tooltip: 'Excluir ${item.nome}',
                  icon: Icon(Icons.delete, color: tema.colorScheme.error),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DialogoNovoCadastro extends StatefulWidget {
  const _DialogoNovoCadastro({required this.ehTurma});

  final bool ehTurma;

  @override
  State<_DialogoNovoCadastro> createState() => _DialogoNovoCadastroState();
}

class _DialogoNovoCadastroState extends State<_DialogoNovoCadastro> {
  String _nome = '';

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final normalizada = widget.ehTurma ? FormatoTurma.normalizar(_nome) : '';

    return AlertDialog(
      title: Text(widget.ehTurma ? 'Nova Turma' : 'Nova Disciplina'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProvaFacilTextField(
            value: _nome,
            onChanged: (valor) => setState(() => _nome = valor),
            label: widget.ehTurma ? 'Nome da turma' : 'Nome da disciplina',
            singleLine: true,
          ),
          if (widget.ehTurma)
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 4),
              child: Text(
                normalizada.isEmpty
                    ? 'Ex.: "A" será salvo como "Turma A"'
                    : 'Será salvo como "$normalizada"',
                style: tema.textTheme.bodySmall?.copyWith(
                  color: tema.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(_nome),
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}