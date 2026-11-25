import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/turma_repository.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late TurmaRepository repository;

  setUp(() {
    db = criarBancoEmMemoria();
    repository = TurmaRepository(db);
  });

  tearDown(() => db.close());

  test('salva normalizando formato e observa em ordem alfabética', () async {
    await repository.salvar('3b');
    await repository.salvar('turma a');

    final lista = await repository.observarTodas().first;
    expect(lista.map((t) => t.nome).toList(), ['Turma 3B', 'Turma A']);
  });

  test('rejeita nome vazio ou só prefixo', () async {
    expect(
          () => repository.salvar('   '),
      throwsA(isA<ArgumentError>().having((e) => e.message, 'message', 'Informe o nome da turma.')),
    );
    expect(
          () => repository.salvar('Turma'),
      throwsA(isA<ArgumentError>().having((e) => e.message, 'message', 'Informe o nome da turma.')),
    );
  });

  test('rejeita turma repetida ignorando caixa e prefixo', () async {
    await repository.salvar('A');

    expect(
          () => repository.salvar('turma a'),
      throwsA(
        isA<ArgumentError>().having((e) => e.message, 'message', 'Já existe uma turma com esse nome.'),
      ),
    );
  });

  test('exclui turma cadastrada', () async {
    final id = await repository.salvar('1A');
    await repository.excluir(id);

    final lista = await repository.observarTodas().first;
    expect(lista, isEmpty);
  });
}