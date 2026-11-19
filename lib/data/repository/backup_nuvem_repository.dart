import 'package:freezed_annotation/freezed_annotation.dart';

import '../backup/backup_resultados.dart';
import '../backup/mapeamento_firestore.dart';
import '../local/app_database.dart';
import '../local/dao/historico_dao.dart';

part 'backup_nuvem_repository.freezed.dart';

/// Quantos documentos foram colocados na fila de envio.
@freezed
abstract class ResumoEnvioNuvem with _$ResumoEnvioNuvem {
  const factory ResumoEnvioNuvem({required int resultados, required int alunos}) =
      _ResumoEnvioNuvem;
}

/// Envio do banco local para a nuvem: lê os alunos e resultados (com as respostas) e passa para o
/// backup. O banco local não é alterado.
class BackupNuvemRepository {
  BackupNuvemRepository(this._database, this._backup) : _dao = _database.historicoDao;

  final AppDatabase _database;
  final BackupResultados _backup;
  final HistoricoDao _dao;

  /// Envia todos os alunos e resultados (sincronização ao abrir o Histórico).
  Future<ResumoEnvioNuvem> enviarTudo() async {
    // Uma transação só, para os resultados e as respostas serem do mesmo momento.
    final (alunos, resultados) = await _database.transaction(() async {
      final alunos = await _dao.listarAlunosParaBackup();
      final resultados = agruparResultadosParaBackup(
        await _dao.listarResultadosParaBackup(),
        await _dao.listarRespostasParaBackup(),
      );
      return (alunos, resultados);
    });
    await _backup.enviar(alunos, resultados);
    return ResumoEnvioNuvem(resultados: resultados.length, alunos: alunos.length);
  }

  /// Envia um resultado recém-corrigido e o aluno dele (que pode ter sido criado pela correção).
  /// Não faz nada se o resultado ou o aluno não existirem mais.
  Future<void> enviarResultado(int resultadoId) async {
    final dados = await _database.transaction(() async {
      final resultado = await _dao.buscarResultadoParaBackup(resultadoId);
      if (resultado == null) return null;
      final aluno = await _database.alunoDao.buscarPorId(resultado.alunoId);
      if (aluno == null) return null;
      final resultados = agruparResultadosParaBackup([
        resultado,
      ], await _dao.listarRespostasDoResultadoParaBackup(resultadoId));
      return (aluno, resultados);
    });
    if (dados == null) return;
    final (aluno, resultados) = dados;
    await _backup.enviar([aluno], resultados);
  }
}
