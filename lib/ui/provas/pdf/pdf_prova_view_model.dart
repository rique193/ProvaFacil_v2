import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';

import '../../../data/exportacao/gerador_pdf_prova.dart';
import '../../../data/exportacao/nome_arquivo_relatorio.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/relation/prova_com_questoes.dart';
import '../../../data/repository/aluno_repository.dart';
import '../../../util/mensagem_erro.dart';

/// ViewModel do PDF de uma prova: lista os alunos que podem receber folha de respostas e gera o
/// PDF para visualizar/imprimir ou compartilhar.
class PdfProvaViewModel extends ChangeNotifier {
  PdfProvaViewModel(this._alunos);

  final AlunoRepository _alunos;

  bool _gerando = false;
  String? _erro;

  bool get gerando => _gerando;
  String? get erro => _erro;

  void limparErro() {
    _erro = null;
    notifyListeners();
  }

  /// Alunos da turma da prova (ignorando maiúsculas e espaços nas pontas). Se a prova não tem
  /// turma, todos os alunos.
  Future<List<AlunoEntity>> alunosDaProva(ProvaEntity prova) async {
    final todos = await _alunos.observarAlunos().first;
    final turma = prova.turma.trim().toLowerCase();
    if (turma.isEmpty) return todos;
    return [
      for (final aluno in todos)
        if (aluno.turma.trim().toLowerCase() == turma) aluno,
    ];
  }

  /// Abre a visualização do PDF, de onde o professor pode imprimir.
  Future<void> visualizar(ProvaComQuestoes prova, List<AlunoEntity> alunos) =>
      _executar(() async {
        final bytes = await GeradorPdfProva.gerar(prova, alunos: alunos);
        await Printing.layoutPdf(
          onLayout: (_) => bytes,
          name: _nomeArquivo(prova),
        );
      });

  /// Abre o compartilhamento do PDF.
  Future<void> compartilhar(ProvaComQuestoes prova, List<AlunoEntity> alunos) =>
      _executar(() async {
        final bytes = await GeradorPdfProva.gerar(prova, alunos: alunos);
        await Printing.sharePdf(bytes: bytes, filename: _nomeArquivo(prova));
      });

  String _nomeArquivo(ProvaComQuestoes prova) => nomeArquivoPdfProva(
    prova.prova.titulo,
    DateTime.now().millisecondsSinceEpoch,
  );

  Future<void> _executar(Future<void> Function() acao) async {
    if (_gerando) return;
    _gerando = true;
    _erro = null;
    notifyListeners();

    try {
      await acao();
    } catch (e) {
      _erro = mensagemDoErro(e) ?? 'Não foi possível gerar o PDF da prova.';
    } finally {
      _gerando = false;
      notifyListeners();
    }
  }
}
