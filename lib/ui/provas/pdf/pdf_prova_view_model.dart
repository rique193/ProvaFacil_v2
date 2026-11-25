import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';
import 'package:provafacil/data/exportacao/gerador_pdf_prova.dart';
import 'package:provafacil/data/local/relation/prova_com_questoes.dart';

/// ViewModel responsável pela geração e compartilhamento/impressão do PDF de uma prova.
class PdfProvaViewModel extends ChangeNotifier {
  bool _gerando = false;
  String? _erro;

  bool get gerando => _gerando;
  String? get erro => _erro;

  void limparErro() {
    _erro = null;
    notifyListeners();
  }

  /// Gera os bytes do PDF com QR Code integrado e abre a caixa de diálogo de compartilhamento/impressão.
  Future<void> gerarECompartilhar(ProvaComQuestoes provaComQuestoes) async {
    if (_gerando) return;
    _gerando = true;
    _erro = null;
    notifyListeners();

    try {
      final bytes = await GeradorPdfProva.gerar(provaComQuestoes);
      final tituloLimpo = provaComQuestoes.prova.titulo
          .replaceAll(RegExp(r'[<>:"/\\|?*]'), '')
          .trim()
          .replaceAll(' ', '_');
      final nomeArquivo = '${tituloLimpo.isEmpty ? 'Prova' : tituloLimpo}.pdf';
      await Printing.sharePdf(bytes: bytes, filename: nomeArquivo);
    } catch (e) {
      _erro = 'Não foi possível gerar o PDF da prova: ${e.toString()}';
    } finally {
      _gerando = false;
      notifyListeners();
    }
  }
}
