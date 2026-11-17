import '../backup/backup_resultados.dart';
import '../backup/dados_backup.dart';
import '../local/app_database.dart';

class BackupNuvemRepository {
  BackupNuvemRepository(this._database, this._backup);
  final AppDatabase _database;
  final BackupResultados _backup;

  Future<void> enviarResultado(int resultadoId) async {
    if (identical(_backup, BackupResultados.desativado)) return;
    final detalhes = await _database.resultadoDao
        .observarResultado(resultadoId)
        .first;
    if (detalhes == null) throw StateError('Resultado não encontrado.');
    final r = detalhes.resultado;
    final aluno = detalhes.aluno;
    final respostas = [...detalhes.respostas]
      ..sort((a, b) => a.numeroQuestao.compareTo(b.numeroQuestao));
    await _backup.enviarResultado(
      ResultadoParaBackup(
        resultado: LinhaResultadoBackup(
          resultadoId: r.id,
          provaId: r.provaId,
          tituloProva: detalhes.prova.titulo,
          disciplina: detalhes.prova.disciplina,
          alunoId: aluno.id,
          nomeAluno: aluno.nome,
          turma: aluno.turma,
          matricula: aluno.matricula,
          totalQuestoes: r.totalQuestoes,
          acertos: r.acertos,
          erros: r.erros,
          emBranco: r.emBranco,
          nota: r.nota,
          notaMaxima: r.notaMaxima,
          corrigidoEm: r.corrigidoEm,
        ),
        respostas: [
          for (final q in respostas)
            LinhaRespostaBackup(
              resultadoId: r.id,
              questaoId: q.questaoId,
              numeroQuestao: q.numeroQuestao,
              letrasMarcadas: q.letrasMarcadas,
              letraCorreta: q.letraCorreta,
              situacao: q.situacao,
            ),
        ],
      ),
    );
  }
}
