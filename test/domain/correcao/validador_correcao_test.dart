import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/correcao/validador_correcao.dart';

import '../../ajudantes/cenarios_correcao.dart';

List<EstruturaQuestao> estrutura(
  int total, [
  List<String> letras = letrasAE,
]) => [
  for (var n = 1; n <= total; n++) EstruturaQuestao(numero: n, letras: letras),
];

void main() {
  test('leituraCompleta_semAvisos', () {
    final v = ValidadorCorrecao.validarLeitura({
      1: {'A'},
      2: {'B'},
      3: {'C'},
    }, estrutura(3));
    expect(v.completa, isTrue);
    expect(v.temAvisos, isFalse);
    expect(v.detectadas, 3);
    expect(v.totalQuestoes, 3);
  });
  test('respostasIncompletas_listaQuestoesEmBranco', () {
    final v = ValidadorCorrecao.validarLeitura({
      1: {'A'},
      3: {},
    }, estrutura(4));
    expect(v.completa, isFalse);
    expect(v.emBranco, [2, 3, 4]);
    expect(v.detectadas, 1);
    expect(v.avisos.single, contains('2, 3, 4'));
  });
  test('marcacaoMultipla_mantidaEListada', () {
    final v = ValidadorCorrecao.validarLeitura({
      1: {'A', 'C'},
    }, estrutura(1));
    expect(v.respostas[1], {'A', 'C'});
    expect(v.marcacaoMultipla, [1]);
    expect(v.completa, isTrue);
  });
  test('letraQueNaoExisteNaQuestao_eDescartada', () {
    final v = ValidadorCorrecao.validarLeitura({
      1: {'E'},
      2: {'B', 'Z'},
    }, estrutura(2, ['A', 'B', 'C', 'D']));
    expect(v.respostas, {
      2: {'B'},
    });
    expect(v.letrasInvalidas, {
      1: {'E'},
      2: {'Z'},
    });
    expect(v.emBranco, [1]);
    expect(v.avisos.any((a) => a.contains('descartadas')), isTrue);
  });
  test('questaoQueNaoExisteNaProva_eIgnorada', () {
    final v = ValidadorCorrecao.validarLeitura({
      1: {'A'},
      2: {'B'},
      5: {'C'},
      0: {'D'},
      9: {},
    }, estrutura(2));
    expect(v.respostas.keys.toSet(), {1, 2});
    expect(v.foraDaProva, [0, 5]);
    expect(v.completa, isTrue);
  });
  test(
    'letrasMinusculasSaoNormalizadas',
    () => expect(
      ValidadorCorrecao.validarLeitura({
        1: {'b'},
      }, estrutura(1)).respostas,
      {
        1: {'B'},
      },
    ),
  );
  test('folhaEmBranco_nenhumaDetectada', () {
    final v = ValidadorCorrecao.validarLeitura({}, estrutura(5));
    expect(v.detectadas, 0);
    expect(v.emBranco, [1, 2, 3, 4, 5]);
    expect(v.respostas, isEmpty);
  });
  test(
    'gabaritoCompleto_semProblema',
    () => expect(
      ValidadorCorrecao.verificarGabarito(
        provaCenario(gabarito: ['A', 'B', 'C']).gabarito(),
      ),
      isNull,
    ),
  );
  test(
    'provaSemQuestoes',
    () => expect(
      ValidadorCorrecao.verificarGabarito([]),
      const ProvaSemQuestoes(),
    ),
  );
  test(
    'provaSemGabarito_quandoNenhumaQuestaoTemResposta',
    () => expect(
      ValidadorCorrecao.verificarGabarito(
        provaCenario(gabarito: [null, null, null]).gabarito(),
      ),
      const ProvaSemGabarito(),
    ),
  );
  test('gabaritoIncompleto_listaAsQuestoesFaltando', () {
    final p = ValidadorCorrecao.verificarGabarito(
      provaCenario(gabarito: ['A', null, 'C', null]).gabarito(),
    );
    expect(p, const GabaritoIncompleto([2, 4]));
    expect(p!.mensagem, contains('2, 4'));
  });
  test(
    'folhaDaMesmaProva_ok',
    () => expect(
      ValidadorCorrecao.verificarProvaDaFolha(
        provaDoQrId: 3,
        provaEscolhidaId: 3,
      ),
      isNull,
    ),
  );
  test(
    'semProvaEscolhida_valeADoQrCode',
    () => expect(
      ValidadorCorrecao.verificarProvaDaFolha(
        provaDoQrId: 3,
        provaEscolhidaId: null,
      ),
      isNull,
    ),
  );
  test(
    'folhaDeOutraProva_avisa',
    () => expect(
      ValidadorCorrecao.verificarProvaDaFolha(
        provaDoQrId: 3,
        provaEscolhidaId: 4,
      ),
      isNotNull,
    ),
  );
  test('avisos mantêm os quatro textos e a ordem do Kotlin', () {
    final v = ValidadorCorrecao.validarLeitura({
      2: {'B', 'A'},
      3: {'E'},
      4: {'Z', 'Y'},
      9: {'A'},
    }, estrutura(4, ['A', 'B', 'C', 'D']));
    expect(v.avisos, [
      '3 questão(ões) sem resposta: 1, 3, 4. Contarão como em branco.',
      'Mais de uma alternativa marcada na(s) questão(ões) 2: serão anuladas.',
      'Marcações fora das alternativas da questão foram descartadas: Q3 (E); Q4 (YZ).',
      'A folha tem marcações em questões que não existem nesta prova (9); foram ignoradas.',
    ]);
  });
}
