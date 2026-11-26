import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../data/local/app_database.dart';
import '../../../data/repository/banco_questao_repository.dart';
import '../../../data/repository/disciplina_repository.dart';
import '../../../util/mensagem_erro.dart';
import 'banco_questao_form_ui_state.dart';

class BancoQuestaoFormViewModel extends ChangeNotifier {
  BancoQuestaoFormViewModel(
      this._questaoRepository,
      this._disciplinaRepository,
      int? questaoId,
      ) : _uiState = BancoQuestaoFormUiState(questaoId: questaoId) {
    _assinaturaDisciplinas = _disciplinaRepository.observarTodas().listen(
          (disciplinas) => _atualizar((s) => s.copyWith(disciplinas: disciplinas)),
    );
    if (questaoId != null) {
      _carregarQuestao(questaoId);
    }
  }

  final BancoQuestaoRepository _questaoRepository;
  final DisciplinaRepository _disciplinaRepository;

  late final StreamSubscription<List<DisciplinaEntity>> _assinaturaDisciplinas;
  BancoQuestaoFormUiState _uiState;
  bool _descartado = false;

  BancoQuestaoFormUiState get uiState => _uiState;

  Future<void> _carregarQuestao(int questaoId) async {
    _atualizar((s) => s.copyWith(carregando: true, erro: null));
    try {
      final item = await _questaoRepository.buscarQuestao(questaoId);
      if (_descartado) return;
      if (item == null) {
        _atualizar((s) => s.copyWith(carregando: false, erro: 'Questão não encontrada.'));
        return;
      }
      final ordenadas = [...item.alternativas]..sort((a, b) => a.ordem.compareTo(b.ordem));
      final textos = List<String>.generate(
        5,
            (i) => i < ordenadas.length ? ordenadas[i].texto : '',
      );
      final correta = ordenadas.indexWhere((a) => a.correta);

      _atualizar(
            (s) => s.copyWith(
          carregando: false,
          disciplina: item.questao.disciplina,
          enunciado: item.questao.enunciado,
          alternativas: textos,
          indiceCorreta: correta,
        ),
      );
    } catch (e) {
      if (_descartado) return;
      _atualizar(
            (s) => s.copyWith(
          carregando: false,
          erro: mensagemDoErro(e) ?? 'Não foi possível carregar a questão.',
        ),
      );
    }
  }

  void atualizarDisciplina(String valor) =>
      _atualizarEditavel((s) => s.copyWith(disciplina: valor, erro: null));

  void atualizarEnunciado(String valor) =>
      _atualizarEditavel((s) => s.copyWith(enunciado: valor, erro: null));

  void atualizarAlternativa(int indice, String valor) {
    if (indice < 0 || indice >= 5) return;
    _atualizarEditavel((s) {
      final lista = [...s.alternativas];
      lista[indice] = valor;
      return s.copyWith(alternativas: lista, erro: null);
    });
  }

  void marcarCorreta(int indice) {
    if (indice < 0 || indice >= 5) return;
    _atualizarEditavel((s) => s.copyWith(indiceCorreta: indice, erro: null));
  }

  Future<void> salvar() async {
    final estado = _uiState;
    if (estado.carregando || estado.salvo || estado.excluida) return;
    _atualizar((s) => s.copyWith(carregando: true, erro: null));

    try {
      final idSalvo = await _questaoRepository.salvarQuestao(
        id: estado.questaoId,
        disciplina: estado.disciplina,
        enunciado: estado.enunciado,
        alternativas: estado.alternativas,
        indiceCorreta: estado.indiceCorreta,
      );
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, salvo: true, questaoId: idSalvo));
    } catch (e) {
      if (_descartado) return;
      _atualizar(
            (s) => s.copyWith(
          carregando: false,
          erro: mensagemDoErro(e) ?? 'Não foi possível salvar a questão.',
        ),
      );
    }
  }

  Future<void> excluir() async {
    final id = _uiState.questaoId;
    if (id == null || _uiState.carregando || _uiState.salvo || _uiState.excluida) return;
    _atualizar((s) => s.copyWith(carregando: true, erro: null));

    try {
      await _questaoRepository.excluirQuestao(id);
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, excluida: true));
    } catch (e) {
      if (_descartado) return;
      _atualizar(
            (s) => s.copyWith(
          carregando: false,
          erro: mensagemDoErro(e) ?? 'Não foi possível excluir a questão.',
        ),
      );
    }
  }

  void _atualizarEditavel(BancoQuestaoFormUiState Function(BancoQuestaoFormUiState) f) {
    if (_uiState.carregando || _uiState.salvo || _uiState.excluida) return;
    _atualizar(f);
  }

  void _atualizar(BancoQuestaoFormUiState Function(BancoQuestaoFormUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinaturaDisciplinas.cancel();
    super.dispose();
  }
}