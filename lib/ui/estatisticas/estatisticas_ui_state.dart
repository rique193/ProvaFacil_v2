import 'package:freezed_annotation/freezed_annotation.dart';

part 'estatisticas_ui_state.freezed.dart';

/// Filtros disponíveis para a lista de questões da tela de Estatísticas.
enum FiltroEstatisticas {
  todas('Todas'),
  abaixoDe50('Abaixo de 50%'),
  divergentes('Divergentes do gabarito');

  const FiltroEstatisticas(this.rotulo);
  final String rotulo;
}

/// Quanto uma alternativa foi marcada (só marcações únicas) numa questão, pronta para exibição.
@freezed
abstract class AlternativaDistribuicaoUiState with _$AlternativaDistribuicaoUiState {
  const factory AlternativaDistribuicaoUiState({
    required String letra, // No Dart usamos String de uma letra em vez de Char
    required int quantidade,
    required bool ehGabarito,
    required bool ehMaisMarcada,
  }) = _AlternativaDistribuicaoUiState;
}

/// Estatísticas de uma questão, já calculadas a partir das respostas gravadas.
@freezed
abstract class QuestaoEstatisticaUiState with _$QuestaoEstatisticaUiState {
  const factory QuestaoEstatisticaUiState({
    required int numero,
    /// `null` quando a questão não tem respostas registradas.
    required double? percentualAcerto,
    required String? letraDoGabarito,
    required List<AlternativaDistribuicaoUiState> distribuicao,
    required int totalRespostas,
    required int quantidadeEmBranco,
    required int quantidadeMultipla,
    required String? alternativaMaisMarcada,
    required bool divergeDoGabarito,
    required bool gabaritoAlterado,
  }) = _QuestaoEstatisticaUiState;
}

/// Estado da tela de Estatísticas.
@freezed
abstract class EstatisticasUiState with _$EstatisticasUiState {
  const factory EstatisticasUiState({
    @Default(true) bool carregando,
    @Default('') String tituloProva,
    @Default('') String disciplina,
    @Default('') String turmas,
    @Default(0.0) double mediaDaTurma,
    @Default(0.0) double maiorNota,
    @Default(0.0) double menorNota,
    @Default(0) int totalAlunosCorrigidos,
    @Default(FiltroEstatisticas.todas) FiltroEstatisticas filtroSelecionado,
    @Default(<QuestaoEstatisticaUiState>[]) List<QuestaoEstatisticaUiState> todasAsQuestoes,
    @Default(<QuestaoEstatisticaUiState>[]) List<QuestaoEstatisticaUiState> questoesExibidas,
  }) = _EstatisticasUiState;
}

/// Questões que aparecem em cada filtro. Questões sem respostas registradas só aparecem em
/// "Todas" (0 de 0 não é "abaixo de 50%").
List<QuestaoEstatisticaUiState> filtrarQuestoes(
    List<QuestaoEstatisticaUiState> questoes,
    FiltroEstatisticas filtro,
    ) {
  switch (filtro) {
    case FiltroEstatisticas.todas:
      return questoes;
    case FiltroEstatisticas.abaixoDe50:
      return questoes
          .where((it) => it.percentualAcerto != null && it.percentualAcerto! < 0.5)
          .toList();
    case FiltroEstatisticas.divergentes:
      return questoes.where((it) => it.divergeDoGabarito).toList();
  }
}