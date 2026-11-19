import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/correcao/corretor_prova.dart';

part 'resultado_ui_state.freezed.dart';

enum FiltroQuestoes { todas, acertos, erros, emBranco }

@freezed
abstract class AlternativaResultadoState with _$AlternativaResultadoState {
  const factory AlternativaResultadoState({
    required String letra,
    required String texto,
  }) = _AlternativaResultadoState;
}

@freezed
abstract class ResultadoQuestaoState with _$ResultadoQuestaoState {
  const ResultadoQuestaoState._();
  const factory ResultadoQuestaoState({
    required int numero,
    required String enunciado,
    required List<AlternativaResultadoState> alternativas,
    required Set<String> letrasMarcadas,
    required String letraCorreta,
    required SituacaoQuestao situacao,
  }) = _ResultadoQuestaoState;
  List<String> get letras {
    if (alternativas.isNotEmpty) {
      return alternativas.map((a) => a.letra).toList();
    }
    final usadas = [letraCorreta, ...letrasMarcadas, 'A']..sort();
    return [
      for (var codigo = 65; codigo <= usadas.last.codeUnitAt(0); codigo++)
        String.fromCharCode(codigo),
    ];
  }

  String? textoDa(String letra) =>
      alternativas.where((a) => a.letra == letra).firstOrNull?.texto;
}

@freezed
abstract class ResultadoUiState with _$ResultadoUiState {
  const ResultadoUiState._();
  const factory ResultadoUiState({
    @Default(true) bool carregando,
    String? erro,
    @Default('') String nomeAluno,
    @Default('') String turma,
    @Default('') String tituloProva,
    @Default('') String disciplina,
    @Default(0) int corrigidoEm,
    @Default(0.0) double nota,
    @Default(10.0) double notaMaxima,
    @Default(0) int totalQuestoes,
    @Default(0) int acertos,
    @Default(0) int erros,
    @Default(0) int emBranco,
    @Default([]) List<ResultadoQuestaoState> questoes,
    @Default(FiltroQuestoes.todas) FiltroQuestoes filtro,
  }) = _ResultadoUiState;
  double get percentualAcerto =>
      totalQuestoes == 0 ? 0 : acertos / totalQuestoes;
  List<ResultadoQuestaoState> get questoesFiltradas => switch (filtro) {
    FiltroQuestoes.todas => questoes,
    FiltroQuestoes.acertos =>
      questoes.where((q) => q.situacao == SituacaoQuestao.acerto).toList(),
    FiltroQuestoes.erros =>
      questoes
          .where(
            (q) =>
                q.situacao == SituacaoQuestao.erro ||
                q.situacao == SituacaoQuestao.marcacaoMultipla,
          )
          .toList(),
    FiltroQuestoes.emBranco =>
      questoes.where((q) => q.situacao == SituacaoQuestao.emBranco).toList(),
  };
}
