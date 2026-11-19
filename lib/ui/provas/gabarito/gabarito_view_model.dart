import 'package:flutter/foundation.dart';

import '../../../data/local/app_database.dart';
import '../../../data/repository/prova_repository.dart';
import '../../../util/mensagem_erro.dart';
import 'gabarito_ui_state.dart';

const _erroPadrao = 'Não foi possível carregar ou salvar a prova.';

/// ViewModel da tela de Gabarito: carrega a prova uma vez (não fica observando o stream, para
/// não sobrescrever a seleção do usuário enquanto ele ainda não salvou) e permite marcar/alterar
/// a alternativa correta de cada questão antes de persistir tudo de uma vez em [salvar].
class GabaritoViewModel extends ChangeNotifier {
  GabaritoViewModel(this._repository, this._provaId) {
    _carregar();
  }

  final ProvaRepository _repository;
  final int _provaId;
  GabaritoUiState _uiState = const GabaritoUiState();
  bool _descartado = false;

  GabaritoUiState get uiState => _uiState;

  Future<void> _carregar() async {
    try {
      final provaComQuestoes = await _repository.observarProva(_provaId).first;
      if (_descartado) return;
      if (provaComQuestoes == null) {
        _atualizar((s) => s.copyWith(carregando: false, erro: 'Prova não encontrada.'));
        return;
      }
      final questoes = [...provaComQuestoes.questoes]
        ..sort((a, b) {
          final porOrdem = a.questao.ordem.compareTo(b.questao.ordem);
          return porOrdem != 0 ? porOrdem : a.questao.id.compareTo(b.questao.id);
        });
      _atualizar(
        (s) => s.copyWith(
          carregando: false,
          tituloProva: provaComQuestoes.prova.titulo,
          disciplina: provaComQuestoes.prova.disciplina,
          questoes: [
            for (final (indice, questaoComAlternativas) in questoes.indexed)
              _questaoState(questaoComAlternativas.questao.id, indice + 1, [
                ...questaoComAlternativas.alternativas,
              ]..sort((a, b) => a.ordem.compareTo(b.ordem))),
          ],
        ),
      );
    } catch (e) {
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, erro: mensagemDoErro(e) ?? _erroPadrao));
    }
  }

  GabaritoQuestaoState _questaoState(
    int questaoId,
    int numero,
    List<AlternativaEntity> alternativasOrdenadas,
  ) {
    final corretas = alternativasOrdenadas.where((a) => a.correta).toList();
    return GabaritoQuestaoState(
      questaoId: questaoId,
      numero: numero,
      alternativas: [
        for (final (alternativaIndice, alternativa) in alternativasOrdenadas.indexed)
          GabaritoAlternativaState(
            alternativaId: alternativa.id,
            letra: String.fromCharCode(65 + alternativaIndice),
          ),
      ],
      alternativaCorretaId: corretas.length == 1 ? corretas.single.id : null,
    );
  }

  void selecionarResposta(int questaoId, int alternativaId) {
    if (_uiState.carregando || _uiState.salvo) return;
    final pertence = _uiState.questoes.any(
      (q) => q.questaoId == questaoId && q.alternativas.any((a) => a.alternativaId == alternativaId),
    );
    if (!pertence) return;
    _atualizar(
      (s) => s.copyWith(
        erro: null,
        questoes: [
          for (final questao in s.questoes)
            questao.questaoId == questaoId
                ? questao.copyWith(alternativaCorretaId: alternativaId)
                : questao,
        ],
      ),
    );
  }

  Future<void> salvar() async {
    final estadoAtual = _uiState;
    if (estadoAtual.carregando || estadoAtual.salvo) return;
    if (estadoAtual.questoes.isEmpty || estadoAtual.preenchidas != estadoAtual.totalQuestoes) {
      _atualizar((s) => s.copyWith(erro: 'Defina a resposta correta de todas as questões.'));
      return;
    }
    final respostas = <int, int>{
      for (final questao in estadoAtual.questoes)
        if (questao.alternativaCorretaId != null)
          questao.questaoId: questao.alternativaCorretaId!,
    };

    _atualizar((s) => s.copyWith(carregando: true));
    try {
      await _repository.salvarGabarito(_provaId, respostas);
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, salvo: true));
    } catch (e) {
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, erro: mensagemDoErro(e) ?? _erroPadrao));
    }
  }

  void _atualizar(GabaritoUiState Function(GabaritoUiState) f) {
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}
