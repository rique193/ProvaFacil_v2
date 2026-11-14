import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/ui/provas/form/prova_form_ui_state.dart';
import 'package:provafacil/ui/provas/form/prova_form_view_model.dart';

import '../../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late ProvaRepository repository;

  setUp(() {
    db = criarBancoEmMemoria();
    repository = ProvaRepository(db);
  });

  tearDown(() => db.close());

  void preencherQuestao(ProvaFormViewModel vm, int indice, {String prefixo = ''}) {
    vm.atualizarEnunciado(indice, '${prefixo}Enunciado ${indice + 1}');
    for (var i = 0; i < quantidadeAlternativas; i++) {
      vm.atualizarTextoAlternativa(indice, i, '${prefixo}Alt $i');
    }
  }

  Future<void> esperarCarregar(ProvaFormViewModel vm) async {
    while (vm.uiState.carregando) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  test('prova nova começa com uma questão de cinco alternativas', () {
    final vm = ProvaFormViewModel(repository, null);

    expect(vm.uiState.estaEditando, isFalse);
    expect(vm.uiState.questoes, hasLength(1));
    expect(vm.uiState.questoes.single.alternativas, hasLength(quantidadeAlternativas));
  });

  test('validação local mostra as mensagens na ordem do Kotlin', () async {
    final vm = ProvaFormViewModel(repository, null);

    await vm.salvar();
    expect(vm.uiState.erro, 'Informe o título da prova.');

    vm.atualizarTitulo('Prova');
    await vm.salvar();
    expect(vm.uiState.erro, 'Informe a disciplina.');

    vm.atualizarDisciplina('História');
    vm.adicionarQuestao();
    preencherQuestao(vm, 0);
    await vm.salvar();
    expect(vm.uiState.erro, 'Preencha o enunciado da questão 2.');

    vm.atualizarEnunciado(1, 'Outra');
    vm.atualizarTextoAlternativa(1, 0, 'Só uma');
    await vm.salvar();
    expect(vm.uiState.erro, 'Preencha todas as alternativas da questão 2.');

    vm.removerQuestao(1);
    vm.removerQuestao(0);
    await vm.salvar();
    expect(vm.uiState.erro, 'Adicione ao menos uma questão.');
  });

  test('editar um campo limpa o erro', () async {
    final vm = ProvaFormViewModel(repository, null);
    await vm.salvar();

    vm.atualizarTitulo('P');

    expect(vm.uiState.erro, isNull);
  });

  test('salvar prova nova grava, marca salvo e trava o formulário', () async {
    final vm = ProvaFormViewModel(repository, null);
    vm.atualizarTitulo('  Prova 1  ');
    vm.atualizarDisciplina('Física');
    preencherQuestao(vm, 0);

    await vm.salvar();

    expect(vm.uiState.salvo, isTrue);
    expect(vm.uiState.carregando, isFalse);
    final provaId = vm.uiState.provaId!;
    final salva = (await repository.observarProva(provaId).first)!;
    expect(salva.prova.titulo, 'Prova 1');
    expect(salva.questoes.single.alternativas, hasLength(5));

    vm.atualizarTitulo('Mudou depois de salvar');
    vm.adicionarQuestao();
    expect(vm.uiState.titulo, '  Prova 1  ');
    expect(vm.uiState.questoes, hasLength(1));
  });

  test('editar carrega a prova e preserva os ids ao salvar', () async {
    final criador = ProvaFormViewModel(repository, null)
      ..atualizarTitulo('Prova')
      ..atualizarDisciplina('Química');
    preencherQuestao(criador, 0);
    await criador.salvar();
    final provaId = criador.uiState.provaId!;
    final original = (await repository.observarProva(provaId).first)!.questoes.single;

    final vm = ProvaFormViewModel(repository, provaId);
    expect(vm.uiState.carregando, isTrue);
    vm.atualizarTitulo('Ignorado enquanto carrega');
    await esperarCarregar(vm);

    expect(vm.uiState.estaEditando, isTrue);
    expect(vm.uiState.titulo, 'Prova');
    expect(vm.uiState.questoes.single.id, original.questao.id);
    expect(vm.uiState.questoes.single.alternativas.map((a) => a.texto), [
      for (var i = 0; i < 5; i++) 'Alt $i',
    ]);

    vm.atualizarTextoAlternativa(0, 2, 'Texto novo');
    await vm.salvar();

    final editada = (await repository.observarProva(provaId).first)!.questoes.single;
    expect(editada.questao.id, original.questao.id);
    expect(
      editada.alternativas.map((a) => a.id).toSet(),
      original.alternativas.map((a) => a.id).toSet(),
    );
    expect(editada.alternativas.singleWhere((a) => a.ordem == 2).texto, 'Texto novo');
  });

  test('prova inexistente mostra "Prova não encontrada."', () async {
    final vm = ProvaFormViewModel(repository, 999);
    await esperarCarregar(vm);

    expect(vm.uiState.erro, 'Prova não encontrada.');
  });
}
