import 'package:drift/drift.dart';

import '../../../domain/estatisticas/estatisticas_prova.dart';
import '../../backup/dados_backup.dart';
import '../../exportacao/planilha_relatorio.dart';
import '../app_database.dart';
import '../entity/alternativa_entity.dart';
import '../entity/aluno_entity.dart';
import '../entity/prova_entity.dart';
import '../entity/questao_entity.dart';
import '../entity/resposta_aluno_entity.dart';
import '../entity/resultado_entity.dart';
import '../relation/historico_relacoes.dart';

part 'historico_dao.g.dart';

/// Consultas só de leitura sobre os resultados salvos, para o Histórico, o Relatório de Notas e as
/// Estatísticas.
@DriftAccessor(tables: [Provas, Questoes, Alternativas, Alunos, Resultados, RespostasAluno])
class HistoricoDao extends DatabaseAccessor<AppDatabase> with _$HistoricoDaoMixin {
  HistoricoDao(super.attachedDatabase);

  /// Provas com pelo menos um resultado, da correção mais recente para a mais antiga.
  Stream<List<ProvaCorrigida>> observarProvasCorrigidas() => throw UnimplementedError();

  Stream<ProvaEntity?> observarProva(int provaId) => throw UnimplementedError();

  /// Nota gravada de cada aluno corrigido na prova, em ordem alfabética.
  Stream<List<NotaAluno>> observarNotasDaProva(int provaId) => throw UnimplementedError();

  /// Turmas dos alunos corrigidos na prova, separadas por vírgula (ver `formatarTurmas`).
  Stream<String?> observarTurmasDaProva(int provaId) => throw UnimplementedError();

  /// Questões da prova como estão cadastradas agora, com a quantidade de alternativas de cada uma.
  Stream<List<QuestaoDaProva>> observarQuestoesDaProva(int provaId) => throw UnimplementedError();

  /// Respostas gravadas em todas as correções da prova, com o horário de cada correção.
  Stream<List<RespostaRegistrada>> observarRespostasDaProva(int provaId) =>
      throw UnimplementedError();

  /// Resultados gravados da prova, com a turma do aluno, para o arquivo exportado (leitura pontual).
  Future<List<ResultadoExportacao>> listarResultadosParaExportacao(int provaId) =>
      throw UnimplementedError();

  /// Todos os alunos, para o envio à nuvem (inclui os criados pela correção).
  Future<List<AlunoEntity>> listarAlunosParaBackup() => throw UnimplementedError();

  /// Todos os resultados gravados, com a prova e o aluno, para o envio à nuvem.
  Future<List<LinhaResultadoBackup>> listarResultadosParaBackup() => throw UnimplementedError();

  /// Um resultado gravado, com a prova e o aluno, para o envio à nuvem logo após a correção.
  Future<LinhaResultadoBackup?> buscarResultadoParaBackup(int resultadoId) =>
      throw UnimplementedError();

  /// Respostas de um resultado gravado, para o envio à nuvem logo após a correção.
  Future<List<LinhaRespostaBackup>> listarRespostasDoResultadoParaBackup(int resultadoId) =>
      throw UnimplementedError();

  /// Respostas de todos os resultados gravados, para o envio à nuvem.
  Future<List<LinhaRespostaBackup>> listarRespostasParaBackup() => throw UnimplementedError();
}
