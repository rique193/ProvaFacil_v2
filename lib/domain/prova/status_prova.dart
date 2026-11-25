/// Situação de correção de uma prova em relação aos alunos da turma dela.
enum StatusProva {
  pendente('Pendente'),
  emCorrecao('Em correção'),
  corrigida('Corrigida');

  const StatusProva(this.rotulo);

  final String rotulo;

  /// - nenhum corrigido: [pendente];
  /// - corrigidos >= alunos da turma (e pelo menos um): [corrigida];
  /// - senão: [emCorrecao].
  ///
  /// Turma sem alunos (`totalAlunosTurma` 0) só pode ser [pendente] ou [corrigida], conforme
  /// exista ou não algum resultado.
  static StatusProva calcular({required int totalAlunosTurma, required int totalCorrigidos}) {
    if (totalCorrigidos <= 0) return pendente;
    if (totalCorrigidos >= totalAlunosTurma) return corrigida;
    return emCorrecao;
  }
}
