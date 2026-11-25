import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late DisciplinaRepository repository;

  setUp(() {
    db = criarBancoEmMemoria();
    repository = DisciplinaRepository(db);
  });

  tearDown(() => db.close());

  test('salva e observa em ordem alfabética sem caixa', () async {
    await repository.salvar('Matemática');
    await repository.salvar('biologia');
    await repository.salvar('Física');

    final lista = await repository.observarTodas().first;
    expect(lista.map((d) => d.nome).toList(), ['biologia', 'Física', 'Matemática']);
  });

  test('rejeita nome vazio', () async {
    expect(
          () => repository.salvar('  '),
      throwsA(
        isA<ArgumentError>().having((e) => e.message, 'message', 'Informe o nome da disciplina.'),
      ),
    );
  });

  test('rejeita disciplina repetida ignorando caixa', () async {
    await repository.salvar('Física');

    expect(
          () => repository.salvar('FÍSICA'),
      throwsA(
        isA<ArgumentError>().having(
              (e) => e.message,
          'message',
          'Já existe uma disciplina com esse nome.',
        ),
      ),
    );
  });

  test('exclui disciplina cadastrada', () async {
    final id = await repository.salvar('História');
    await repository.excluir(id);

    final lista = await repository.observarTodas().first;
    expect(lista, isEmpty);
  });
}