import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/prova_com_questoes.dart';
import 'package:provafacil/data/local/relation/questao_com_alternativas.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/data/repository/resultado_repository.dart';
import 'package:provafacil/ui/correcao/corrigir/correcao_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

class ProvasTeste extends ProvaRepository {
  ProvasTeste(super.db);
  final controlador = StreamController<List<ProvaComQuestoes>>.broadcast(
    sync: true,
  );
  @override
  Stream<List<ProvaComQuestoes>> observarProvas() => controlador.stream;
}

class ResultadosTeste extends ResultadoRepository {
  ResultadosTeste(super.db);
  int chamadas = 0;
  Map<int, Set<String>>? respostas;
  Completer<int>? conclusao;
  @override
  Future<int> corrigirESalvar({
    required int provaId,
    required String nomeAluno,
    required String turma,
    required Map<int, Set<String>> respostasLidas,
    double notaMaxima = 10,
  }) async {
    chamadas++;
    respostas = respostasLidas;
    return conclusao == null ? 42 : conclusao!.future;
  }
}

ProvaComQuestoes provaTeste(
  int id, {
  List<int> semGabarito = const [],
  int total = 3,
  List<int>? ordem,
}) => ProvaComQuestoes(
  prova: ProvaEntity(
    id: id,
    titulo: 'Prova $id',
    disciplina: 'Matemática',
    descricao: '',
    criadaEm: 0,
  ),
  questoes: [
    for (var i = 0; i < total; i++)
      QuestaoComAlternativas(
        questao: QuestaoEntity(
          id: id * 10 + i,
          provaId: id,
          enunciado: 'Q${i + 1}',
          ordem: ordem?[i] ?? i,
        ),
        alternativas: [
          for (var a = 0; a < 5; a++)
            AlternativaEntity(
              id: id * 100 + i * 5 + a,
              questaoId: id * 10 + i,
              texto: 'Alternativa $a',
              correta: a == 0 && !semGabarito.contains(i + 1),
              ordem: a,
            ),
        ],
      ),
  ],
);

Future<void> aguardarEstado(ChangeNotifier vm, bool Function() pronto) async {
  if (pronto()) return;
  final fim = Completer<void>();
  void ouvir() {
    if (pronto() && !fim.isCompleted) fim.complete();
  }

  vm.addListener(ouvir);
  try {
    await fim.future.timeout(const Duration(seconds: 5));
  } finally {
    vm.removeListener(ouvir);
  }
}

void main() {
  late AppDatabase db;
  late ProvasTeste provas;
  late ResultadosTeste resultados;
  CorrecaoViewModel? vm;
  setUp(() {
    db = criarBancoEmMemoria();
    provas = ProvasTeste(db);
    resultados = ResultadosTeste(db);
  });
  tearDown(() async {
    vm?.dispose();
    await provas.controlador.close();
    await db.close();
  });
  CorrecaoViewModel criar({
    int? inicial,
    Map<int, Set<String>> respostas = const {},
    String aluno = 'Ana',
  }) => vm = CorrecaoViewModel(
    provas,
    resultados,
    provaIdInicial: inicial,
    alunoInicial: aluno,
    respostasIniciais: respostas,
  );

  test(
    'confirma branco e múltipla; cancelar permite revisar antes de salvar',
    () async {
      final m = criar(
        respostas: {
          1: {'A'},
          2: {'A', 'B'},
        },
      );
      provas.controlador.add([provaTeste(1)]);
      await m.corrigir();
      expect(resultados.chamadas, 0);
      expect(m.uiState.confirmacao!.emBranco, [3]);
      expect(m.uiState.confirmacao!.marcacaoMultipla, [2]);
      m.cancelarConfirmacao();
      m.alternarLetra(12, 'A');
      expect(m.uiState.confirmacao, isNull);
      await m.corrigir();
      await m.confirmarCorrecao();
      expect(resultados.chamadas, 1);
      expect(m.uiState.resultadoId, 42);
      expect(resultados.respostas, {
        1: {'A'},
        2: {'A', 'B'},
        3: {'A'},
      });
    },
  );
  test('toque repetido deixa em branco e substitui marcação múltipla', () {
    final m = criar(
      respostas: {
        1: {'A', 'B'},
      },
    );
    provas.controlador.add([provaTeste(1)]);
    m.alternarLetra(10, 'A');
    expect(m.uiState.questoes.first.letrasMarcadas, {'A'});
    m.alternarLetra(10, 'A');
    expect(m.uiState.questoes.first.letrasMarcadas, isEmpty);
  });
  test('ignora clique duplo e notificação depois do descarte', () async {
    final m = criar(
      respostas: {
        1: {'A'},
        2: {'A'},
        3: {'A'},
      },
    );
    provas.controlador.add([provaTeste(1)]);
    resultados.conclusao = Completer<int>();
    final primeira = m.corrigir();
    await m.corrigir();
    expect(resultados.chamadas, 1);
    m.dispose();
    vm = null;
    resultados.conclusao!.complete(42);
    await primeira;
  });
  test('scanner só é aplicado uma vez; troca de prova limpa marcações', () {
    final m = criar(
      inicial: 1,
      respostas: {
        1: {'A'},
      },
    );
    provas.controlador.add([provaTeste(1), provaTeste(2)]);
    expect(m.uiState.respondidas, 1);
    m.selecionarProva(2);
    expect(m.uiState.respondidas, 0);
    m.selecionarProva(1);
    expect(m.uiState.respondidas, 0);
  });
  test('gabarito atualizado preserva marcações por identidade; exclusão limpa seleção', () {
    final m = criar(
      respostas: {
        1: {'B'},
      },
    );
    provas.controlador.add([provaTeste(1)]);
    provas.controlador.add([
      provaTeste(1, semGabarito: [1], ordem: [2, 0, 1]),
    ]);
    expect(m.uiState.questoes.last.questaoId, 10);
    expect(m.uiState.questoes.last.letrasMarcadas, {'B'});
    expect(m.uiState.questoesSemGabarito, [3]);
    provas.controlador.add([]);
    expect(m.uiState.provaSelecionadaId, isNull);
    expect(m.uiState.questoes, isEmpty);
  });
  test('seleção automática, prova ausente e nenhuma seleção', () async {
    final m = criar(inicial: 99);
    provas.controlador.add([provaTeste(1)]);
    expect(
      m.uiState.erro,
      'A prova selecionada não foi encontrada. Selecione uma prova.',
    );
    await m.corrigir();
    expect(m.uiState.erro, 'Selecione a prova.');
    m.selecionarProva(1);
    expect(m.uiState.erro, isNull);
  });
  test('valida questões e gabarito antes do nome do aluno', () async {
    final m = criar(aluno: ' ');
    provas.controlador.add([provaTeste(1, total: 0)]);
    await m.corrigir();
    expect(m.uiState.erro, contains('não tem questões'));
    provas.controlador.add([
      provaTeste(1, semGabarito: [1, 2, 3]),
    ]);
    await m.corrigir();
    expect(m.uiState.erro, contains('ainda não tem gabarito'));
    provas.controlador.add([
      provaTeste(1, semGabarito: [2]),
    ]);
    await m.corrigir();
    expect(m.uiState.erro, contains('questão(ões) 2'));
    provas.controlador.add([provaTeste(1)]);
    await m.corrigir();
    expect(m.uiState.erro, 'Informe o nome do aluno.');
    expect(resultados.chamadas, 0);
  });
}
