import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../data/local/relation/prova_com_questoes.dart';
import '../../../data/repository/gabarito_mapper.dart';
import '../../../data/repository/prova_repository.dart';
import '../../../data/repository/resultado_repository.dart';
import '../../../domain/correcao/corretor_prova.dart';
import '../../../domain/correcao/validador_correcao.dart';
import '../../../util/mensagem_erro.dart';
import 'correcao_ui_state.dart';

class CorrecaoViewModel extends ChangeNotifier {
  CorrecaoViewModel(
    this._provaRepository,
    this._resultadoRepository, {
    this._provaIdInicial,
    String alunoInicial = '',
    String turmaInicial = '',
    Map<int, Set<String>> respostasIniciais = const {},
  }) : _respostasIniciais = {
         for (final e in respostasIniciais.entries)
           e.key: Set<String>.unmodifiable(e.value),
       },
       _uiState = CorrecaoUiState(
         nomeAluno: alunoInicial,
         turma: turmaInicial,
       ) {
    _assinatura = _provaRepository.observarProvas().listen(
      _receberProvas,
      onError: (Object erro) => _atualizar(
        (s) => s.copyWith(
          carregando: false,
          erro: mensagemDoErro(erro) ?? 'Não foi possível corrigir a prova.',
        ),
      ),
    );
  }
  final ProvaRepository _provaRepository;
  final ResultadoRepository _resultadoRepository;
  final int? _provaIdInicial;
  final Map<int, Set<String>> _respostasIniciais;
  late final StreamSubscription<List<ProvaComQuestoes>> _assinatura;
  CorrecaoUiState _uiState;
  CorrecaoUiState get uiState => _uiState;
  List<ProvaComQuestoes> _provasCarregadas = [];
  bool _respostasIniciaisAplicadas = false;
  bool _descartado = false;

  void _receberProvas(List<ProvaComQuestoes> provas) {
    if (_descartado) return;
    _provasCarregadas = provas;
    _atualizar(
      (s) => s.copyWith(
        carregando: false,
        provas: [
          for (final p in provas)
            ProvaOpcao(
              provaId: p.prova.id,
              titulo: p.prova.titulo,
              disciplina: p.prova.disciplina,
              totalQuestoes: p.questoes.length,
            ),
        ],
      ),
    );
    final selecionadaId = _uiState.provaSelecionadaId;
    final selecionada = provas
        .where((p) => p.prova.id == selecionadaId)
        .firstOrNull;
    if (selecionada != null) {
      final marcacoes = {
        for (final q in _uiState.questoes) q.questaoId: q.letrasMarcadas,
      };
      _atualizar(
        (s) => s.copyWith(
          questoes: _montarQuestoes(
            selecionada,
            (_, id) => marcacoes[id] ?? {},
          ),
        ),
      );
    } else if (selecionadaId != null) {
      _atualizar(
        (s) => s.copyWith(
          provaSelecionadaId: null,
          questoes: [],
          confirmacao: null,
        ),
      );
    } else if (_provaIdInicial != null &&
        provas.any((p) => p.prova.id == _provaIdInicial)) {
      selecionarProva(_provaIdInicial);
    } else if (_provaIdInicial == null && provas.length == 1) {
      selecionarProva(provas.single.prova.id);
    } else if (_provaIdInicial != null) {
      _atualizar(
        (s) => s.copyWith(
          erro: 'A prova selecionada não foi encontrada. Selecione uma prova.',
        ),
      );
    }
  }

  void selecionarProva(int provaId) {
    if (_uiState.corrigindo || provaId == _uiState.provaSelecionadaId) return;
    final prova = _provasCarregadas
        .where((p) => p.prova.id == provaId)
        .firstOrNull;
    if (prova == null) return;
    final usar =
        !_respostasIniciaisAplicadas &&
        (_provaIdInicial == null || provaId == _provaIdInicial);
    if (usar) _respostasIniciaisAplicadas = true;
    final marcacoes = usar ? _respostasIniciais : <int, Set<String>>{};
    _atualizar(
      (s) => s.copyWith(
        provaSelecionadaId: provaId,
        questoes: _montarQuestoes(
          prova,
          (numero, _) => marcacoes[numero] ?? {},
        ),
        erro: null,
        confirmacao: null,
      ),
    );
  }

  void atualizarNomeAluno(String valor) => _atualizar(
    (s) => s.copyWith(nomeAluno: valor, erro: null, confirmacao: null),
  );
  void atualizarTurma(String valor) => _atualizar(
    (s) => s.copyWith(turma: valor, erro: null, confirmacao: null),
  );
  void alternarLetra(int questaoId, String letra) {
    if (_uiState.corrigindo) return;
    _atualizar(
      (s) => s.copyWith(
        erro: null,
        confirmacao: null,
        questoes: [
          for (final q in s.questoes)
            if (q.questaoId != questaoId || !q.letras.contains(letra))
              q
            else
              q.copyWith(
                letrasMarcadas:
                    q.letrasMarcadas.length == 1 &&
                        q.letrasMarcadas.contains(letra)
                    ? {}
                    : {letra},
              ),
        ],
      ),
    );
  }

  Future<void> corrigir() => _executarCorrecao(confirmado: false);
  Future<void> confirmarCorrecao() async {
    if (_uiState.confirmacao == null) return;
    await _executarCorrecao(confirmado: true);
  }

  void cancelarConfirmacao() =>
      _atualizar((s) => s.copyWith(confirmacao: null));

  Future<void> _executarCorrecao({required bool confirmado}) async {
    final estado = _uiState;
    if (_descartado || estado.corrigindo || estado.resultadoId != null) return;
    final provaId = estado.provaSelecionadaId;
    final erro = switch (estado) {
      _ when provaId == null => 'Selecione a prova.',
      _ when estado.questoes.isEmpty => const ProvaSemQuestoes().mensagem,
      _ when estado.provaSemGabarito => const ProvaSemGabarito().mensagem,
      _ when estado.questoesSemGabarito.isNotEmpty => GabaritoIncompleto(
        estado.questoesSemGabarito,
      ).mensagem,
      _ when estado.nomeAluno.trim().isEmpty => 'Informe o nome do aluno.',
      _ => null,
    };
    if (erro != null || provaId == null) {
      _atualizar((s) => s.copyWith(erro: erro, confirmacao: null));
      return;
    }
    if (!confirmado &&
        (estado.questoesEmBranco.isNotEmpty ||
            estado.questoesMarcacaoMultipla.isNotEmpty)) {
      _atualizar(
        (s) => s.copyWith(
          erro: null,
          confirmacao: ConfirmacaoCorrecao(
            emBranco: estado.questoesEmBranco,
            marcacaoMultipla: estado.questoesMarcacaoMultipla,
          ),
        ),
      );
      return;
    }
    _atualizar(
      (s) => s.copyWith(corrigindo: true, erro: null, confirmacao: null),
    );
    try {
      final id = await _resultadoRepository.corrigirESalvar(
        provaId: provaId,
        nomeAluno: estado.nomeAluno,
        turma: estado.turma,
        respostasLidas: {
          for (final q in estado.questoes) q.numero: q.letrasMarcadas,
        },
      );
      _atualizar((s) => s.copyWith(corrigindo: false, resultadoId: id));
    } catch (e) {
      final mensagem = e is GabaritoIncompletoException
          ? e.mensagem
          : mensagemDoErro(e);
      _atualizar(
        (s) => s.copyWith(
          corrigindo: false,
          erro: mensagem ?? 'Não foi possível corrigir a prova.',
        ),
      );
    }
  }

  List<CorrecaoQuestaoState> _montarQuestoes(
    ProvaComQuestoes prova,
    Set<String> Function(int, int) marcacao,
  ) => [
    for (final q in prova.paraCorrecao().questoes)
      CorrecaoQuestaoState(
        questaoId: q.questaoId,
        numero: q.numero,
        letras: q.letras,
        letrasMarcadas: marcacao(q.numero, q.questaoId),
        temGabarito: q.letraCorreta != null,
      ),
  ];

  void _atualizar(CorrecaoUiState Function(CorrecaoUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinatura.cancel();
    super.dispose();
  }
}
