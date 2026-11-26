import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local/app_database.dart';
import '../../data/local/relation/banco_questao_com_alternativas.dart';

part 'banco_questoes_ui_state.freezed.dart';

@freezed
abstract class BancoQuestoesUiState with _$BancoQuestoesUiState {
  const factory BancoQuestoesUiState({
    @Default([]) List<BancoQuestaoComAlternativas> questoes,
    @Default([]) List<DisciplinaEntity> disciplinas,
    String? disciplinaSelecionada,
    @Default(true) bool carregando,
    String? mensagem,
  }) = _BancoQuestoesUiState;
}