import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/data/repository/turma_repository.dart';
import 'package:provafacil/ui/turmas_disciplinas/turmas_disciplinas_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late TurmasDisciplinasViewModel viewModel;

  setUp(() {
    db = criarBancoEmMemoria();
    viewModel = TurmasDisciplinasViewModel(TurmaRepository(db), DisciplinaRepository(db));
  });

  tearDown(() async {
    viewModel.dispose();
    await db.close();
  });

  test('adiciona, lista e exclui turmas e disciplinas', () async {
    expect(await viewModel.adicionarTurma('a'), isTrue);
    expect(await viewModel.adicionarDisciplina('Matemática'), isTrue);
    await pumpEventQueue();

    expect(viewModel.uiState.turmas.map((t) => t.nome), ['Turma A']);
    expect(viewModel.uiState.disciplinas.map((d) => d.nome), ['Matemática']);

    await viewModel.excluirTurma(viewModel.uiState.turmas.first.id);
    await viewModel.excluirDisciplina(viewModel.uiState.disciplinas.first.id);
    await pumpEventQueue();

    expect(viewModel.uiState.turmas, isEmpty);
    expect(viewModel.uiState.disciplinas, isEmpty);
  });

  test('expõe mensagem de erro do repositório para nome repetido ou vazio', () async {
    expect(await viewModel.adicionarTurma(''), isFalse);
    expect(viewModel.uiState.mensagem, 'Informe o nome da turma.');

    await viewModel.adicionarDisciplina('Física');
    expect(await viewModel.adicionarDisciplina('FÍSICA'), isFalse);
    expect(viewModel.uiState.mensagem, 'Já existe uma disciplina com esse nome.');
  });
}