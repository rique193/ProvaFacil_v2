import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../local/app_database.dart';
import '../local/relation/prova_com_questoes.dart';
import '../local/relation/questao_com_alternativas.dart';

/// Responsável por gerar o PDF da prova, incluindo:
/// - Cabeçalho (título, disciplina, descrição)
/// - Questões com suas alternativas (A–E)
/// - QR Code de identificação no rodapé com o payload `provafacil://prova/{id}`
///
/// O QR Code será escaneado em entregas futuras para abrir o gabarito e corrigir.
/// Usa pw.BarcodeWidget do próprio package `pdf`, sem dependências externas de render.
abstract final class GeradorPdfProva {
  /// Gera e retorna os bytes do PDF da [provaComQuestoes].
  static Future<Uint8List> gerar(ProvaComQuestoes provaComQuestoes) async {
    final prova = provaComQuestoes.prova;

    // Ordena questões pela ordem cadastrada
    final questoes = [...provaComQuestoes.questoes]
      ..sort((a, b) {
        final porOrdem = a.questao.ordem.compareTo(b.questao.ordem);
        return porOrdem != 0 ? porOrdem : a.questao.id.compareTo(b.questao.id);
      });

    // Payload do QR Code — identifica univocamente esta prova no sistema
    final payloadQr = 'provafacil://prova/${prova.id}';

    final doc = pw.Document(
      title: prova.titulo,
      author: 'ProvaFácil',
      creator: 'ProvaFácil — Gerador de Provas',
    );

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 48, vertical: 56),
        header: (context) => _construirCabecalho(
          prova.titulo,
          prova.disciplina,
          prova.descricao,
        ),
        footer: (context) => _construirRodape(payloadQr, context),
        build: (context) => [
          pw.SizedBox(height: 20),
          for (final (indice, questaoComAlts) in questoes.indexed) ...[
            _construirBlocoQuestao(indice + 1, questaoComAlts),
            pw.SizedBox(height: 18),
          ],
          pw.SizedBox(height: 40),
        ],
      ),
    );

    return doc.save();
  }

  static pw.Widget _construirCabecalho(
    String titulo,
    String disciplina,
    String descricao,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Text(
          titulo,
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          disciplina,
          style: const pw.TextStyle(fontSize: 13, color: PdfColors.grey700),
        ),
        if (descricao.isNotEmpty) ...[
          pw.SizedBox(height: 4),
          pw.Text(
            descricao,
            style: const pw.TextStyle(fontSize: 11),
          ),
        ],
        pw.SizedBox(height: 10),
        pw.Divider(color: PdfColors.grey400),
      ],
    );
  }

  static pw.Widget _construirRodape(String payload, pw.Context context) {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey300),
        pw.SizedBox(height: 6),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Escaneie o QR Code para corrigir esta prova com o ProvaFácil.',
                    style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
                  ),
                  pw.SizedBox(height: 2),
                  pw.Text(
                    payload,
                    style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey500),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'Página ${context.pageNumber} de ${context.pagesCount}',
                    style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey500),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 12),
            // QR Code gerado nativamente pelo package pdf (sem dependência externa de render)
            pw.SizedBox(
              width: 70,
              height: 70,
              child: pw.BarcodeWidget(
                data: payload,
                barcode: pw.Barcode.qrCode(),
                drawText: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static pw.Widget _construirBlocoQuestao(
    int numero,
    QuestaoComAlternativas questaoComAlts,
  ) {
    final questao = questaoComAlts.questao;
    final alternativas = [...questaoComAlts.alternativas]
      ..sort((a, b) => a.ordem.compareTo(b.ordem));

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.RichText(
          text: pw.TextSpan(
            children: [
              pw.TextSpan(
                text: '$numero. ',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              pw.TextSpan(
                text: questao.enunciado,
                style: const pw.TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 8),
        for (final (altIndice, alternativa) in alternativas.indexed)
          _construirAlternativa(altIndice, alternativa),
      ],
    );
  }

  static pw.Widget _construirAlternativa(int indice, AlternativaEntity alternativa) {
    final letra = String.fromCharCode(65 + indice); // A, B, C, D, E
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 20, bottom: 3),
      child: pw.Text(
        '$letra) ${alternativa.texto}',
        style: const pw.TextStyle(fontSize: 11),
      ),
    );
  }
}
