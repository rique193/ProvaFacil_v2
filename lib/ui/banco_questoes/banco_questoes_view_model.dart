import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/local/app_database.dart';
import '../../data/local/relation/banco_questao_com_alternativas.dart';
import '../../data/repository/banco_questao_repository.dart';
import '../../data/repository/disciplina_repository.dart';
import '../../util/mensagem_erro.dart';
import 'banco_questoes_ui_state.dart';

class BancoQuestoesViewModel extends ChangeNotifier {
  BancoQuestoesViewModel(this._questaoRepository, this._disciplinaRepository) {
    _assinaturaDisciplinas = _disciplinaRepository.observarTodas().listen(
          (disciplinas) => _atualizar((s) => s.copyWith(disciplinas: disciplinas)),
    );
    _assinarQuestoes(null);
  }

  final BancoQuestaoRepository _questaoRepository;
  final DisciplinaRepository _disciplinaRepository;

  late final StreamSubscription<List<DisciplinaEntity>> _assinaturaDisciplinas;
  StreamSubscription<List<BancoQuestaoComAlternativas>>? _assinaturaQuestoes;
  bool _descartado = false;

  BancoQuestoesUiState _uiState = const BancoQuestoesUiState();
  BancoQuestoesUiState get uiState => _uiState;

  void selecionarDisciplina(String? disciplina) {
    if (_uiState.disciplinaSelecionada == disciplina) return;
    _atualizar((s) => s.copyWith(disciplinaSelecionada: disciplina, carregando: true));
    _assinarQuestoes(disciplina);
  }

  void _assinarQuestoes(String? disciplina) {
    _assinaturaQuestoes?.cancel();
    _assinaturaQuestoes = _questaoRepository
        .observarQuestoes(disciplina: disciplina)
        .listen(
          (questoes) => _atualizar((s) => s.copyWith(questoes: questoes, carregando: false)),
    );
  }

  Future<void> excluirQuestao(int id) async {
    try {
      await _questaoRepository.excluirQuestao(id);
      _atualizar((s) => s.copyWith(mensagem: 'Questão excluída.'));
    } catch (e) {
      _atualizar(
            (s) => s.copyWith(mensagem: mensagemDoErro(e) ?? 'Não foi possível excluir a questão.'),
      );
    }
  }

  void mensagemExibida() => _atualizar((s) => s.copyWith(mensagem: null));

  void _atualizar(BancoQuestoesUiState Function(BancoQuestoesUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinaturaDisciplinas.cancel();
    _assinaturaQuestoes?.cancel();
    super.dispose();
  }
}