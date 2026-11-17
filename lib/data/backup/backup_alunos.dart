import '../local/app_database.dart';

/// Cópia na nuvem dos alunos salvos no banco local. O banco local é a fonte de verdade: o
/// `AlunoRepository` chama o backup só depois que o cadastro, a edição ou a exclusão foi gravada,
/// e uma falha aqui não desfaz nada.
///
/// O app usa o `BackupAlunosFirestore`; os testes usam implementações falsas ou [desativado].
abstract interface class BackupAlunos {
  /// Envia o aluno cadastrado ou editado (sobrescreve o mesmo documento).
  Future<void> salvarAluno(AlunoEntity aluno);

  /// Remove o aluno excluído e os resultados dele nas provas [provaIds] (lidos antes da exclusão
  /// local, que apaga os resultados em cascata).
  Future<void> removerAluno(int alunoId, List<int> provaIds);

  /// Não envia nada para a nuvem.
  static const BackupAlunos desativado = _BackupAlunosDesativado();
}

final class _BackupAlunosDesativado implements BackupAlunos {
  const _BackupAlunosDesativado();

  @override
  Future<void> salvarAluno(AlunoEntity aluno) async {}

  @override
  Future<void> removerAluno(int alunoId, List<int> provaIds) async {}
}
