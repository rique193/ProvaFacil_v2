import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local/app_database.dart';

part 'turmas_disciplinas_ui_state.freezed.dart';

@freezed
abstract class TurmasDisciplinasUiState with _$TurmasDisciplinasUiState {
  const factory TurmasDisciplinasUiState({
    @Default([]) List<TurmaEntity> turmas,
    @Default([]) List<DisciplinaEntity> disciplinas,
    @Default(true) bool carregando,
    String? mensagem,
  }) = _TurmasDisciplinasUiState;
}