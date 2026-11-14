import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/ui/provas/gabarito/gabarito_view_model.dart';

import '../../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late ProvaRepository repository;

  setUp(() {
    db = criarBancoEmMemoria();
    repository = ProvaRepository(db);
  });

  tearDown(() => db.close());

  QuestaoInput nova(String enunciado) => QuestaoInput(
    enunciado: enunciado,
    alternativas: [for (var i = 1; i <= 5; i++) AlternativaInput(texto: '$enunciado-$i')],
  );

  Future<int> criarProva() => repository.salvarConteudoProva(
    provaId: null,
    titulo: 'Prova',
    disciplina: 'Geografia',
    descricao: '',
    questoes: [nova('Q1'), nova('Q2'), nova('Q3')],
  );

  Future<GabaritoViewModel> carregar(int provaId) async {
    final vm = GabaritoViewModel(repository, provaId);
    while (vm.uiState.carregando) {
      await Future<void>.delayed(Duration.zero);
    }
    return vm;
  }

  test('carrega as questões numeradas com as letras A a E', () async {
    final vm = await carregar(await criarProva());

    expect(vm.uiState.tituloProva, 'Prova');
    expect(vm.uiState.disciplina, 'Geografia');
    expect(vm.uiState.questoes.map((q) => q.numero), [1, 2, 3]);
    expect(vm.uiState.questoes.first.alternativas.map((a) => a.letra), ['A', 'B', 'C', 'D', 'E']);
    expect(vm.uiState.preenchidas, 0);
    expect(vm.uiState.progresso, 0);
  });

  test('o progresso conta as questões marcadas', () async {
    final vm = await carregar(await criarProva());
    final primeira = vm.uiState.questoes.first;

    vm.selecionarResposta(primeira.questaoId, primeira.alternativas[1].alternativaId);

    expect(vm.uiState.preenchidas, 1);
    expect(vm.uiState.totalQuestoes, 3);
    expect(vm.uiState.progresso, closeTo(1 / 3, 1e-9));
  });

  test('alternativa de outra questão é ignorada', () async {
    final vm = await carregar(await criarProva());
    final [primeira, segunda, ...] = vm.uiState.questoes;

    vm.selecionarResposta(primeira.questaoId, segunda.alternativas.first.alternativaId);

    expect(vm.uiState.preenchidas, 0);
  });

  test('salvar com questão sem resposta mostra o erro e não grava', () async {
    final provaId = await criarProva();
    final vm = await carregar(provaId);
    final primeira = vm.uiState.questoes.first;
    vm.selecionarResposta(primeira.questaoId, primeira.alternativas.first.alternativaId);

    await vm.salvar();

    expect(vm.uiState.erro, 'Defina a resposta correta de todas as questões.');
    expect(vm.uiState.salvo, isFalse);
    final alternativas = await db.select(db.alternativas).get();
    expect(alternativas.where((a) => a.correta), isEmpty);
  });

  test('salvar grava o gabarito e reabrir mostra as marcações', () async {
    final provaId = await criarProva();
    final vm = await carregar(provaId);
    for (final (indice, questao) in vm.uiState.questoes.indexed) {
      vm.selecionarResposta(questao.questaoId, questao.alternativas[indice].alternativaId);
    }

    await vm.salvar();
    expect(vm.uiState.salvo, isTrue);

    final reaberto = await carregar(provaId);
    expect(reaberto.uiState.preenchidas, 3);
    expect(
      reaberto.uiState.questoes.map(
        (q) => q.alternativas.singleWhere((a) => a.alternativaId == q.alternativaCorretaId).letra,
      ),
      ['A', 'B', 'C'],
    );
  });

  test('não observa o banco: mudanças depois de carregar não apagam a seleção', () async {
    final provaId = await criarProva();
    final vm = await carregar(provaId);
    final primeira = vm.uiState.questoes.first;
    vm.selecionarResposta(primeira.questaoId, primeira.alternativas[2].alternativaId);

    await db.provaDao.atualizarProva(provaId, 'Outro título', 'Geografia', '');
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(vm.uiState.tituloProva, 'Prova');
    expect(vm.uiState.questoes.first.alternativaCorretaId, primeira.alternativas[2].alternativaId);
  });

  test('prova inexistente mostra "Prova não encontrada."', () async {
    final vm = await carregar(999);

    expect(vm.uiState.erro, 'Prova não encontrada.');
    expect(vm.uiState.questoes, isEmpty);
  });
}
