import '../local/app_database.dart';
import 'dados_backup.dart';

/// Envio dos alunos e resultados para a nuvem, a mesma assinatura de [BackupResultados.enviar].
typedef EnviarParaNuvem = Future<void> Function(
  List<AlunoEntity> alunos,
  List<ResultadoParaBackup> resultados,
);

/// Cópia na nuvem dos resultados (e dos alunos deles) salvos no banco local. O banco local é a fonte
/// de verdade: o envio acontece depois que a correção foi gravada, e uma falha aqui não desfaz nada.
///
/// Usado a cada correção (`ResultadoRepository.corrigirESalvar`) e na sincronização ao abrir o
/// Histórico. Reenviar sobrescreve os mesmos documentos (ver `idDocumentoResultado`); nada é
/// duplicado.
///
/// Veja `BackupAlunos` para o envio de cada aluno cadastrado na tela de Alunos.
abstract interface class BackupResultados {
  /// Backup feito por uma função, como o `fun interface` do Kotlin (útil nos testes).
  const factory BackupResultados(EnviarParaNuvem enviar) = _BackupResultadosFuncao;

  /// Coloca os documentos na fila de envio, sem esperar a rede.
  Future<void> enviar(List<AlunoEntity> alunos, List<ResultadoParaBackup> resultados);

  /// Não envia nada para a nuvem.
  static const BackupResultados desativado = _BackupResultadosDesativado();
}

final class _BackupResultadosFuncao implements BackupResultados {
  const _BackupResultadosFuncao(this._enviar);

  final EnviarParaNuvem _enviar;

  @override
  Future<void> enviar(List<AlunoEntity> alunos, List<ResultadoParaBackup> resultados) =>
      _enviar(alunos, resultados);
}

final class _BackupResultadosDesativado implements BackupResultados {
  const _BackupResultadosDesativado();

  @override
  Future<void> enviar(List<AlunoEntity> alunos, List<ResultadoParaBackup> resultados) async {}
}
