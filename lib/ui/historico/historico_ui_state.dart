import 'package:freezed_annotation/freezed_annotation.dart';

part 'historico_ui_state.freezed.dart';

/// Uma prova corrigida no histórico, com os valores agregados dos resultados salvos.
@freezed
abstract class AvaliacaoHistoricoUiState with _$AvaliacaoHistoricoUiState {
  const factory AvaliacaoHistoricoUiState({
    required int provaId,
    required String titulo,
    required String disciplina,
    /// Turmas dos alunos corrigidos, já formatadas ("Turma A, Turma B"); vazio se não houver.
    required String turmas,
    required int totalCorrigidos,
    required double media,
    required int ultimaCorrecaoEm,
  }) = _AvaliacaoHistoricoUiState;
}

@freezed
abstract class HistoricoUiState with _$HistoricoUiState {
  const factory HistoricoUiState({
    @Default(true) bool carregando,
    @Default(<AvaliacaoHistoricoUiState>[]) List<AvaliacaoHistoricoUiState> avaliacoes,
  }) = _HistoricoUiState;
}