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
import '../relation/progresso_prova.dart';

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

  /// Para cada prova, o total de resultados e o de alunos da turma dela (`provas.turma`, sem
  /// diferenciar maiúsculas). Atualiza sozinho quando uma correção é salva ou um aluno muda.
  Stream<List<ProgressoProva>> observarProgressoProvas() => customSelect(
    '''
    SELECT provas.id AS provaId,
           (SELECT COUNT(*) FROM resultados WHERE resultados.provaId = provas.id) AS totalCorrigidos,
           CASE WHEN TRIM(provas.turma) = '' THEN 0 ELSE
             (SELECT COUNT(*) FROM alunos
              WHERE TRIM(alunos.turma) = TRIM(provas.turma) COLLATE NOCASE)
           END AS totalAlunosTurma
    FROM provas
    ORDER BY provas.id
    ''',
    readsFrom: {provas, resultados, alunos},
  ).watch().map(
    (linhas) => [
      for (final linha in linhas)
        ProgressoProva(
          provaId: linha.read<int>('provaId'),
          totalAlunosTurma: linha.read<int>('totalAlunosTurma'),
          totalCorrigidos: linha.read<int>('totalCorrigidos'),
        ),
    ],
  );

  /// Alunos da turma da prova que ainda não têm resultado nela, em ordem alfabética.
  Stream<List<AlunoEntity>> observarAlunosPendentes(int provaId) => customSelect(
    '''
    SELECT alunos.* FROM alunos
    INNER JOIN provas ON provas.id = ?
    WHERE TRIM(provas.turma) <> ''
      AND TRIM(alunos.turma) = TRIM(provas.turma) COLLATE NOCASE
      AND NOT EXISTS (
        SELECT 1 FROM resultados
        WHERE resultados.provaId = provas.id AND resultados.alunoId = alunos.id
      )
    ORDER BY alunos.nome COLLATE NOCASE
    ''',
    variables: [Variable.withInt(provaId)],
    readsFrom: {provas, resultados, alunos},
  ).watch().map((linhas) => [for (final linha in linhas) alunos.map(linha.data)]);

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
  Future<List<ResultadoExportacao>> listarResultadosParaExportacao(int provaId) => customSelect(
    '''
    SELECT alunos.nome AS nome,
           alunos.matricula AS matricula,
           alunos.turma AS turma,
           resultados.acertos AS acertos,
           resultados.erros AS erros,
           resultados.emBranco AS emBranco,
           resultados.nota AS nota
    FROM resultados
    INNER JOIN alunos ON alunos.id = resultados.alunoId
    WHERE resultados.provaId = ?
    ORDER BY alunos.nome COLLATE NOCASE
    ''',
    variables: [Variable.withInt(provaId)],
    readsFrom: {resultados, alunos},
  ).map(
    (linha) => ResultadoExportacao(
      nome: linha.read<String>('nome'),
      matricula: linha.readNullable<String>('matricula'),
      turma: linha.read<String>('turma'),
      acertos: linha.read<int>('acertos'),
      erros: linha.read<int>('erros'),
      emBranco: linha.read<int>('emBranco'),
      nota: linha.read<double>('nota'),
    ),
  ).get();

  /// Todos os alunos, para o envio à nuvem (inclui os criados pela correção).
  Future<List<AlunoEntity>> listarAlunosParaBackup() =>
      (select(alunos)..orderBy([(a) => OrderingTerm.asc(a.id)])).get();

  /// Todos os resultados gravados, com a prova e o aluno, para o envio à nuvem.
  Future<List<LinhaResultadoBackup>> listarResultadosParaBackup() => customSelect(
    '''
    $_colunasResultadoBackup
    ORDER BY resultados.id
    ''',
    readsFrom: {resultados, provas, alunos},
  ).map(_linhaResultadoBackup).get();

  /// Um resultado gravado, com a prova e o aluno, para o envio à nuvem logo após a correção.
  Future<LinhaResultadoBackup?> buscarResultadoParaBackup(int resultadoId) => customSelect(
    '''
    $_colunasResultadoBackup
    WHERE resultados.id = ?
    ''',
    variables: [Variable.withInt(resultadoId)],
    readsFrom: {resultados, provas, alunos},
  ).map(_linhaResultadoBackup).getSingleOrNull();

  /// Respostas de um resultado gravado, para o envio à nuvem logo após a correção.
  Future<List<LinhaRespostaBackup>> listarRespostasDoResultadoParaBackup(int resultadoId) =>
      customSelect(
        '''
        $_colunasRespostaBackup
        WHERE resultadoId = ?
        ''',
        variables: [Variable.withInt(resultadoId)],
        readsFrom: {respostasAluno},
      ).map(_linhaRespostaBackup).get();

  /// Respostas de todos os resultados gravados, para o envio à nuvem.
  Future<List<LinhaRespostaBackup>> listarRespostasParaBackup() => customSelect(
    _colunasRespostaBackup,
    readsFrom: {respostasAluno},
  ).map(_linhaRespostaBackup).get();

  static const _colunasResultadoBackup = '''
    SELECT resultados.id AS resultadoId,
           provas.id AS provaId,
           provas.titulo AS tituloProva,
           provas.disciplina AS disciplina,
           alunos.id AS alunoId,
           alunos.nome AS nomeAluno,
           alunos.turma AS turma,
           alunos.matricula AS matricula,
           resultados.totalQuestoes AS totalQuestoes,
           resultados.acertos AS acertos,
           resultados.erros AS erros,
           resultados.emBranco AS emBranco,
           resultados.nota AS nota,
           resultados.notaMaxima AS notaMaxima,
           resultados.corrigidoEm AS corrigidoEm
    FROM resultados
    INNER JOIN provas ON provas.id = resultados.provaId
    INNER JOIN alunos ON alunos.id = resultados.alunoId
    ''';

  static const _colunasRespostaBackup = '''
    SELECT resultadoId, questaoId, numeroQuestao, letrasMarcadas, letraCorreta, situacao
    FROM respostas_aluno
    ''';

  static LinhaResultadoBackup _linhaResultadoBackup(QueryRow linha) => LinhaResultadoBackup(
    resultadoId: linha.read<int>('resultadoId'),
    provaId: linha.read<int>('provaId'),
    tituloProva: linha.read<String>('tituloProva'),
    disciplina: linha.read<String>('disciplina'),
    alunoId: linha.read<int>('alunoId'),
    nomeAluno: linha.read<String>('nomeAluno'),
    turma: linha.read<String>('turma'),
    matricula: linha.readNullable<String>('matricula'),
    totalQuestoes: linha.read<int>('totalQuestoes'),
    acertos: linha.read<int>('acertos'),
    erros: linha.read<int>('erros'),
    emBranco: linha.read<int>('emBranco'),
    nota: linha.read<double>('nota'),
    notaMaxima: linha.read<double>('notaMaxima'),
    corrigidoEm: linha.read<int>('corrigidoEm'),
  );

  static LinhaRespostaBackup _linhaRespostaBackup(QueryRow linha) => LinhaRespostaBackup(
    resultadoId: linha.read<int>('resultadoId'),
    questaoId: linha.read<int>('questaoId'),
    numeroQuestao: linha.read<int>('numeroQuestao'),
    letrasMarcadas: linha.read<String>('letrasMarcadas'),
    letraCorreta: linha.read<String>('letraCorreta'),
    situacao: SituacaoQuestao.deNome(linha.read<String>('situacao')),
  );
}
