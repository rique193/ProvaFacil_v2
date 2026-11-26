import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/local/relation/prova_com_questoes.dart';

part 'visualizar_prova_ui_state.freezed.dart';

@freezed
abstract class VisualizarProvaUiState with _$VisualizarProvaUiState {
  const factory VisualizarProvaUiState({
    @Default(true) bool carregando,
    ProvaComQuestoes? prova,
    String? erro,
  }) = _VisualizarProvaUiState;
}
