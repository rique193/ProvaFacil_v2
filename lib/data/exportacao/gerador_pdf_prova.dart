import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../domain/scanner/qr_code_prova.dart';
import '../local/app_database.dart';
import '../local/relation/prova_com_questoes.dart';
import '../local/relation/questao_com_alternativas.dart';

/// Gera o PDF da prova:
/// 1. o caderno de questões (sem QR Code), com a ordem de questões e alternativas gravada na prova;
/// 2. depois, uma folha de respostas por aluno, em página separada, com o QR Code lido pela câmera
///    do app (`PROVAFACIL|1|<idProva>|<aluno>|<turma>`) e a grade de círculos A–E.
abstract final class GeradorPdfProva {
  /// Tamanho do QR Code da folha de respostas: 5 cm.
  static const tamanhoQr = 5 * PdfPageFormat.cm;

  /// Quantas questões ficam em cada bloco da grade de respostas.
  static const _questoesPorBloco = 20;

  /// Quantos blocos cabem lado a lado na largura da página.
  static const _blocosPorFaixa = 3;

  /// Texto do QR Code da folha do [aluno] nesta prova. Sempre vem de [QrCodeProva.gerar].
  static String textoQr(int provaId, AlunoEntity aluno) => QrCodeProva.gerar(
    DadosQrCode(provaId: provaId, aluno: aluno.nome, turma: aluno.turma),
  );

  /// Gera e retorna os bytes do PDF da [provaComQuestoes], com uma folha de respostas para cada
  /// aluno de [alunos].
  static Future<Uint8List> gerar(
    ProvaComQuestoes provaComQuestoes, {
    required List<AlunoEntity> alunos,
  }) async {
    final prova = provaComQuestoes.prova;

    // A ordem gravada é a definitiva: só ordena por `ordem` (nada de embaralhar).
    final questoes = [...provaComQuestoes.questoes]
      ..sort((a, b) {
        final porOrdem = a.questao.ordem.compareTo(b.questao.ordem);
        return porOrdem != 0 ? porOrdem : a.questao.id.compareTo(b.questao.id);
      });

    final doc = pw.Document(
      title: prova.titulo,
      author: 'ProvaFácil',
      creator: 'ProvaFácil — Gerador de Provas',
    );

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 48, vertical: 56),
        header: (context) =>
            _construirCabecalho(prova.titulo, prova.disciplina, prova.turma),
        footer: (context) => _construirRodape(context),
        build: (context) => [
          pw.SizedBox(height: 12),
          _construirCamposAluno(),
          pw.SizedBox(height: 16),
          if (prova.descricao.isNotEmpty) ...[
            pw.Text(prova.descricao, style: const pw.TextStyle(fontSize: 11)),
            pw.SizedBox(height: 14),
          ],
          for (final (indice, questaoComAlts) in questoes.indexed) ...[
            _construirBlocoQuestao(indice + 1, questaoComAlts),
            pw.SizedBox(height: 18),
          ],
        ],
      ),
    );

    for (final aluno in alunos) {
      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          build: (context) => _construirFolhaDeRespostas(
            prova: prova,
            aluno: aluno,
            totalQuestoes: questoes.length,
          ),
        ),
      );
    }

    return doc.save();
  }

  static pw.Widget _construirCabecalho(
    String titulo,
    String disciplina,
    String turma,
  ) {
    final detalhes = [
      disciplina,
      if (turma.trim().isNotEmpty) turma.trim(),
    ].join('  -  ');
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Text(
          titulo,
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          detalhes,
          style: const pw.TextStyle(fontSize: 13, color: PdfColors.grey700),
        ),
        pw.SizedBox(height: 10),
        pw.Divider(color: PdfColors.grey400),
      ],
    );
  }

  static pw.Widget _construirCamposAluno() {
    pw.Widget campo(String rotulo) => pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Text(rotulo, style: const pw.TextStyle(fontSize: 12)),
        pw.SizedBox(width: 6),
        pw.Expanded(
          child: pw.Container(
            height: 14,
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(color: PdfColors.grey700),
              ),
            ),
          ),
        ),
      ],
    );
    return pw.Row(
      children: [
        pw.Expanded(flex: 3, child: campo('Nome:')),
        pw.SizedBox(width: 24),
        pw.Expanded(flex: 1, child: campo('Data:')),
      ],
    );
  }

  static pw.Widget _construirRodape(pw.Context context) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Text(
        'Página ${context.pageNumber} de ${context.pagesCount}',
        style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey500),
      ),
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
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 20, bottom: 3),
            child: pw.Text(
              '${String.fromCharCode(65 + altIndice)}) ${alternativa.texto}',
              style: const pw.TextStyle(fontSize: 11),
            ),
          ),
      ],
    );
  }

  static List<pw.Widget> _construirFolhaDeRespostas({
    required ProvaEntity prova,
    required AlunoEntity aluno,
    required int totalQuestoes,
  }) {
    final turma = aluno.turma.trim();
    return [
      pw.Text(
        prova.titulo,
        style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        prova.disciplina,
        style: const pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
      ),
      pw.SizedBox(height: 10),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Folha de respostas',
                  style: const pw.TextStyle(fontSize: 11),
                ),
                pw.SizedBox(height: 6),
                pw.Text(
                  aluno.nome,
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                if (turma.isNotEmpty) ...[
                  pw.SizedBox(height: 2),
                  pw.Text(turma, style: const pw.TextStyle(fontSize: 13)),
                ],
                pw.SizedBox(height: 14),
                pw.Text(
                  'Preencha apenas uma alternativa por questão.',
                  style: const pw.TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          pw.SizedBox(width: 12),
          pw.BarcodeWidget(
            barcode: pw.Barcode.qrCode(),
            data: textoQr(prova.id, aluno),
            width: tamanhoQr,
            height: tamanhoQr,
            drawText: false,
          ),
        ],
      ),
      pw.SizedBox(height: 14),
      pw.Divider(color: PdfColors.grey400),
      pw.SizedBox(height: 8),
      // Blocos de 20 questões lado a lado (até 3 por faixa, o que cabe na largura da página).
      // Cada faixa é um widget próprio, então provas longas quebram de página entre faixas.
      for (
        var faixa = 1;
        faixa <= totalQuestoes;
        faixa += _questoesPorBloco * _blocosPorFaixa
      )
        pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 8),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              for (var b = 0; b < _blocosPorFaixa; b++)
                if (faixa + b * _questoesPorBloco <= totalQuestoes) ...[
                  if (b > 0) pw.SizedBox(width: 24),
                  pw.Column(
                    children: [
                      for (
                        var n = faixa + b * _questoesPorBloco;
                        n < faixa + (b + 1) * _questoesPorBloco &&
                            n <= totalQuestoes;
                        n++
                      )
                        _construirLinhaGrade(n),
                    ],
                  ),
                ],
            ],
          ),
        ),
    ];
  }

  static pw.Widget _construirLinhaGrade(int numero) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 5),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 26,
            child: pw.Text(
              '$numero',
              textAlign: pw.TextAlign.right,
              style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(width: 8),
          for (var i = 0; i < 5; i++) ...[
            pw.Container(
              width: 17,
              height: 17,
              alignment: pw.Alignment.center,
              decoration: pw.BoxDecoration(
                shape: pw.BoxShape.circle,
                border: pw.Border.all(color: PdfColors.black, width: 0.8),
              ),
              child: pw.Text(
                String.fromCharCode(65 + i),
                style: const pw.TextStyle(
                  fontSize: 8,
                  color: PdfColors.grey700,
                ),
              ),
            ),
            if (i < 4) pw.SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}
