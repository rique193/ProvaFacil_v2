import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/ui/alunos/alunos_ui_state.dart';

void main() {
  const ana = AlunoEntity(id: 1, nome: 'ana Souza', turma: 'Turma A', matricula: '2023001');
  const bruno = AlunoEntity(id: 2, nome: 'Bruno Lima', turma: 'Turma B', matricula: 'AB99');
  const caio = AlunoEntity(id: 3, nome: 'Caio', turma: 'Turma A');
  const semTurma = AlunoEntity(id: 4, nome: 'Duda', turma: '');

  test('busca por nome ou matrícula ignorando maiúsculas', () {
    const estado = AlunosUiState(alunos: [ana, bruno, caio]);
    expect(estado.copyWith(busca: '').alunosFiltrados, [ana, bruno, caio]);
    expect(estado.copyWith(busca: '  SOUZA ').alunosFiltrados, [ana]);
    expect(estado.copyWith(busca: 'ab9').alunosFiltrados, [bruno]);
    expect(estado.copyWith(busca: 'Zé').alunosFiltrados, isEmpty);
  });

  test('agrupa por turma, com "Sem turma", e ordena por nome em cada grupo', () {
    const estado = AlunosUiState(alunos: [caio, bruno, semTurma, ana]);
    expect(estado.alunosPorTurma.keys, ['Sem turma', 'Turma A', 'Turma B']);
    expect(estado.alunosPorTurma['Turma A'], [ana, caio]);
  });

  test('o formulário mostra como a turma será salva', () {
    expect(const AlunoFormState(turma: 'turma 3b').turmaNormalizada, 'Turma 3B');
    expect(const AlunoFormState().editando, isFalse);
    expect(const AlunoFormState(alunoId: 1).editando, isTrue);
  });
}
