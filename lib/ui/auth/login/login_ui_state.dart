import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_ui_state.freezed.dart';

/// Estado da tela de login. Depois de entrar, quem leva para a lista de provas é o `redirect`
/// das rotas.
@freezed
abstract class LoginUiState with _$LoginUiState {
  const factory LoginUiState({
    @Default('') String email,
    @Default('') String senha,
    @Default(false) bool senhaVisivel,
    @Default(false) bool carregando,
    String? erro,
  }) = _LoginUiState;
}
