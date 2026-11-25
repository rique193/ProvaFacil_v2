import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/local/app_database.dart';
import '../components/prova_facil_card.dart';
import '../components/prova_facil_text_field.dart';
import 'alunos_ui_state.dart';
import 'alunos_view_model.dart';

/// Tela de Alunos. Os diálogos seguem o estado do [AlunosViewModel] (como no Compose): o de cadastro
/// ou edição aparece enquanto `mostrarDialogoAluno` for verdadeiro, e o de exclusão enquanto houver
/// `confirmacaoExclusao`.
class AlunosScreen extends StatefulWidget {
  const AlunosScreen({super.key, required this.onVoltar});

  final VoidCallback onVoltar;

  @override
  State<AlunosScreen> createState() => _AlunosScreenState();
}

class _AlunosScreenState extends State<AlunosScreen> {
  late final AlunosViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<AlunosViewModel>()..addListener(_aoMudarEstado);
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

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AlunosViewModel>();
    final uiState = viewModel.uiState;
    final tema = Theme.of(context);
    final confirmacao = uiState.confirmacaoExclusao;
    final dialogoAberto = uiState.mostrarDialogoAluno || confirmacao != null;

    return PopScope(
      canPop: !dialogoAberto,
      onPopInvokedWithResult: (saiu, _) {
        if (saiu) return;
        if (confirmacao != null) {
          viewModel.cancelarExclusao();
        } else {
          viewModel.fecharDialogoAluno();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Alunos', style: TextStyle(fontWeight: FontWeight.w600)),
              backgroundColor: tema.scaffoldBackgroundColor,
              scrolledUnderElevation: 0,
              leading: BackButton(onPressed: widget.onVoltar),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: viewModel.abrirDialogoNovoAluno,
              icon: const Icon(Icons.add, semanticLabel: 'Novo aluno'),
              label: const Text('Novo Aluno'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ProvaFacilTextField(
                    value: uiState.busca,
                    onChanged: viewModel.atualizarBusca,
                    label: 'Buscar por nome ou matrícula',
                    singleLine: true,
                  ),
                ),
                Expanded(
                  child: _ListaAlunos(uiState: uiState, viewModel: viewModel),
                ),
              ],
            ),
          ),
          if (uiState.mostrarDialogoAluno)
            _Modal(
              aoFechar: viewModel.fecharDialogoAluno,
              child: _AlunoDialog(form: uiState.formAluno, viewModel: viewModel),
            ),
          if (confirmacao != null)
            _Modal(
              aoFechar: viewModel.cancelarExclusao,
              child: AlertDialog(
                title: const Text('Excluir aluno'),
                content: Text(confirmacao.mensagem),
                actions: [
                  TextButton(onPressed: viewModel.cancelarExclusao, child: const Text('Cancelar')),
                  TextButton(
                    onPressed: viewModel.confirmarExclusao,
                    child: Text('Excluir', style: TextStyle(color: tema.colorScheme.error)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Fundo escurecido de diálogo: tocar fora fecha, como o `onDismissRequest` do Compose.
class _Modal extends StatelessWidget {
  const _Modal({required this.aoFechar, required this.child});

  final VoidCallback aoFechar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          ModalBarrier(color: Colors.black54, onDismiss: aoFechar),
          child,
        ],
      ),
    );
  }
}

class _ListaAlunos extends StatelessWidget {
  const _ListaAlunos({required this.uiState, required this.viewModel});

  final AlunosUiState uiState;
  final AlunosViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (uiState.carregando) return const SizedBox.shrink();
    if (uiState.alunos.isEmpty) {
      return const _MensagemCentral(
        'Nenhum aluno cadastrado ainda.\n'
        'Toque em "Novo Aluno" ou corrija uma prova para começar.',
      );
    }
    if (uiState.alunosFiltrados.isEmpty) {
      return _MensagemCentral('Nenhum aluno encontrado para "${uiState.busca}".');
    }

    final itens = <Object>[
      for (final MapEntry(key: turma, value: alunosDaTurma) in uiState.alunosPorTurma.entries) ...[
        turma,
        ...alunosDaTurma,
      ],
    ];
    final tema = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 96),
      itemCount: itens.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, indice) => switch (itens[indice]) {
        final AlunoEntity aluno => _AlunoCard(
          key: ValueKey(aluno.id),
          aluno: aluno,
          onTap: () => viewModel.abrirDialogoEditarAluno(aluno),
        ),
        // A turma já vem salva como "Turma X", então é exibida sem prefixo extra.
        final Object turma => Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(
            '$turma',
            style: tema.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: tema.colorScheme.primary,
            ),
          ),
        ),
      },
    );
  }
}

class _MensagemCentral extends StatelessWidget {
  const _MensagemCentral(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: tema.textTheme.bodyLarge?.copyWith(color: tema.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}

class _AlunoCard extends StatelessWidget {
  const _AlunoCard({super.key, required this.aluno, required this.onTap});

  final AlunoEntity aluno;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final estiloSecundario = tema.textTheme.bodyMedium?.copyWith(
      color: tema.colorScheme.onSurfaceVariant,
    );
    final matricula = aluno.matricula;
    final email = aluno.email;
    return ProvaFacilCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              aluno.nome,
              style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              matricula == null ? 'Sem matrícula' : 'Matrícula: $matricula',
              style: estiloSecundario,
            ),
            if (email != null) Text(email, style: estiloSecundario),
          ],
        ),
      ),
    );
  }
}

class _AlunoDialog extends StatelessWidget {
  const _AlunoDialog({required this.form, required this.viewModel});

  final AlunoFormState form;
  final AlunosViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final turmaNormalizada = form.turmaNormalizada;
    final erro = form.erro;
    return AlertDialog(
      scrollable: true,
      title: Text(form.editando ? 'Editar aluno' : 'Novo Aluno'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProvaFacilTextField(
            value: form.nome,
            onChanged: viewModel.atualizarNome,
            label: 'Nome',
            singleLine: true,
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProvaFacilTextField(
                value: form.turma,
                onChanged: viewModel.atualizarTurma,
                label: 'Turma',
                singleLine: true,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 4),
                child: Text(
                  turmaNormalizada.isEmpty
                      ? 'Ex.: "A" será salvo como "Turma A"'
                      : 'Será salvo como "$turmaNormalizada"',
                  style: tema.textTheme.bodySmall?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ProvaFacilTextField(
            value: form.matricula,
            onChanged: viewModel.atualizarMatricula,
            label: 'Matrícula (opcional)',
            singleLine: true,
          ),
          const SizedBox(height: 12),
          ProvaFacilTextField(
            value: form.email,
            onChanged: viewModel.atualizarEmail,
            label: 'E-mail (opcional)',
            keyboardType: TextInputType.emailAddress,
            singleLine: true,
          ),
          if (erro != null) ...[
            const SizedBox(height: 12),
            Text(erro, style: tema.textTheme.bodySmall?.copyWith(color: tema.colorScheme.error)),
          ],
        ],
      ),
      actions: [
        if (form.editando)
          TextButton(
            onPressed: form.salvando ? null : viewModel.pedirExclusao,
            child: Text('Excluir', style: TextStyle(color: tema.colorScheme.error)),
          ),
        TextButton(onPressed: viewModel.fecharDialogoAluno, child: const Text('Cancelar')),
        TextButton(
          onPressed: form.salvando ? null : viewModel.confirmarAluno,
          child: Text(form.editando ? 'Salvar' : 'Adicionar'),
        ),
      ],
    );
  }
}
