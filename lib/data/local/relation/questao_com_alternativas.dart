import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_database.dart';

part 'questao_com_alternativas.freezed.dart';

/// Uma questão junto com todas as suas alternativas de resposta.
@freezed
abstract class QuestaoComAlternativas with _$QuestaoComAlternativas {
  const factory QuestaoComAlternativas({
    required QuestaoEntity questao,
    required List<AlternativaEntity> alternativas,
  }) = _QuestaoComAlternativas;
}
