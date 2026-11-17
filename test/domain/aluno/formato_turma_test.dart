import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/aluno/formato_turma.dart';

void main() {
  test('só o identificador ganha o prefixo', () {
    expect(FormatoTurma.normalizar('A'), 'Turma A');
    expect(FormatoTurma.normalizar('a'), 'Turma A');
  });

  test('prefixo já digitado não duplica', () {
    expect(FormatoTurma.normalizar('Turma A'), 'Turma A');
    expect(FormatoTurma.normalizar('turma a'), 'Turma A');
    expect(FormatoTurma.normalizar('TURMA A'), 'Turma A');
    expect(FormatoTurma.normalizar('Turma Turma A'), 'Turma A');
  });

  test('identificador fica em maiúsculas', () {
    expect(FormatoTurma.normalizar('3b'), 'Turma 3B');
    expect(FormatoTurma.normalizar('turma 3b'), 'Turma 3B');
  });

  test('espaços sobrando são removidos', () {
    expect(FormatoTurma.normalizar('  turma   a  '), 'Turma A');
    expect(FormatoTurma.normalizar('3   b'), 'Turma 3 B');
  });

  test('texto sem identificador fica vazio', () {
    expect(FormatoTurma.normalizar(''), '');
    expect(FormatoTurma.normalizar('   '), '');
    expect(FormatoTurma.normalizar('Turma'), '');
    expect(FormatoTurma.normalizar('turma  '), '');
  });

  test('palavra que só começa com turma não é prefixo', () {
    expect(FormatoTurma.normalizar('turmas'), 'Turma TURMAS');
  });

  test('formato igual ao que o scanner grava no QR Code', () {
    expect(FormatoTurma.normalizar('Turma A'), 'Turma A');
    expect(FormatoTurma.identificador('Turma A'), 'A');
  });
}
