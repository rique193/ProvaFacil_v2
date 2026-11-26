import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/local/relation/prova_com_questoes.dart';
import '../../../util/mensagem_erro.dart';
import 'pdf_prova_view_model.dart';
import 'selecao_alunos_pdf_dialog.dart';

/// Mesma seleção de alunos e ações de PDF na lista e na visualização da prova.
Future<void> gerarPdfDaProva(
  BuildContext context,
  ProvaComQuestoes prova,
) async {
  final viewModel = context.read<PdfProvaViewModel>();
  try {
    final alunos = await viewModel.alunosDaProva(prova.prova);
    if (!context.mounted) return;
    final escolha = await escolherAlunosDoPdf(
      context,
      alunos: alunos,
      turma: prova.prova.turma,
    );
    if (escolha == null || !context.mounted) return;
    switch (escolha.acao) {
      case AcaoPdf.visualizar:
        await viewModel.visualizar(prova, escolha.alunos);
      case AcaoPdf.compartilhar:
        await viewModel.compartilhar(prova, escolha.alunos);
    }
  } catch (erro) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensagemDoErro(erro) ?? 'Não foi possível gerar o PDF da prova.',
        ),
      ),
    );
  }
}
