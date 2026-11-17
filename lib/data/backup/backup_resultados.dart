import 'dados_backup.dart';

abstract interface class BackupResultados {
  static const BackupResultados desativado = _BackupResultadosDesativado();
  Future<void> enviarResultado(ResultadoParaBackup resultado);
}

class _BackupResultadosDesativado implements BackupResultados {
  const _BackupResultadosDesativado();
  @override
  Future<void> enviarResultado(ResultadoParaBackup resultado) async {}
}
