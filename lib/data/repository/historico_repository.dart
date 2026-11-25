import '../local/app_database.dart';
import '../local/dao/historico_dao.dart';
import '../local/relation/historico_relacoes.dart';
import '../local/relation/progresso_prova.dart';

/// Histórico de correções e relatório de notas, lidos dos resultados que a correção grava.
/// Só leitura.
class HistoricoRepository {
  HistoricoRepository(AppDatabase database) : _dao = database.historicoDao;

  final HistoricoDao _dao;

  Stream<List<ProvaCorrigida>> observarProvasCorrigidas() => _dao.observarProvasCorrigidas();

  Stream<ProvaEntity?> observarProva(int provaId) => _dao.observarProva(provaId);

  Stream<List<NotaAluno>> observarNotasDaProva(int provaId) => _dao.observarNotasDaProva(provaId);

  /// Por prova, quantos alunos foram corrigidos e quantos a turma tem (status da prova).
  Stream<List<ProgressoProva>> observarProgressoProvas() => _dao.observarProgressoProvas();

  /// Alunos da turma da prova que ainda não foram corrigidos.
  Stream<List<AlunoEntity>> observarAlunosPendentes(int provaId) =>
      _dao.observarAlunosPendentes(provaId);
}
