import 'package:freezed_annotation/freezed_annotation.dart';

part 'fluxo_correcao.freezed.dart';

/// Uma questão da prova com tudo o que a correção precisa: alternativas e a letra certa.
@freezed
abstract class QuestaoParaCorrecao with _$QuestaoParaCorrecao {
  const factory QuestaoParaCorrecao({
    required int questaoId,
    required int numero,
    required List<String> letras,
    required String? letraCorreta,
  }) = _QuestaoParaCorrecao;
}

/// A prova (vinda do banco) no formato usado pelo fluxo de correção.
@freezed
abstract class ProvaParaCorrecao with _$ProvaParaCorrecao {
  const factory ProvaParaCorrecao({
    required int provaId,
    required String titulo,
    required List<QuestaoParaCorrecao> questoes,
  }) = _ProvaParaCorrecao;
}
