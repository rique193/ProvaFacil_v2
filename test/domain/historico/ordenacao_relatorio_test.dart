import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/historico/ordenacao_relatorio.dart';
import 'package:provafacil/ui/relatorio/relatorio_ui_state.dart';

LinhaRelatorioUiState linha(int id, String nome, double nota) =>
    LinhaRelatorioUiState(alunoId: id, nome: nome, matricula: null, acertos: 0, nota: nota);

void main() {
  final linhas = [linha(1, 'caio', 7.0), linha(2, 'Ana', 9.0), linha(3, 'Bruno', 7.0), linha(4, 'Duda', 4.5)];

  List<int> ids(ColunaOrdenacao coluna, DirecaoOrdenacao direcao) =>
      ordenarLinhas(linhas, coluna, direcao).map((l) => l.alunoId).toList();

  test('porAlunoIgnoraMaiusculas', () {
    expect(ids(ColunaOrdenacao.aluno, DirecaoOrdenacao.ascendente), [2, 3, 1, 4]);
    expect(ids(ColunaOrdenacao.aluno, DirecaoOrdenacao.descendente), [4, 1, 3, 2]);
  });

  test('porNotaDesempataPorNomeNasDuasDirecoes', () {
    expect(ids(ColunaOrdenacao.nota, DirecaoOrdenacao.ascendente), [4, 3, 1, 2]);
    expect(ids(ColunaOrdenacao.nota, DirecaoOrdenacao.descendente), [2, 3, 1, 4]);
  });

  test('nomesRepetidosDesempatamPeloId', () {
    final repetidos = [linha(9, 'Ana', 5.0), linha(5, 'ana', 5.0)];
    expect(
      ordenarLinhas(repetidos, ColunaOrdenacao.aluno, DirecaoOrdenacao.ascendente).map((l) => l.alunoId),
      [5, 9],
    );
    expect(
      ordenarLinhas(repetidos, ColunaOrdenacao.nota, DirecaoOrdenacao.descendente).map((l) => l.alunoId),
      [5, 9],
    );
  });

  test('listaVazia', () {
    expect(ordenarLinhas([], ColunaOrdenacao.nota, DirecaoOrdenacao.ascendente), isEmpty);
  });

  test('não altera a lista recebida', () {
    final original = [...linhas];
    ordenarLinhas(linhas, ColunaOrdenacao.nota, DirecaoOrdenacao.descendente);
    expect(linhas, original);
  });
}
