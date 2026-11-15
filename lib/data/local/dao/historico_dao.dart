import 'package:drift/drift.dart';

import '../../../domain/correcao/corretor_prova.dart';
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
  Stream<List<ProvaCorrigida>> observarProvasCorrigidas() => customSelect(
    '''
    SELECT provas.id AS provaId,
           provas.titulo AS titulo,
           provas.disciplina AS disciplina,
           COUNT(resultados.id) AS totalCorrigidos,
           AVG(resultados.nota) AS media,
           MAX(resultados.corrigidoEm) AS ultimaCorrecaoEm,
           GROUP_CONCAT(DISTINCT alunos.turma) AS turmas
    FROM provas
    INNER JOIN resultados ON resultados.provaId = provas.id
    INNER JOIN alunos ON alunos.id = resultados.alunoId
    GROUP BY provas.id
    ORDER BY ultimaCorrecaoEm DESC, provas.id DESC
    ''',
    readsFrom: {provas, resultados, alunos},
  ).watch().map(
        (linhas) => [
      for (final linha in linhas)
        ProvaCorrigida(
          provaId: linha.read<int>('provaId'),
          titulo: linha.read<String>('titulo'),
          disciplina: linha.read<String>('disciplina'),
          totalCorrigidos: linha.read<int>('totalCorrigidos'),
          media: linha.read<double>('media'),
          ultimaCorrecaoEm: linha.read<int>('ultimaCorrecaoEm'),
          turmas: linha.readNullable<String>('turmas'),
        ),
    ],
  );

  Stream<ProvaEntity?> observarProva(int provaId) =>
      (select(provas)..where((p) => p.id.equals(provaId))).watchSingleOrNull();

  /// Nota gravada de cada aluno corrigido na prova, em ordem alfabética.
  Stream<List<NotaAluno>> observarNotasDaProva(int provaId) => customSelect(
    '''
    SELECT alunos.id AS alunoId,
           alunos.nome AS nome,
           alunos.matricula AS matricula,
           resultados.acertos AS acertos,
           resultados.nota AS nota
    FROM resultados
    INNER JOIN alunos ON alunos.id = resultados.alunoId
    WHERE resultados.provaId = ?
    ORDER BY alunos.nome COLLATE NOCASE
    ''',
    variables: [Variable.withInt(provaId)],
    readsFrom: {resultados, alunos},
  ).watch().map(
        (linhas) => [
      for (final linha in linhas)
        NotaAluno(
          alunoId: linha.read<int>('alunoId'),
          nome: linha.read<String>('nome'),
          matricula: linha.readNullable<String>('matricula'),
          acertos: linha.read<int>('acertos'),
          nota: linha.read<double>('nota'),
        ),
    ],
  );

  /// Turmas dos alunos corrigidos na prova, separadas por vírgula (ver `formatarTurmas`).
  Stream<String?> observarTurmasDaProva(int provaId) => customSelect(
    '''
    SELECT GROUP_CONCAT(DISTINCT alunos.turma) AS turmas
    FROM resultados
    INNER JOIN alunos ON alunos.id = resultados.alunoId
    WHERE resultados.provaId = ?
    ''',
    variables: [Variable.withInt(provaId)],
    readsFrom: {resultados, alunos},
  ).watchSingle().map((linha) => linha.readNullable<String>('turmas'));

  /// Questões da prova como estão cadastradas agora, com a quantidade de alternativas de cada uma.
  Stream<List<QuestaoDaProva>> observarQuestoesDaProva(int provaId) => customSelect(
    '''
    SELECT questoes.id AS questaoId,
           questoes.ordem AS ordem,
           COUNT(alternativas.id) AS totalAlternativas
    FROM questoes
    LEFT JOIN alternativas ON alternativas.questaoId = questoes.id
    WHERE questoes.provaId = ?
    GROUP BY questoes.id
    ORDER BY questoes.ordem, questoes.id
    ''',
    variables: [Variable.withInt(provaId)],
    readsFrom: {questoes, alternativas},
  ).watch().map(
        (linhas) => [
      for (final linha in linhas)
        QuestaoDaProva(
          questaoId: linha.read<int>('questaoId'),
          ordem: linha.read<int>('ordem'),
          totalAlternativas: linha.read<int>('totalAlternativas'),
        ),
    ],
  );

  /// Respostas gravadas em todas as correções da prova, com o horário de cada correção.
  Stream<List<RespostaRegistrada>> observarRespostasDaProva(int provaId) => customSelect(
    '''
    SELECT respostas_aluno.questaoId AS questaoId,
           respostas_aluno.letrasMarcadas AS letrasMarcadas,
           respostas_aluno.letraCorreta AS letraCorreta,
           respostas_aluno.situacao AS situacao,
           resultados.corrigidoEm AS corrigidoEm
    FROM respostas_aluno
    INNER JOIN resultados ON resultados.id = respostas_aluno.resultadoId
    WHERE resultados.provaId = ?
    ''',
    variables: [Variable.withInt(provaId)],
    readsFrom: {respostasAluno, resultados},
  ).watch().map(
        (linhas) => [
      for (final linha in linhas)
        RespostaRegistrada(
          questaoId: linha.read<int>('questaoId'),
          letrasMarcadas: linha.read<String>('letrasMarcadas'),
          letraCorreta: linha.read<String>('letraCorreta'),
          situacao: SituacaoQuestao.deNome(linha.read<String>('situacao')),
          corrigidoEm: linha.read<int>('corrigidoEm'),
        ),
    ],
  );

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