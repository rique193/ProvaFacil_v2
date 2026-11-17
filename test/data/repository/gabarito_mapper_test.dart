import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/questao_com_alternativas.dart';
import 'package:provafacil/data/repository/gabarito_mapper.dart';

import 'package:provafacil/domain/correcao/corretor_prova.dart';

QuestaoComAlternativas questao(int id, int ordem, Set<int> corretas) =>
    QuestaoComAlternativas(
      questao: QuestaoEntity(
        id: id,
        provaId: 1,
        enunciado: 'Questão $id',
        ordem: ordem,
      ),
      alternativas: [
        for (var i = 4; i >= 0; i--)
          AlternativaEntity(
            id: id * 10 + i,
            questaoId: id,
            texto: 'Alternativa $i',
            correta: corretas.contains(i),
            ordem: i,
          ),
      ],
    );

void main() {
  test('ordena questões e alternativas antes de atribuir números e letras', () {
    final questoes = [
      questao(20, 1, {3}),
      questao(10, 0, {1}),
    ];
    final gabarito = questoes.paraGabarito();
    final prova = questoes.paraCorrecao(42);
    expect(prova.provaId, 42);
    expect(prova.questoes.map((q) => q.questaoId), [10, 20]);
    expect(prova.questoes.map((q) => q.letraCorreta), ['B', 'D']);
    expect(gabarito.map((q) => q.questaoId), [10, 20]);
    expect(gabarito.map((q) => q.numero), [1, 2]);
    expect(gabarito.map((q) => q.letraCorreta), ['B', 'D']);
  });

  test('o gabarito mapeado corrige com nota 10 quando o aluno marca B e D', () {
    final gabarito = [
      questao(20, 1, {3}),
      questao(10, 0, {1}),
    ].paraGabarito();
    final correcao = CorretorProva.corrigir(gabarito, {
      1: {'B'},
      2: {'D'},
    });
    expect(correcao.nota, 10);
    expect(correcao.acertos, 2);
  });

  test('várias alternativas corretas deixam a questão sem gabarito', () {
    final gabarito = [
      questao(1, 0, {0, 1}),
    ].paraGabarito();
    expect(gabarito.single.letraCorreta, isNull);
  });

  test('várias alternativas corretas impedem a correção (GabaritoIncompletoException com [1])', () {
    final gabarito = [
      questao(1, 0, {0, 1}),
    ].paraGabarito();
    expect(
      () => CorretorProva.corrigir(gabarito, {}),
      throwsA(
        isA<GabaritoIncompletoException>().having(
          (e) => e.questoesSemGabarito,
          'questões',
          [1],
        ),
      ),
    );
  });

  test('questão nova continua sem gabarito', () {
    expect([questao(1, 0, {})].paraGabarito().single.letraCorreta, isNull);
  });
}
