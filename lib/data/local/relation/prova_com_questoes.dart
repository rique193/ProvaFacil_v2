import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_database.dart';
import 'questao_com_alternativas.dart';

part 'prova_com_questoes.freezed.dart';

/// Uma prova completa: seus dados de cabeçalho, cada questão e o gabarito (alternativas
/// com a flag `correta`) de cada uma.
@freezed
abstract class ProvaComQuestoes with _$ProvaComQuestoes {
  const factory ProvaComQuestoes({
    required ProvaEntity prova,
    required List<QuestaoComAlternativas> questoes,
  }) = _ProvaComQuestoes;
}
