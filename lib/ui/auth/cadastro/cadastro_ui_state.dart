import 'package:freezed_annotation/freezed_annotation.dart';

part 'cadastro_ui_state.freezed.dart';

/// Estado da tela de criar conta. Criada a conta, o professor já fica logado e o `redirect` das
/// rotas leva para a lista de provas.
@freezed
abstract class CadastroUiState with _$CadastroUiState {
  const factory CadastroUiState({
    @Default('') String nome,
    @Default('') String email,
    @Default('') String senha,
    @Default('') String confirmacaoSenha,
    @Default(false) bool senhaVisivel,
    @Default(false) bool carregando,
    String? erro,
  }) = _CadastroUiState;
}
