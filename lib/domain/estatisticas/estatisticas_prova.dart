import 'package:freezed_annotation/freezed_annotation.dart';

import '../correcao/corretor_prova.dart';

part 'estatisticas_prova.freezed.dart';

/// Uma questão da prova como está cadastrada agora: [ordem] define o número exibido.
@freezed
abstract class QuestaoDaProva with _$QuestaoDaProva {
  const factory QuestaoDaProva({
    required int questaoId,
    required int ordem,

    /// Quantidade de alternativas cadastradas; define as letras exibidas (A, B, C...).
    required int totalAlternativas,
  }) = _QuestaoDaProva;
}

/// Uma resposta gravada na correção de um aluno, com o horário dessa correção.
@freezed
abstract class RespostaRegistrada with _$RespostaRegistrada {
  const factory RespostaRegistrada({
    required int questaoId,

    /// Letras marcadas, ex.: "B". Vazio = em branco; "BD" = marcação múltipla.
    required String letrasMarcadas,

    /// Letra correta no gabarito no momento da correção.
    required String letraCorreta,
    required SituacaoQuestao situacao,
    required int corrigidoEm,
  }) = _RespostaRegistrada;
}
