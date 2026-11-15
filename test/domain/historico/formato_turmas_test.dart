import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/historico/formato_turmas.dart';

void main() {
  test('nulo ou vazio vira texto vazio', () {
    expect(formatarTurmas(null), '');
    expect(formatarTurmas(' , ,'), '');
  });

  test('tira espaços, vazios e repetidas ignorando maiúsculas, mantendo a primeira', () {
    expect(formatarTurmas('Turma B, turma b,,Turma A'), 'Turma A, Turma B');
  });

  test('ordena ignorando maiúsculas', () {
    expect(formatarTurmas('turma c,Turma A,Turma B'), 'Turma A, Turma B, turma c');
  });
}