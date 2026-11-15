import 'package:freezed_annotation/freezed_annotation.dart';

part 'prova_form_ui_state.freezed.dart';

/// Quantidade de alternativas (A, B, C, D, E) de toda questão. Ver a tela de Gabarito.
const quantidadeAlternativas = 5;

/// Estado editável do texto de uma alternativa dentro do formulário de conteúdo da prova.
/// A resposta correta não é definida aqui: isso é feito depois, na tela de Gabarito.
@freezed
abstract class AlternativaFormState with _$AlternativaFormState {
  const factory AlternativaFormState({@Default('') String texto, int? id}) = _AlternativaFormState;
}

/// Estado editável de uma questão dentro do formulário. Sempre tem [quantidadeAlternativas]
/// alternativas (A a E).
@freezed
abstract class QuestaoFormState with _$QuestaoFormState {
  const factory QuestaoFormState({
    @Default('') String enunciado,
    int? id,
    @Default([
      AlternativaFormState(),
      AlternativaFormState(),
      AlternativaFormState(),
      AlternativaFormState(),
      AlternativaFormState(),
    ])
    List<AlternativaFormState> alternativas,
  }) = _QuestaoFormState;
}

/// Estado da tela de cadastro/edição do conteúdo de uma prova (título, disciplina, questões e
/// texto das alternativas). Definir qual alternativa é a correta acontece na tela de Gabarito.
@freezed
abstract class ProvaFormUiState with _$ProvaFormUiState {
  const ProvaFormUiState._();

  const factory ProvaFormUiState({
    int? provaId,
    @Default('') String titulo,
    @Default('') String disciplina,
    @Default('') String descricao,
    @Default([QuestaoFormState()]) List<QuestaoFormState> questoes,
    @Default(false) bool carregando,
    String? erro,
    @Default(false) bool salvo,
  }) = _ProvaFormUiState;

  bool get estaEditando => provaId != null;
}
