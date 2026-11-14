import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/questao_com_alternativas.dart';
import 'package:provafacil/data/repository/gabarito_mapper.dart';

const _aguardandoCorretor = 'Depende de CorretorProva.corrigir (Membro 4)';

QuestaoComAlternativas questao(int id, int ordem, Set<int> corretas) => QuestaoComAlternativas(
  questao: QuestaoEntity(id: id, provaId: 1, enunciado: 'Questão $id', ordem: ordem),
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

  test(
    'o gabarito mapeado corrige com nota 10 quando o aluno marca B e D',
    () {},
    skip: _aguardandoCorretor,
  );

  test('várias alternativas corretas deixam a questão sem gabarito', () {
    final gabarito = [
      questao(1, 0, {0, 1}),
    ].paraGabarito();
    expect(gabarito.single.letraCorreta, isNull);
  });

  test(
    'várias alternativas corretas impedem a correção (GabaritoIncompletoException com [1])',
    () {},
    skip: _aguardandoCorretor,
  );

  test('questão nova continua sem gabarito', () {
    expect([questao(1, 0, {})].paraGabarito().single.letraCorreta, isNull);
  });
}
