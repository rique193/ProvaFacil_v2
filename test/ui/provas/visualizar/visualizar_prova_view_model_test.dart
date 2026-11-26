import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/prova_com_questoes.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/ui/provas/visualizar/visualizar_prova_view_model.dart';

import '../../../ajudantes/banco_em_memoria.dart';
import '../../../ajudantes/cenarios_geracao_prova.dart';

class _ProvasComStream extends ProvaRepository {
  _ProvasComStream(super.database, this.stream);
  final Stream<ProvaComQuestoes?> stream;
  @override
  Stream<ProvaComQuestoes?> observarProva(int provaId) => stream;
}

void main() {
  late AppDatabase db;
  late ProvaRepository provas;
  setUp(() {
    db = criarBancoEmMemoria();
    provas = ProvaRepository(db);
  });
  tearDown(() => db.close());

  test('carrega, acompanha edições, gabarito e exclusão da prova', () async {
    final ids = await cadastrarQuestoesBanco(db, quantidade: 1);
    final id = await provas.gerarProvaDoBanco(
      titulo: 'P',
      disciplina: 'Matemática',
      turma: 'Turma A',
      bancoQuestaoIds: ids,
      embaralharQuestoes: false,
      embaralharAlternativas: false,
    );
    final vm = VisualizarProvaViewModel(provas, id);
    addTearDown(vm.dispose);
    await esperarEstado(vm, () => !vm.uiState.carregando);
    expect(vm.uiState.prova!.prova.turma, 'Turma A');
    expect(vm.uiState.erro, isNull);
    final q = vm.uiState.prova!.questoes.single;
    await provas.salvarGabarito(id, {q.questao.id: q.alternativas.last.id});
    await esperarEstado(
      vm,
      () => vm.uiState.prova!.questoes.single.alternativas.last.correta,
    );
    await db.provaDao.atualizarProva(id, 'Editada', 'Matemática', 'Descrição');
    await esperarEstado(vm, () => vm.uiState.prova!.prova.titulo == 'Editada');
    await provas.excluirProva(vm.uiState.prova!.prova);
    await esperarEstado(vm, () => vm.uiState.erro != null);
    expect(vm.uiState.prova, isNull);
    expect(vm.uiState.erro, 'Prova não encontrada.');
  });

  test('id inexistente termina o carregamento com mensagem', () async {
    final vm = VisualizarProvaViewModel(provas, 999);
    addTearDown(vm.dispose);
    await esperarEstado(vm, () => !vm.uiState.carregando);
    expect(vm.uiState.erro, 'Prova não encontrada.');
  });

  test('mostra erro de leitura e cancela a assinatura ao sair', () async {
    final stream = StreamController<ProvaComQuestoes?>();
    final vm = VisualizarProvaViewModel(_ProvasComStream(db, stream.stream), 1);
    expect(stream.hasListener, isTrue);
    stream.addError(StateError('Falha de leitura.'));
    await esperarEstado(vm, () => !vm.uiState.carregando);
    expect(vm.uiState.erro, 'Falha de leitura.');
    vm.dispose();
    expect(stream.hasListener, isFalse);
    await stream.close();
  });
}
