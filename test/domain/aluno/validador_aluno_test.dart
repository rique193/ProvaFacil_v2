import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/aluno/validador_aluno.dart';

void main() {
  test('nome e turma bastam', () {
    expect(ValidadorAluno.validar('Ana Souza', 'A', null, null), isNull);
    expect(ValidadorAluno.validar('Ana Souza', 'A', '', '  '), isNull);
  });

  test('nome e turma são obrigatórios', () {
    expect(ValidadorAluno.validar('  ', 'A', null, null), 'Informe o nome do aluno.');
    expect(ValidadorAluno.validar('Ana', '', null, null), 'Informe a turma.');
    expect(ValidadorAluno.validar('Ana', 'Turma', null, null), 'Informe a turma.');
  });

  test('e-mail preenchido precisa ser válido', () {
    expect(ValidadorAluno.validar('Ana', 'A', null, 'ana'), 'E-mail inválido.');
    expect(ValidadorAluno.validar('Ana', 'A', null, 'ana@escola'), 'E-mail inválido.');
    expect(ValidadorAluno.validar('Ana', 'A', null, ' ana.souza@aluno.provafacil.edu.br '), isNull);
  });

  test('formatos de e-mail', () {
    expect(ValidadorAluno.emailValido('a.b+c@escola.com.br'), isTrue);
    expect(ValidadorAluno.emailValido('a b@escola.com'), isFalse);
    expect(ValidadorAluno.emailValido('@escola.com'), isFalse);
    expect(ValidadorAluno.emailValido('ana@.com'), isFalse);
  });
}
