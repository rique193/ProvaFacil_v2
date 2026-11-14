import 'package:freezed_annotation/freezed_annotation.dart';

part 'corretor_prova.freezed.dart';

/// Uma questão do gabarito. [letraCorreta] é nula quando o professor ainda não a definiu.
@freezed
abstract class GabaritoQuestao with _$GabaritoQuestao {
  const factory GabaritoQuestao({
    required int questaoId,
    required int numero,
    required String? letraCorreta,
  }) = _GabaritoQuestao;
}

enum SituacaoQuestao {
  acerto('ACERTO'),
  erro('ERRO'),
  emBranco('EM_BRANCO'),

  /// O aluno marcou mais de uma alternativa: a questão é anulada e conta como erro.
  marcacaoMultipla('MARCACAO_MULTIPLA');

  const SituacaoQuestao(this.nome);

  final String nome;

  static SituacaoQuestao deNome(String nome) => values.firstWhere(
    (situacao) => situacao.nome == nome,
    orElse: () => throw ArgumentError('Situação desconhecida: $nome'),
  );
}
