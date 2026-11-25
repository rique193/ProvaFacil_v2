import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/regras_cadastro_aluno.dart';

void main() {
  const daCorrecao = AlunoEntity(id: 1, nome: 'Ana Souza', turma: 'Turma A');
  final cadastrada = daCorrecao.copyWith(
    matricula: const Value('2023001'),
    email: const Value('ana@escola.com'),
  );
  const outro = AlunoEntity(id: 2, nome: 'Bruno Lima', turma: 'Turma B', matricula: '2023002');

  DecisaoCadastroAluno decidir(
    String? matricula, {
    String? email,
    AlunoEntity? mesmoNomeETurma,
    AlunoEntity? mesmaMatricula,
  }) => decidirCadastroAluno(
    nome: 'Ana Souza',
    turma: 'Turma A',
    matricula: matricula,
    email: email,
    mesmoNomeETurma: mesmoNomeETurma,
    mesmaMatricula: mesmaMatricula,
  );

  void esperarRecusa(DecisaoCadastroAluno decisao, String trecho) {
    expect(decisao, isA<Recusar>(), reason: 'Esperava recusa, veio $decisao');
    expect((decisao as Recusar).mensagem, contains(trecho));
  }

  test('aluno novo é inserido', () {
    expect(decidir('2023001'), const DecisaoCadastroAluno.inserir());
    expect(decidir(null), const DecisaoCadastroAluno.inserir());
  });

  test('aluno criado pela correção é completado', () {
    expect(
      decidir('2023001', mesmoNomeETurma: daCorrecao),
      const DecisaoCadastroAluno.completar(daCorrecao),
    );
    expect(
      decidir(null, email: 'ana@escola.com', mesmoNomeETurma: daCorrecao),
      const DecisaoCadastroAluno.completar(daCorrecao),
    );
  });

  test('aluno criado pela correção sem dados novos já está cadastrado', () {
    esperarRecusa(decidir(null, mesmoNomeETurma: daCorrecao), 'já está cadastrado na Turma A');
  });

  test('mesmo nome e turma com outra matrícula não sobrescreve', () {
    esperarRecusa(decidir('2099999', mesmoNomeETurma: cadastrada), 'com outra matrícula (2023001)');
  });

  test('mesmo aluno com a mesma matrícula já está cadastrado', () {
    esperarRecusa(
      decidir('2023001', mesmoNomeETurma: cadastrada, mesmaMatricula: cadastrada),
      'já está cadastrado',
    );
    esperarRecusa(decidir(null, mesmoNomeETurma: cadastrada), 'já está cadastrado');
  });

  test('matrícula de outro aluno é recusada', () {
    esperarRecusa(
      decidir('2023002', mesmaMatricula: outro),
      'Já existe um aluno com a matrícula 2023002',
    );
    esperarRecusa(
      decidir('2023002', mesmoNomeETurma: daCorrecao, mesmaMatricula: outro),
      'Bruno Lima',
    );
  });

  test('matrícula comparada sem diferenciar maiúsculas', () {
    final comLetra = cadastrada.copyWith(matricula: const Value('ab123'));
    esperarRecusa(
      decidir('AB123', mesmoNomeETurma: comLetra, mesmaMatricula: comLetra),
      'já está cadastrado na Turma A.',
    );
  });
}
