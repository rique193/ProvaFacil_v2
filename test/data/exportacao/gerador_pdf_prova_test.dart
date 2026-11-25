import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/exportacao/gerador_pdf_prova.dart';
import 'package:provafacil/data/exportacao/nome_arquivo_relatorio.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/prova_com_questoes.dart';
import 'package:provafacil/data/local/relation/questao_com_alternativas.dart';
import 'package:provafacil/domain/scanner/qr_code_prova.dart';

void main() {
  ProvaComQuestoes prova({int questoes = 3, String turma = 'Turma A'}) =>
      ProvaComQuestoes(
        prova: ProvaEntity(
          id: 7,
          titulo: 'Avaliação de Matemática',
          disciplina: 'Matemática',
          descricao: '',
          criadaEm: 0,
          turma: turma,
        ),
        questoes: [
          for (var q = 1; q <= questoes; q++)
            QuestaoComAlternativas(
              questao: QuestaoEntity(
                id: q,
                provaId: 7,
                enunciado: 'Quanto é $q + $q?',
                ordem: q,
              ),
              alternativas: [
                for (var a = 0; a < 5; a++)
                  AlternativaEntity(
                    id: q * 10 + a,
                    questaoId: q,
                    texto: 'Opção $a',
                    correta: a == 0,
                    ordem: a,
                  ),
              ],
            ),
        ],
      );

  AlunoEntity aluno(int id, String nome, {String turma = 'Turma A'}) =>
      AlunoEntity(id: id, nome: nome, turma: turma);

  int paginas(List<int> pdf) =>
      RegExp(r'/Type\s*/Page(?![s\w])')
          .allMatches(latin1.decode(pdf, allowInvalid: true))
          .length;

  test(
    'o texto do QR de cada aluno é lido como válido com prova, aluno e turma',
    () {
      final alunos = [
        aluno(1, 'Ana Souza'),
        aluno(2, 'João da Conceição Ávila'),
        aluno(3, 'Maria  José', turma: 'Turma B'),
      ];

      for (final a in alunos) {
        final leitura = QrCodeProva.ler(GeradorPdfProva.textoQr(7, a));
        expect(leitura, isA<Valido>());
        final dados = (leitura as Valido).dados;
        expect(dados.provaId, 7);
        expect(dados.aluno, a.nome.replaceAll(RegExp(r'\s+'), ' '));
        expect(dados.turma, a.turma);
      }
      expect(
        GeradorPdfProva.textoQr(7, alunos[1]),
        'PROVAFACIL|1|7|João da Conceição Ávila|Turma A',
      );
    },
  );

  test('uma página de gabarito por aluno depois do caderno', () async {
    final semAlunos = await GeradorPdfProva.gerar(prova(), alunos: const []);
    final base = paginas(semAlunos);
    expect(base, greaterThanOrEqualTo(1));

    final tres = await GeradorPdfProva.gerar(
      prova(),
      alunos: [aluno(1, 'Ana'), aluno(2, 'João Ávila'), aluno(3, 'Maria José')],
    );
    expect(paginas(tres), base + 3);
  });

  test('prova longa continua com uma página por aluno', () async {
    final pdf = await GeradorPdfProva.gerar(
      prova(questoes: 40),
      alunos: [aluno(1, 'Ana'), aluno(2, 'Bia')],
    );
    final sem = await GeradorPdfProva.gerar(
      prova(questoes: 40),
      alunos: const [],
    );
    expect(paginas(pdf), paginas(sem) + 2);
  });

  test('QR Code tem pelo menos 4 cm', () {
    expect(GeradorPdfProva.tamanhoQr, greaterThanOrEqualTo(4 * 28.3464));
  });

  test('nome do arquivo sem acento', () {
    final dia = DateTime.utc(2026, 11, 26, 12).millisecondsSinceEpoch;
    expect(
      nomeArquivoPdfProva('Avaliação de Matemática: N3', dia, utc: true),
      'Avaliacao_de_Matematica_N3_26-11-2026.pdf',
    );
    expect(nomeArquivoPdfProva('???', dia, utc: true), 'prova_26-11-2026.pdf');
  });
}
