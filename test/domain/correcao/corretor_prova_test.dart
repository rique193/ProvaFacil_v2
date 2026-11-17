import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';

List<GabaritoQuestao> gabarito(List<String?> letras) => [
  for (final (i, l) in letras.indexed)
    GabaritoQuestao(questaoId: 100 + i, numero: i + 1, letraCorreta: l),
];

void main() {
  test('todasCertas_notaMaxima', () {
    final c = CorretorProva.corrigir(gabarito(['A', 'B', 'C', 'D']), {
      1: {'A'},
      2: {'B'},
      3: {'C'},
      4: {'D'},
    });
    expect([c.acertos, c.erros, c.emBranco, c.nota], [4, 0, 0, 10.0]);
    expect(c.questoes.every((q) => q.acertou), isTrue);
  });
  test('identificaAcertoErroEmBrancoEMarcacaoMultipla', () {
    final c = CorretorProva.corrigir(gabarito(['A', 'B', 'C', 'D']), {
      1: {'A'},
      2: {'E'},
      4: {'D', 'A'},
    });
    expect(c.questoes.map((q) => q.situacao), SituacaoQuestao.values);
    expect([c.acertos, c.erros, c.emBranco, c.nota], [1, 2, 1, 2.5]);
  });
  test('guardaQualAlternativaOAlunoMarcou', () {
    final q = CorretorProva.corrigir(gabarito(['C']), {
      1: {'b'},
    }).questoes.single;
    expect(q.letrasMarcadas, {'B'});
    expect(q.letraCorreta, 'C');
    expect(q.questaoId, 100);
    expect(q.acertou, isFalse);
  });
  test(
    'letraMinusculaContaComoAcerto',
    () => expect(
      CorretorProva.corrigir(gabarito(['E']), {
        1: {'e'},
      }).questoes.single.situacao,
      SituacaoQuestao.acerto,
    ),
  );
  test(
    'conjuntoVazioContaComoEmBranco',
    () => expect(
      CorretorProva.corrigir(gabarito(['A']), {1: {}}).questoes.single.situacao,
      SituacaoQuestao.emBranco,
    ),
  );
  test('ignoraRespostasDeQuestoesQueNaoExistem', () {
    final c = CorretorProva.corrigir(gabarito(['A']), {
      1: {'A'},
      7: {'B'},
    });
    expect(c.totalQuestoes, 1);
    expect(c.nota, 10.0);
  });
  test('ordenaQuestoesPeloNumero', () {
    final c = CorretorProva.corrigir([
      const GabaritoQuestao(questaoId: 2, numero: 2, letraCorreta: 'B'),
      const GabaritoQuestao(questaoId: 1, numero: 1, letraCorreta: 'A'),
    ], {});
    expect(c.questoes.map((q) => q.numero), [1, 2]);
  });
  test(
    'gabaritoIncompleto_lancaExcecaoComAsQuestoesFaltando',
    () => expect(
      () => CorretorProva.corrigir(gabarito(['A', null, 'C', null]), {}),
      throwsA(
        isA<GabaritoIncompletoException>().having(
          (e) => e.questoesSemGabarito,
          'questões',
          [2, 4],
        ),
      ),
    ),
  );
  test(
    'provaSemNenhumGabarito_lancaExcecaoPropria',
    () => expect(
      () => CorretorProva.corrigir(gabarito([null, null]), {}),
      throwsA(
        isA<ProvaSemGabaritoException>()
            .having((e) => e.questoesSemGabarito, 'questões', [1, 2])
            .having(
              (e) => e.mensagem,
              'mensagem',
              contains('ainda não tem gabarito'),
            ),
      ),
    ),
  );
  test('calculaNotaProporcionalComArredondamento', () {
    for (final (a, t, n, esperada) in [
      (15, 20, 10.0, 7.5),
      (2, 3, 10.0, 6.67),
      (1, 3, 10.0, 3.33),
      (0, 5, 10.0, 0.0),
      (5, 10, 100.0, 50.0),
    ]) {
      expect(CorretorProva.calcularNota(a, t, notaMaxima: n), esperada);
    }
  });
  test('provaSemQuestoes_notaZero', () {
    final c = CorretorProva.corrigir([], {});
    expect(c.totalQuestoes, 0);
    expect(c.nota, 0.0);
  });
  test('HALF_UP decimal, expoentes e limites', () {
    expect(CorretorProva.calcularNota(1, 1, notaMaxima: 1.005), 1.01);
    expect(CorretorProva.calcularNota(1, 1, notaMaxima: 2.675), 2.68);
    expect(CorretorProva.calcularNota(1, 2, notaMaxima: 1e-7), 0.0);
    expect(CorretorProva.calcularNota(1, 2, notaMaxima: 1e21), 5e20);
    for (final a in [-1, 4]) {
      expect(() => CorretorProva.calcularNota(a, 3), throwsArgumentError);
    }
    for (final n in [
      0.0,
      -1.0,
      double.nan,
      double.infinity,
      double.negativeInfinity,
    ]) {
      expect(
        () => CorretorProva.corrigir(gabarito(['A']), {}, notaMaxima: n),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'mensagem',
            'A nota máxima deve ser maior que zero.',
          ),
        ),
      );
    }
    expect(CorretorProva.calcularNota(0, 0), 0);
  });
}
