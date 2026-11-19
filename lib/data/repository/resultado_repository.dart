import 'dart:developer';

import 'package:drift/drift.dart';

import '../backup/backup_resultados.dart';
import '../local/app_database.dart';
import '../local/relation/questao_com_alternativas.dart';
import '../local/relation/resultado_com_detalhes.dart';
import '../../domain/correcao/corretor_prova.dart';
import '../../domain/correcao/fluxo_correcao.dart';
import 'backup_nuvem_repository.dart';
import 'gabarito_mapper.dart';

class ResultadoRepository {
  ResultadoRepository(
    this._database, {
    this._backup = BackupResultados.desativado,
  });
  final AppDatabase _database;
  final BackupResultados _backup;

  Future<int> corrigirESalvar({
    required int provaId,
    required String nomeAluno,
    required String turma,
    required Map<int, Set<String>> respostasLidas,
    double notaMaxima = CorretorProva.notaMaximaPadrao,
  }) async {
    final id = await _database.transaction(() async {
      final nome = _normalizar(nomeAluno);
      final turmaNormalizada = _normalizar(turma);
      if (nome.isEmpty) throw ArgumentError('Informe o nome do aluno.');
      final questoes = await listarQuestoes(provaId);
      if (questoes.isEmpty) {
        throw ArgumentError('Esta prova não tem questões cadastradas.');
      }
      final correcao = FluxoCorrecao.corrigir(
        questoes.paraCorrecao(provaId),
        respostasLidas,
        notaMaxima: notaMaxima,
      );
      final dao = _database.resultadoDao;
      final aluno = await dao.buscarAluno(nome, turmaNormalizada);
      final alunoId =
          aluno?.id ??
          await dao.inserirAluno(
            AlunosCompanion.insert(nome: nome, turma: Value(turmaNormalizada)),
          );
      await dao.deletarResultadoDoAluno(provaId, alunoId);
      final resultadoId = await dao.inserirResultado(
        ResultadosCompanion.insert(
          provaId: provaId,
          alunoId: alunoId,
          totalQuestoes: correcao.totalQuestoes,
          acertos: correcao.acertos,
          erros: correcao.erros,
          emBranco: correcao.emBranco,
          nota: correcao.nota,
          notaMaxima: correcao.notaMaxima,
        ),
      );
      await dao.inserirRespostas([
        for (final q in correcao.questoes)
          RespostasAlunoCompanion.insert(
            resultadoId: resultadoId,
            questaoId: q.questaoId,
            numeroQuestao: q.numero,
            letrasMarcadas: (q.letrasMarcadas.toList()..sort()).join(),
            letraCorreta: q.letraCorreta,
            situacao: q.situacao,
          ),
      ]);
      return resultadoId;
    });
    try {
      await BackupNuvemRepository(_database, _backup).enviarResultado(id);
    } catch (e, stack) {
      log(
        'Não foi possível enviar o resultado para a nuvem.',
        name: 'ResultadoRepository',
        error: e,
        stackTrace: stack,
      );
    }
    return id;
  }

  Stream<ResultadoComDetalhes?> observarResultado(int resultadoId) =>
      _database.resultadoDao.observarResultado(resultadoId);
  Stream<List<ResultadoComAluno>> observarResultadosDaProva(int provaId) =>
      _database.resultadoDao.observarResultadosDaProva(provaId);
  Future<List<QuestaoComAlternativas>> listarQuestoes(int provaId) async =>
      [...await _database.provaDao.listarQuestoesComAlternativas(provaId)]
        ..sort((a, b) {
          final ordem = a.questao.ordem.compareTo(b.questao.ordem);
          return ordem != 0 ? ordem : a.questao.id.compareTo(b.questao.id);
        });
  static String _normalizar(String texto) =>
      texto.trim().replaceAll(RegExp(r'\s+'), ' ');
}
