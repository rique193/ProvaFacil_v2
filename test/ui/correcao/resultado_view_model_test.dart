import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/questao_com_alternativas.dart';
import 'package:provafacil/data/local/relation/resultado_com_detalhes.dart';
import 'package:provafacil/data/repository/resultado_repository.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';
import 'package:provafacil/ui/correcao/resultado/resultado_ui_state.dart';
import 'package:provafacil/ui/correcao/resultado/resultado_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';
import 'correcao_view_model_test.dart' show aguardarEstado;

class ResultadoCarregadoTeste extends ResultadoRepository {
  ResultadoCarregadoTeste(super.db, this.detalhes);
  final ResultadoComDetalhes? detalhes;
  int leituras = 0;
  @override
  Stream<ResultadoComDetalhes?> observarResultado(int resultadoId) {
    leituras++;
    return Stream.value(detalhes);
  }

  @override
  Future<List<QuestaoComAlternativas>> listarQuestoes(int provaId) async => [];
}

ResultadoComDetalhes detalhesTeste() => ResultadoComDetalhes(
  resultado: ResultadoEntity(
    id: 42,
    provaId: 1,
    alunoId: 1,
    totalQuestoes: 4,
    acertos: 1,
    erros: 2,
    emBranco: 1,
    nota: 2.5,
    notaMaxima: 10,
    corrigidoEm: 0,
  ),
  aluno: const AlunoEntity(id: 1, nome: 'Ana', turma: 'Turma A'),
  prova: const ProvaEntity(
    id: 1,
    titulo: 'Prova',
    disciplina: 'Matemática',
    descricao: '',
    turma: '',
    criadaEm: 0,
  ),
  respostas: [
    for (final (i, s) in SituacaoQuestao.values.indexed)
      RespostaAlunoEntity(
        id: i,
        resultadoId: 42,
        questaoId: 10 + i,
        numeroQuestao: i + 1,
        letrasMarcadas: i == 2
            ? ''
            : i == 3
            ? 'BD'
            : 'A',
        letraCorreta: i == 2 ? '' : 'A',
        situacao: s,
      ),
  ],
);

void main() {
  late AppDatabase db;
  ResultadoViewModel? vm;
  setUp(() {
    db = criarBancoEmMemoria();
    vm = null;
  });
  tearDown(() async {
    vm?.dispose();
    await db.close();
  });
  test('resultado inexistente mostra a mensagem original', () async {
    final m = vm = ResultadoViewModel(ResultadoCarregadoTeste(db, null), 99);
    await aguardarEstado(m, () => !m.uiState.carregando);
    expect(m.uiState.erro, 'Resultado não encontrado.');
  });
  test('carrega uma vez e filtro Erros inclui marcação múltipla', () async {
    final r = ResultadoCarregadoTeste(db, detalhesTeste());
    final m = vm = ResultadoViewModel(r, 42);
    await aguardarEstado(m, () => !m.uiState.carregando);
    expect(m.uiState.nomeAluno, 'Ana');
    expect(m.uiState.nota, 2.5);
    expect(m.uiState.percentualAcerto, 0.25);
    m.selecionarFiltro(FiltroQuestoes.erros);
    expect(m.uiState.questoesFiltradas.map((q) => q.numero), [2, 4]);
    m.selecionarFiltro(FiltroQuestoes.acertos);
    expect(m.uiState.questoesFiltradas.map((q) => q.numero), [1]);
    m.selecionarFiltro(FiltroQuestoes.emBranco);
    expect(m.uiState.questoesFiltradas.map((q) => q.numero), [3]);
    m.selecionarFiltro(FiltroQuestoes.todas);
    expect(m.uiState.questoesFiltradas.length, 4);
    expect(r.leituras, 1);
    expect(m.uiState.questoes[2].letraCorreta, '?');
    expect(m.uiState.questoes[3].letras, ['A', 'B', 'C', 'D']);
    expect(m.uiState.questoes[3].textoDa('A'), isNull);
  });
  test('descarte durante leitura não notifica listeners', () async {
    final m = ResultadoViewModel(
      ResultadoCarregadoTeste(db, detalhesTeste()),
      42,
    );
    m.dispose();
    await Future<void>.delayed(Duration.zero);
  });
}
