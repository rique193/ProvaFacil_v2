import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/prova/status_prova.dart';

void main() {
  StatusProva status(int alunos, int corrigidos) =>
      StatusProva.calcular(totalAlunosTurma: alunos, totalCorrigidos: corrigidos);

  test('nenhum corrigido é pendente', () {
    expect(status(3, 0), StatusProva.pendente);
  });

  test('alguns corrigidos é em correção', () {
    expect(status(3, 1), StatusProva.emCorrecao);
    expect(status(3, 2), StatusProva.emCorrecao);
  });

  test('todos corrigidos é corrigida', () {
    expect(status(3, 3), StatusProva.corrigida);
  });

  test('mais corrigidos que alunos na turma continua corrigida', () {
    expect(status(3, 4), StatusProva.corrigida);
  });

  test('turma sem alunos: pendente sem resultados, corrigida com resultados', () {
    expect(status(0, 0), StatusProva.pendente);
    expect(status(0, 1), StatusProva.corrigida);
    expect(status(0, 5), StatusProva.corrigida);
  });

  test('rótulos', () {
    expect(StatusProva.pendente.rotulo, 'Pendente');
    expect(StatusProva.emCorrecao.rotulo, 'Em correção');
    expect(StatusProva.corrigida.rotulo, 'Corrigida');
  });
}
