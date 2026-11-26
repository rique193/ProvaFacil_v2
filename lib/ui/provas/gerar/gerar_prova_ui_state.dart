import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/local/app_database.dart';
import '../../../data/local/relation/banco_questao_com_alternativas.dart';

part 'gerar_prova_ui_state.freezed.dart';

@freezed
abstract class GerarProvaUiState with _$GerarProvaUiState {
  const GerarProvaUiState._();

  const factory GerarProvaUiState({
    @Default(true) bool carregando,
    @Default(false) bool gerando,
    @Default('') String titulo,
    @Default('') String descricao,
    String? disciplina,
    String? turma,
    @Default([]) List<DisciplinaEntity> disciplinas,
    @Default([]) List<TurmaEntity> turmas,
    @Default([]) List<BancoQuestaoComAlternativas> bancoQuestoes,
    @Default({}) Set<int> selecionadas,
    @Default(true) bool embaralharQuestoes,
    @Default(true) bool embaralharAlternativas,
    int? provaIdGerada,
    String? erro,
  }) = _GerarProvaUiState;

  List<BancoQuestaoComAlternativas> get questoes => [
    for (final item in bancoQuestoes)
      if (item.questao.disciplina == disciplina) item,
  ];

  bool get todasSelecionadas =>
      questoes.isNotEmpty &&
      questoes.every((q) => selecionadas.contains(q.questao.id));

  bool get travado => carregando || gerando || provaIdGerada != null;
}
