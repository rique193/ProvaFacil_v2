import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/regras_cadastro_aluno.dart';

void main() {
  const ana = AlunoEntity(id: 1, nome: 'Ana Souza', turma: 'Turma A', matricula: '2023001');
  const bruno = AlunoEntity(id: 2, nome: 'Bruno Lima', turma: 'Turma B', matricula: '2023002');

  String? validarAna({
    String nome = 'Ana Souza',
    String turma = 'Turma A',
    required AlunoEntity? mesmoNomeETurma,
    required AlunoEntity? mesmaMatricula,
  }) => validarEdicaoAluno(
    alunoId: ana.id,
    nome: nome,
    turma: turma,
    mesmoNomeETurma: mesmoNomeETurma,
    mesmaMatricula: mesmaMatricula,
  );

  test('editar sem mudar a matrícula não acusa duplicada', () {
    // As buscas encontram a própria Ana (mesmo nome + turma e mesma matrícula).
    expect(validarAna(mesmoNomeETurma: ana, mesmaMatricula: ana), isNull);
  });

  test('trocar só maiúsculas do nome é aceito', () {
    // A busca ignora maiúsculas e encontra a própria Ana.
    expect(validarAna(nome: 'ANA SOUZA', mesmoNomeETurma: ana, mesmaMatricula: null), isNull);
  });

  test('mudar para matrícula de outro aluno é recusado', () {
    expect(
      validarAna(mesmoNomeETurma: ana, mesmaMatricula: bruno),
      contains('Já existe um aluno com a matrícula 2023002: Bruno Lima (Turma B).'),
    );
  });

  test('nome e turma de outro aluno são recusados', () {
    expect(
      validarAna(
        nome: 'Bruno Lima',
        turma: 'Turma B',
        mesmoNomeETurma: bruno,
        mesmaMatricula: null,
      ),
      contains('Bruno Lima já está cadastrado na Turma B.'),
    );
  });

  test('sem conflito é aceito', () {
    expect(validarAna(nome: 'Ana Paula', mesmoNomeETurma: null, mesmaMatricula: null), isNull);
  });

  test('normaliza turma, espaços e opcionais vazios', () {
    expect(
      normalizarDadosAluno('  Ana   Souza ', 'a', '  ', ''),
      const DadosAluno(nome: 'Ana Souza', turma: 'Turma A', matricula: null, email: null),
    );
    expect(
      normalizarDadosAluno('Bruno', 'turma 3b', ' 2023002 ', ' b@escola.com '),
      const DadosAluno(
        nome: 'Bruno',
        turma: 'Turma 3B',
        matricula: '2023002',
        email: 'b@escola.com',
      ),
    );
  });
}
