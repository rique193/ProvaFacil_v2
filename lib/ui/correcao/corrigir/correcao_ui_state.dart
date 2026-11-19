import 'package:freezed_annotation/freezed_annotation.dart';

part 'correcao_ui_state.freezed.dart';

@freezed
abstract class ProvaOpcao with _$ProvaOpcao {
  const factory ProvaOpcao({
    required int provaId,
    required String titulo,
    required String disciplina,
    required int totalQuestoes,
  }) = _ProvaOpcao;
}

@freezed
abstract class CorrecaoQuestaoState with _$CorrecaoQuestaoState {
  const factory CorrecaoQuestaoState({
    required int questaoId,
    required int numero,
    required List<String> letras,
    @Default({}) Set<String> letrasMarcadas,
    required bool temGabarito,
  }) = _CorrecaoQuestaoState;
}

@freezed
abstract class CorrecaoUiState with _$CorrecaoUiState {
  const CorrecaoUiState._();
  const factory CorrecaoUiState({
    @Default([]) List<ProvaOpcao> provas,
    int? provaSelecionadaId,
    @Default('') String nomeAluno,
    @Default('') String turma,
    @Default([]) List<CorrecaoQuestaoState> questoes,
    @Default(true) bool carregando,
    @Default(false) bool corrigindo,
    String? erro,
    int? resultadoId,
    ConfirmacaoCorrecao? confirmacao,
  }) = _CorrecaoUiState;
  ProvaOpcao? get provaSelecionada =>
      provas.where((p) => p.provaId == provaSelecionadaId).firstOrNull;
  int get totalQuestoes => questoes.length;
  int get respondidas =>
      questoes.where((q) => q.letrasMarcadas.isNotEmpty).length;
  List<int> get questoesSemGabarito =>
      questoes.where((q) => !q.temGabarito).map((q) => q.numero).toList();
  List<int> get questoesEmBranco => questoes
      .where((q) => q.letrasMarcadas.isEmpty)
      .map((q) => q.numero)
      .toList();
  List<int> get questoesMarcacaoMultipla => questoes
      .where((q) => q.letrasMarcadas.length > 1)
      .map((q) => q.numero)
      .toList();
  bool get provaSemGabarito =>
      questoes.isNotEmpty && questoesSemGabarito.length == questoes.length;
}

@freezed
abstract class ConfirmacaoCorrecao with _$ConfirmacaoCorrecao {
  const factory ConfirmacaoCorrecao({
    required List<int> emBranco,
    required List<int> marcacaoMultipla,
  }) = _ConfirmacaoCorrecao;
}
