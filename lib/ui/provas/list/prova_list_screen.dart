import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/local/relation/progresso_prova.dart';
import '../../../data/local/relation/prova_com_questoes.dart';
import '../../../domain/prova/status_prova.dart';
import '../../components/prova_facil_card.dart';
import '../../../data/local/app_database.dart';
import '../../../data/repository/aluno_repository.dart';
import '../pdf/pdf_prova_view_model.dart';
import '../pdf/acao_pdf_prova.dart';
import 'prova_list_view_model.dart';

class ProvaListScreen extends StatelessWidget {
  const ProvaListScreen({
    super.key,
    required this.onNovaProva,
    required this.onEditarProva,
    required this.onAbrirGabarito,
    required this.onCorrigirProva,
    required this.onAbrirAlunos,
    required this.onAbrirHistorico,
    this.onAbrirTurmasDisciplinas,
    this.onAbrirBancoQuestoes,
    this.onVisualizarProva,
    this.onGerarProvaDoBanco,
    this.menuConta,
  });

  final VoidCallback onNovaProva;
  final ValueChanged<int> onEditarProva;
  final ValueChanged<int> onAbrirGabarito;
  final ValueChanged<int> onCorrigirProva;
  final VoidCallback onAbrirAlunos;
  final VoidCallback onAbrirHistorico;
  final VoidCallback? onAbrirTurmasDisciplinas;
  final VoidCallback? onAbrirBancoQuestoes;
  final ValueChanged<int>? onVisualizarProva;
  final VoidCallback? onGerarProvaDoBanco;

  /// Botão da conta do professor (com o "Sair"), no fim da barra.
  final Widget? menuConta;

  Future<void> _escolherNovaProva(BuildContext context) async {
    if (onGerarProvaDoBanco == null) {
      onNovaProva();
      return;
    }
    final doBanco = await showModalBottomSheet<bool>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.shuffle),
              title: const Text('Gerar prova do banco'),
              onTap: () => Navigator.pop(context, true),
            ),
            ListTile(
              leading: const Icon(Icons.edit_note),
              title: const Text('Nova prova manual'),
              onTap: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || doBanco == null) return;
    if (doBanco) {
      onGerarProvaDoBanco!();
    } else {
      onNovaProva();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProvaListViewModel>();
    final provas = viewModel.provas;
    final tema = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => PdfProvaViewModel(AlunoRepository(context.read<AppDatabase>())),
      child: Builder(
        builder: (context) {
          // Exibe snackbar quando há erro de geração de PDF
          final pdfViewModel = context.watch<PdfProvaViewModel>();
          if (pdfViewModel.erro != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(pdfViewModel.erro!)),
              );
              pdfViewModel.limparErro();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.w600)),
              backgroundColor: tema.scaffoldBackgroundColor,
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                  onPressed: onAbrirAlunos,
                  tooltip: 'Alunos',
                  icon: const Icon(Icons.person),
                ),
                IconButton(
                  onPressed: onAbrirHistorico,
                  tooltip: 'Histórico',
                  icon: const Icon(Icons.date_range),
                ),
                if (onAbrirTurmasDisciplinas != null)
                  IconButton(
                    onPressed: onAbrirTurmasDisciplinas,
                    tooltip: 'Turmas e disciplinas',
                    icon: const Icon(Icons.class_outlined),
                  ),
                if (onAbrirBancoQuestoes != null)
                  IconButton(
                    onPressed: onAbrirBancoQuestoes,
                    tooltip: 'Banco de questões',
                    icon: const Icon(Icons.library_books_outlined),
                  ),
                ?menuConta,
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => _escolherNovaProva(context),
              icon: const Icon(Icons.add, semanticLabel: 'Nova prova'),
              label: const Text('Nova Prova'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem-vindo!',
                        style: tema.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Você tem ${provas.length} prova(s) cadastrada(s).',
                        style: tema.textTheme.bodyLarge?.copyWith(
                          color: tema.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: provas.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(32),
                          child: Center(
                            child: Text(
                              "Nenhuma prova cadastrada ainda.\nToque em 'Nova Prova' para começar.",
                              textAlign: TextAlign.center,
                              style: tema.textTheme.bodyLarge?.copyWith(
                                color: tema.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 80),
                          itemCount: provas.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemBuilder: (context, indice) {
                            final provaComQuestoes = provas[indice];
                            final provaId = provaComQuestoes.prova.id;
                            return _ProvaListItem(
                              key: ValueKey(provaId),
                              provaComQuestoes: provaComQuestoes,
                              progresso: viewModel.progressoDe(provaId),
                              onClick: () => (onVisualizarProva ?? onEditarProva)(provaId),
                              onAbrirGabarito: () => onAbrirGabarito(provaId),
                              onCorrigir: () => onCorrigirProva(provaId),
                              onExcluir: () => viewModel.excluirProva(provaComQuestoes.prova),
                              onGerarPdf: () => gerarPdfDaProva(context, provaComQuestoes),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProvaListItem extends StatelessWidget {
  const _ProvaListItem({
    super.key,
    required this.provaComQuestoes,
    required this.progresso,
    required this.onClick,
    required this.onAbrirGabarito,
    required this.onCorrigir,
    required this.onExcluir,
    required this.onGerarPdf,
  });

  final ProvaComQuestoes provaComQuestoes;
  final ProgressoProva? progresso;
  final VoidCallback onClick;
  final VoidCallback onAbrirGabarito;
  final VoidCallback onCorrigir;
  final VoidCallback onExcluir;
  final VoidCallback onGerarPdf;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final prova = provaComQuestoes.prova;

    return ProvaFacilCard(
      onTap: onClick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prova.titulo,
                          style: tema.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          prova.disciplina,
                          style: tema.textTheme.bodyMedium?.copyWith(color: tema.colorScheme.primary),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${provaComQuestoes.questoes.length} questão(ões)',
                          style: tema.textTheme.bodySmall?.copyWith(
                            color: tema.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (progresso != null) ...[
                          const SizedBox(height: 8),
                          _ChipStatusProva(progresso: progresso!),
                        ],
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onExcluir,
                  tooltip: 'Excluir prova',
                  icon: Icon(Icons.delete, color: tema.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onGerarPdf,
                  tooltip: 'Gerar PDF com QR Code',
                  icon: const Icon(Icons.picture_as_pdf),
                ),
                TextButton(onPressed: onCorrigir, child: const Text('Corrigir')),
                TextButton(onPressed: onAbrirGabarito, child: const Text('Ver Gabarito')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip com o status da prova e "X de Y corrigidos".
class _ChipStatusProva extends StatelessWidget {
  const _ChipStatusProva({required this.progresso});

  final ProgressoProva progresso;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final status = progresso.status;
    final (fundo, texto) = switch (status) {
      StatusProva.pendente => (cores.surfaceContainerHighest, cores.onSurfaceVariant),
      StatusProva.emCorrecao => (cores.tertiaryContainer, cores.onTertiaryContainer),
      StatusProva.corrigida => (cores.primaryContainer, cores.onPrimaryContainer),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: fundo, borderRadius: BorderRadius.circular(16)),
      child: Text(
        '${status.rotulo} · ${progresso.textoProgresso}',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: texto),
      ),
    );
  }
}