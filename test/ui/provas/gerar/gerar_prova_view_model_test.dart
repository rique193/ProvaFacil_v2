import 'dart:async';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/data/repository/turma_repository.dart';
import 'package:provafacil/ui/provas/gerar/gerar_prova_view_model.dart';

import '../../../ajudantes/banco_em_memoria.dart';
import '../../../ajudantes/cenarios_geracao_prova.dart';

class _ProvasControladas extends ProvaRepository {
  _ProvasControladas(super.database);
  final resposta = Completer<int>();
  int chamadas = 0;

  @override
  Future<int> gerarProvaDoBanco({
    required String titulo,
    required String disciplina,
    required String turma,
    String descricao = '',
    required List<int> bancoQuestaoIds,
    required bool embaralharQuestoes,
    required bool embaralharAlternativas,
    Random? random,
  }) {
    chamadas++;
    return resposta.future;
  }
}

void main() {
  late AppDatabase db;
  late List<int> ids;
  late List<int> historia;
  setUp(() async {
    db = criarBancoEmMemoria();
    await cadastrarTurmaEDisciplinas(db);
    ids = await cadastrarQuestoesBanco(db, quantidade: 3);
    historia = await cadastrarQuestoesBanco(
      db,
      quantidade: 1,
      disciplina: 'História',
    );
  });
  tearDown(() => db.close());

  GerarProvaViewModel criar({ProvaRepository? provas, bool descartar = true}) {
    final vm = GerarProvaViewModel(
      provas: provas ?? ProvaRepository(db),
      bancoQuestoes: BancoQuestaoRepository(db),
      disciplinas: DisciplinaRepository(db),
      turmas: TurmaRepository(db),
      random: Random(42),
    );
    if (descartar) addTearDown(vm.dispose);
    return vm;
  }

  Future<void> carregar(GerarProvaViewModel vm) =>
      esperarEstado(vm, () => !vm.uiState.carregando);
  void preencher(GerarProvaViewModel vm) => vm
    ..atualizarTitulo('Prova do banco')
    ..selecionarDisciplina('Matemática')
    ..selecionarTurma('Turma A')
    ..selecionarTodas(true);

  test(
    'carrega cadastros e inicia sem seleção com embaralhamento ligado',
    () async {
      final vm = criar();
      await carregar(vm);
      expect(vm.uiState.disciplinas.map((d) => d.nome), [
        'História',
        'Matemática',
      ]);
      expect(vm.uiState.turmas.single.nome, 'Turma A');
      expect(vm.uiState.disciplina, isNull);
      expect(vm.uiState.questoes, isEmpty);
      expect(vm.uiState.selecionadas, isEmpty);
      expect(vm.uiState.embaralharQuestoes, isTrue);
      expect(vm.uiState.embaralharAlternativas, isTrue);
    },
  );

  test('valida título, disciplina, turma e seleção antes de gerar', () async {
    final vm = criar();
    await carregar(vm);
    expect(await vm.gerar(), isNull);
    expect(vm.uiState.erro, 'Informe o título da prova.');
    vm.atualizarTitulo('P');
    await vm.gerar();
    expect(vm.uiState.erro, 'Informe a disciplina.');
    vm.selecionarDisciplina('Matemática');
    await vm.gerar();
    expect(vm.uiState.erro, 'Informe a turma.');
    vm.selecionarTurma('Turma A');
    await vm.gerar();
    expect(vm.uiState.erro, 'Selecione ao menos uma questão do banco.');
    expect(await ProvaRepository(db).observarProvas().first, isEmpty);
  });

  test(
    'filtra por disciplina e limpa a seleção ao trocar de disciplina',
    () async {
      final vm = criar();
      await carregar(vm);
      vm.selecionarDisciplina('Matemática');
      expect(
        vm.uiState.questoes.map((q) => q.questao.id),
        unorderedEquals(ids),
      );
      vm.selecionarTodas(true);
      expect(vm.uiState.selecionadas, ids.toSet());
      expect(vm.uiState.todasSelecionadas, isTrue);
      vm.selecionarQuestao(historia.single, true);
      expect(vm.uiState.selecionadas, ids.toSet());
      vm.selecionarQuestao(ids.first, false);
      expect(vm.uiState.todasSelecionadas, isFalse);
      vm.selecionarDisciplina('História');
      expect(vm.uiState.selecionadas, isEmpty);
      expect(vm.uiState.questoes.single.questao.id, historia.single);
      vm.selecionarTodas(true);
      expect(vm.uiState.selecionadas, historia.toSet());
      vm.selecionarTodas(false);
      expect(vm.uiState.selecionadas, isEmpty);
    },
  );

  test(
    'retira da seleção questões excluídas e recebe novas questões do banco',
    () async {
      final vm = criar();
      await carregar(vm);
      preencher(vm);
      await BancoQuestaoRepository(db).excluirQuestao(ids.first);
      await esperarEstado(
        vm,
        () => !vm.uiState.selecionadas.contains(ids.first),
      );
      expect(vm.uiState.selecionadas, hasLength(2));
      final novas = await cadastrarQuestoesBanco(db, quantidade: 1);
      await esperarEstado(
        vm,
        () => vm.uiState.questoes.any((q) => q.questao.id == novas.single),
      );
      expect(vm.uiState.selecionadas.contains(novas.single), isFalse);
    },
  );

  test('gera somente as selecionadas na ordem exibida e devolve o id para visualizar', () async {
    final vm = criar();
    await carregar(vm);
    preencher(vm);
    vm
      ..selecionarQuestao(ids[1], false)
      ..alternarEmbaralharQuestoes(false)
      ..alternarEmbaralharAlternativas(false);
    final ordem = vm.uiState.questoes
        .where((q) => vm.uiState.selecionadas.contains(q.questao.id))
        .map((q) => q.questao.enunciado)
        .toList();
    final id = await vm.gerar();
    expect(id, isPositive);
    expect(vm.uiState.provaIdGerada, id);
    final prova = (await ProvaRepository(db).observarProva(id!).first)!;
    expect(prova.questoes.map((q) => q.questao.enunciado), ordem);
    expect(
      prova.questoes.every(
        (q) => q.alternativas.where((a) => a.correta).length == 1,
      ),
      isTrue,
    );
    expect(await vm.gerar(), isNull);
    expect(await ProvaRepository(db).observarProvas().first, hasLength(1));
  });

  test('bloqueia envio duplicado e permite tentar de novo após erro', () async {
    final provas = _ProvasControladas(db);
    final vm = criar(provas: provas);
    await carregar(vm);
    preencher(vm);
    final gerando = vm.gerar();
    expect(vm.uiState.gerando, isTrue);
    vm.atualizarTitulo('Não deve mudar');
    await vm.gerar();
    expect(provas.chamadas, 1);
    expect(vm.uiState.titulo, 'Prova do banco');
    provas.resposta.completeError(
      ArgumentError('Questão não encontrada no banco.'),
    );
    expect(await gerando, isNull);
    expect(vm.uiState.gerando, isFalse);
    expect(vm.uiState.erro, 'Questão não encontrada no banco.');
    vm.atualizarTitulo('Corrigida');
    expect(vm.uiState.erro, isNull);
    expect(vm.uiState.travado, isFalse);
  });

  test('ignora conclusão que chega depois do dispose', () async {
    final provas = _ProvasControladas(db);
    final vm = criar(provas: provas, descartar: false);
    await carregar(vm);
    preencher(vm);
    var avisos = 0;
    vm.addListener(() => avisos++);
    final gerando = vm.gerar();
    expect(avisos, 1);
    vm.dispose();
    provas.resposta.complete(42);
    expect(await gerando, isNull);
    expect(avisos, 1);
  });
}
