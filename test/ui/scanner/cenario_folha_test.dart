import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/correcao/fluxo_correcao.dart';
import 'package:provafacil/ui/scanner/cenario_folha.dart';

const _letras = ['A', 'B', 'C', 'D', 'E'];

ProvaParaCorrecao _prova(int totalQuestoes) => ProvaParaCorrecao(
  provaId: 1,
  titulo: 'Prova',
  questoes: [
    for (var i = 1; i <= totalQuestoes; i++)
      QuestaoParaCorrecao(
        questaoId: i,
        numero: i,
        letras: _letras,
        letraCorreta: _letras[i % _letras.length],
      ),
  ],
);

void main() {
  final prova = _prova(20);

  test('o mesmo aluno sempre preenche a mesma folha', () {
    expect(
      CenarioFolha.folhaDoAluno.lerFolha(prova, 'Ana Souza'),
      CenarioFolha.folhaDoAluno.lerFolha(prova, '  ana souza '),
    );
  });

  test('alunos diferentes preenchem folhas diferentes', () {
    expect(
      CenarioFolha.marcacoesDoAluno(prova, 'Ana Souza'),
      isNot(CenarioFolha.marcacoesDoAluno(prova, 'Bruno Lima')),
    );
  });

  test('a folha do aluno só usa letras da questão e acerta a maioria', () {
    final folha = CenarioFolha.folhaDoAluno.lerFolha(prova, 'Ana Souza');
    var acertos = 0;
    for (final MapEntry(key: numero, value: letras) in folha.entries) {
      expect(letras, hasLength(1));
      expect(_letras, contains(letras.single));
      if (letras.single == prova.questoes[numero - 1].letraCorreta) acertos++;
    }
    expect(acertos, greaterThan(prova.questoes.length ~/ 2));
  });

  test('marcação dupla nas duas primeiras questões', () {
    final folha = CenarioFolha.marcacaoDupla.lerFolha(prova, 'Ana Souza');
    expect(folha[1], hasLength(2));
    expect(folha[2], hasLength(2));
    for (var numero = 3; numero <= 20; numero++) {
      expect(folha[numero]?.length ?? 0, lessThanOrEqualTo(1));
    }
  });

  test('folha incompleta deixa a segunda metade em branco', () {
    final folha = CenarioFolha.folhaIncompleta.lerFolha(prova, 'Ana Souza');
    expect(folha.keys.every((numero) => numero <= 10), isTrue);
  });

  test('folha em branco e prova inexistente não têm marcações', () {
    expect(CenarioFolha.folhaEmBranco.lerFolha(prova, 'Ana Souza'), isEmpty);
    expect(CenarioFolha.folhaDoAluno.lerFolha(null, 'Ana Souza'), isEmpty);
  });
}
