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
