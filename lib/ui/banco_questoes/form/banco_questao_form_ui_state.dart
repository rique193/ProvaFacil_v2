import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/local/app_database.dart';

part 'banco_questao_form_ui_state.freezed.dart';

@freezed
abstract class BancoQuestaoFormUiState with _$BancoQuestaoFormUiState {
  const BancoQuestaoFormUiState._();

  const factory BancoQuestaoFormUiState({
    int? questaoId,
    @Default([]) List<DisciplinaEntity> disciplinas,
    @Default('') String disciplina,
    @Default('') String enunciado,
    @Default(['', '', '', '', '']) List<String> alternativas,
    @Default(-1) int indiceCorreta,
    @Default(false) bool carregando,
    @Default(false) bool salvo,
    @Default(false) bool excluida,
    String? erro,
  }) = _BancoQuestaoFormUiState;

  bool get estaEditando => questaoId != null;
}