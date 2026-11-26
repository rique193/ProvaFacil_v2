import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/ui/banco_questoes/form/banco_questao_form_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late BancoQuestaoRepository questaoRepo;
  late DisciplinaRepository disciplinaRepo;

  setUp(() {
    db = criarBancoEmMemoria();
    questaoRepo = BancoQuestaoRepository(db);
    disciplinaRepo = DisciplinaRepository(db);
  });

  tearDown(() => db.close());

  test('valida e salva nova questão no banco', () async {
    await disciplinaRepo.salvar('Biologia');
    final vm = BancoQuestaoFormViewModel(questaoRepo, disciplinaRepo, null);
    addTearDown(vm.dispose);

    await vm.salvar();
    expect(vm.uiState.salvo, isFalse);
    expect(vm.uiState.erro, 'Informe a disciplina.');

    vm.atualizarDisciplina('Biologia');
    vm.atualizarEnunciado('Qual organela produz energia?');
    vm.atualizarAlternativa(0, 'Mitocôndria');
    vm.atualizarAlternativa(1, 'Ribossomo');
    vm.atualizarAlternativa(2, 'Lisossomo');
    vm.atualizarAlternativa(3, 'Centríolo');
    vm.atualizarAlternativa(4, 'Vacúolo');
    vm.marcarCorreta(0);

    await vm.salvar();
    expect(vm.uiState.salvo, isTrue);
    expect(vm.uiState.questaoId, isNotNull);
  });

  test('carrega questão existente, edita e exclui', () async {
    final id = await questaoRepo.salvarQuestao(
      disciplina: 'Física',
      enunciado: 'Original',
      alternativas: ['A', 'B', 'C', 'D', 'E'],
      indiceCorreta: 2,
    );

    final vm = BancoQuestaoFormViewModel(questaoRepo, disciplinaRepo, id);
    addTearDown(vm.dispose);
    await pumpEventQueue();

    expect(vm.uiState.disciplina, 'Física');
    expect(vm.uiState.enunciado, 'Original');
    expect(vm.uiState.indiceCorreta, 2);

    await vm.excluir();
    expect(vm.uiState.excluida, isTrue);
    expect(await questaoRepo.buscarQuestao(id), isNull);
  });
}