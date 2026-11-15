import 'package:freezed_annotation/freezed_annotation.dart';

part 'gabarito_ui_state.freezed.dart';

/// Uma alternativa exibida na tela de Gabarito: só precisamos do id e da letra (posição).
@freezed
abstract class GabaritoAlternativaState with _$GabaritoAlternativaState {
  const factory GabaritoAlternativaState({required int alternativaId, required String letra}) =
      _GabaritoAlternativaState;
}

/// Uma questão na tela de Gabarito: seu número de exibição e qual alternativa está marcada.
@freezed
abstract class GabaritoQuestaoState with _$GabaritoQuestaoState {
  const factory GabaritoQuestaoState({
    required int questaoId,
    required int numero,
    required List<GabaritoAlternativaState> alternativas,
    int? alternativaCorretaId,
  }) = _GabaritoQuestaoState;
}

@freezed
abstract class GabaritoUiState with _$GabaritoUiState {
  const GabaritoUiState._();

  const factory GabaritoUiState({
    @Default('') String tituloProva,
    @Default('') String disciplina,
    @Default([]) List<GabaritoQuestaoState> questoes,
    @Default(true) bool carregando,
    String? erro,
    @Default(false) bool salvo,
  }) = _GabaritoUiState;

  int get totalQuestoes => questoes.length;

  int get preenchidas => questoes.where((q) => q.alternativaCorretaId != null).length;

  double get progresso => totalQuestoes == 0 ? 0 : preenchidas / totalQuestoes;
}
