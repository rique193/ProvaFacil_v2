import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/local/app_database.dart';
import '../../data/repository/disciplina_repository.dart';
import '../../data/repository/turma_repository.dart';
import '../../util/mensagem_erro.dart';
import 'turmas_disciplinas_ui_state.dart';

class TurmasDisciplinasViewModel extends ChangeNotifier {
  TurmasDisciplinasViewModel(this._turmaRepository, this._disciplinaRepository) {
    _assinaturaTurmas = _turmaRepository.observarTodas().listen(
          (turmas) => _atualizar((s) => s.copyWith(turmas: turmas, carregando: false)),
    );
    _assinaturaDisciplinas = _disciplinaRepository.observarTodas().listen(
          (disciplinas) => _atualizar((s) => s.copyWith(disciplinas: disciplinas, carregando: false)),
    );
  }

  final TurmaRepository _turmaRepository;
  final DisciplinaRepository _disciplinaRepository;

  late final StreamSubscription<List<TurmaEntity>> _assinaturaTurmas;
  late final StreamSubscription<List<DisciplinaEntity>> _assinaturaDisciplinas;
  bool _descartado = false;

  TurmasDisciplinasUiState _uiState = const TurmasDisciplinasUiState();
  TurmasDisciplinasUiState get uiState => _uiState;

  Future<bool> adicionarTurma(String nome) async {
    try {
      await _turmaRepository.salvar(nome);
      _atualizar((s) => s.copyWith(mensagem: 'Turma cadastrada.'));
      return true;
    } catch (e) {
      _atualizar(
            (s) => s.copyWith(mensagem: mensagemDoErro(e) ?? 'Não foi possível salvar a turma.'),
      );
      return false;
    }
  }

  Future<bool> adicionarDisciplina(String nome) async {
    try {
      await _disciplinaRepository.salvar(nome);
      _atualizar((s) => s.copyWith(mensagem: 'Disciplina cadastrada.'));
      return true;
    } catch (e) {
      _atualizar(
            (s) => s.copyWith(mensagem: mensagemDoErro(e) ?? 'Não foi possível salvar a disciplina.'),
      );
      return false;
    }
  }

  Future<void> excluirTurma(int id) async {
    try {
      await _turmaRepository.excluir(id);
      _atualizar((s) => s.copyWith(mensagem: 'Turma excluída.'));
    } catch (e) {
      _atualizar(
            (s) => s.copyWith(mensagem: mensagemDoErro(e) ?? 'Não foi possível excluir a turma.'),
      );
    }
  }

  Future<void> excluirDisciplina(int id) async {
    try {
      await _disciplinaRepository.excluir(id);
      _atualizar((s) => s.copyWith(mensagem: 'Disciplina excluída.'));
    } catch (e) {
      _atualizar(
            (s) => s.copyWith(mensagem: mensagemDoErro(e) ?? 'Não foi possível excluir a disciplina.'),
      );
    }
  }

  void mensagemExibida() => _atualizar((s) => s.copyWith(mensagem: null));

  void _atualizar(TurmasDisciplinasUiState Function(TurmasDisciplinasUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinaturaTurmas.cancel();
    _assinaturaDisciplinas.cancel();
    super.dispose();
  }
}