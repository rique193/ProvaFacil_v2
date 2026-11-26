import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/ui/banco_questoes/banco_questoes_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late BancoQuestaoRepository questaoRepo;
  late DisciplinaRepository disciplinaRepo;
  late BancoQuestoesViewModel viewModel;

  setUp(() {
    db = criarBancoEmMemoria();
    questaoRepo = BancoQuestaoRepository(db);
    disciplinaRepo = DisciplinaRepository(db);
    viewModel = BancoQuestoesViewModel(questaoRepo, disciplinaRepo);
  });

  tearDown(() async {
    viewModel.dispose();
    await db.close();
  });

  test('filtra questões por disciplina e exclui questão', () async {
    await disciplinaRepo.salvar('Matemática');
    await disciplinaRepo.salvar('História');
    final idMat = await questaoRepo.salvarQuestao(
      disciplina: 'Matemática',
      enunciado: 'Quanto é 2 + 2?',
      alternativas: ['1', '2', '3', '4', '5'],
      indiceCorreta: 3,
    );
    await questaoRepo.salvarQuestao(
      disciplina: 'História',
      enunciado: 'Ano da independência?',
      alternativas: ['1800', '1822', '1889', '1900', '1922'],
      indiceCorreta: 1,
    );
    await pumpEventQueue();

    expect(viewModel.uiState.questoes.length, 2);

    viewModel.selecionarDisciplina('Matemática');
    await pumpEventQueue();
    expect(viewModel.uiState.questoes.length, 1);
    expect(viewModel.uiState.questoes.first.questao.id, idMat);

    await viewModel.excluirQuestao(idMat);
    await pumpEventQueue();
    expect(viewModel.uiState.questoes, isEmpty);
  });
}