import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';
import 'package:provafacil/domain/estatisticas/estatisticas_prova.dart';

QuestaoDaProva questao(int id, int ordem, {int alternativas = 5}) =>
    QuestaoDaProva(questaoId: id, ordem: ordem, totalAlternativas: alternativas);

RespostaRegistrada resposta(
    int questaoId,
    String marcadas,
    String correta,
    SituacaoQuestao situacao, {
      int corrigidoEm = 1000,
    }) => RespostaRegistrada(
  questaoId: questaoId,
  letrasMarcadas: marcadas,
  letraCorreta: correta,
  situacao: situacao,
  corrigidoEm: corrigidoEm,
);

void main() {
  test('questão sem respostas tem tudo zerado e sem percentual', () {
    final [estatistica] = EstatisticasProva.calcular([questao(1, 0)], []);

    expect(estatistica.numero, 1);
    expect(estatistica.totalRespostas, 0);
    expect(estatistica.percentualAcerto, isNull);
    expect(estatistica.letraDoGabarito, isNull);
    expect(estatistica.alternativaMaisMarcada, isNull);
    expect(estatistica.distribuicao, {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0});
    expect(estatistica.divergeDoGabarito, isFalse);
    expect(estatistica.gabaritoAlterado, isFalse);
  });

  test('ordena por ordem e depois id, numerando a partir de 1', () {
    final estatisticas = EstatisticasProva.calcular([questao(2, 1), questao(3, 0), questao(1, 1)], []);

    expect(estatisticas.map((e) => e.questaoId), [3, 1, 2]);
    expect(estatisticas.map((e) => e.numero), [1, 2, 3]);
  });

  test('acerto usa a situação gravada e liga a resposta pela questão', () {
    final estatisticas = EstatisticasProva.calcular(
      [questao(1, 0), questao(2, 1)],
      [
        resposta(1, 'B', 'B', SituacaoQuestao.acerto),
        resposta(1, 'C', 'B', SituacaoQuestao.erro),
        resposta(2, 'A', 'A', SituacaoQuestao.acerto),
      ],
    );

    expect(estatisticas[0].totalRespostas, 2);
    expect(estatisticas[0].acertos, 1);
    expect(estatisticas[0].percentualAcerto, closeTo(0.5, 1e-9));
    expect(estatisticas[1].percentualAcerto, closeTo(1.0, 1e-9));
  });

  test('distribuição conta só marcações únicas; branco e múltipla ficam à parte', () {
    final [estatistica] = EstatisticasProva.calcular(
      [questao(1, 0)],
      [
        resposta(1, 'B', 'B', SituacaoQuestao.acerto),
        resposta(1, 'b', 'B', SituacaoQuestao.acerto),
        resposta(1, 'D', 'B', SituacaoQuestao.erro),
        resposta(1, '', 'B', SituacaoQuestao.emBranco),
        resposta(1, 'BD', 'B', SituacaoQuestao.marcacaoMultipla),
      ],
    );

    expect(estatistica.distribuicao, {'A': 0, 'B': 2, 'C': 0, 'D': 1, 'E': 0});
    expect(estatistica.distribuicao.keys.toList(), ['A', 'B', 'C', 'D', 'E']);
    expect(estatistica.emBranco, 1);
    expect(estatistica.marcacaoMultipla, 1);
    expect(estatistica.alternativaMaisMarcada, 'B');
  });

  test('no empate a mais marcada é a letra alfabeticamente menor', () {
    final [estatistica] = EstatisticasProva.calcular(
      [questao(1, 0)],
      [
        resposta(1, 'C', 'A', SituacaoQuestao.erro),
        resposta(1, 'A', 'A', SituacaoQuestao.acerto),
      ],
    );

    expect(estatistica.alternativaMaisMarcada, 'A');
  });

  test('o gabarito é o da correção mais recente e a alteração é detectada', () {
    final [estatistica] = EstatisticasProva.calcular(
      [questao(1, 0)],
      [
        resposta(1, 'A', 'A', SituacaoQuestao.acerto, corrigidoEm: 1000),
        resposta(1, 'A', 'B', SituacaoQuestao.erro, corrigidoEm: 2000),
      ],
    );

    expect(estatistica.letraDoGabarito, 'B');
    expect(estatistica.gabaritoAlterado, isTrue);
  });

  test('diverge do gabarito quando a mais marcada não é a letra do gabarito', () {
    final [estatistica] = EstatisticasProva.calcular(
      [questao(1, 0)],
      [
        resposta(1, 'C', 'B', SituacaoQuestao.erro),
        resposta(1, 'C', 'B', SituacaoQuestao.erro),
        resposta(1, 'B', 'B', SituacaoQuestao.acerto),
      ],
    );

    expect(estatistica.alternativaMaisMarcada, 'C');
    expect(estatistica.divergeDoGabarito, isTrue);
    expect(estatistica.gabaritoAlterado, isFalse);
  });

  test('letras gravadas fora das cadastradas entram na distribuição', () {
    final [estatistica] = EstatisticasProva.calcular(
      [questao(1, 0, alternativas: 2)],
      [resposta(1, 'E', 'E', SituacaoQuestao.acerto)],
    );

    expect(estatistica.distribuicao, {'A': 0, 'B': 0, 'E': 1});
  });
}