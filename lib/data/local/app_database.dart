import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../domain/correcao/corretor_prova.dart';
import 'dao/aluno_dao.dart';
import 'dao/banco_questao_dao.dart';
import 'dao/disciplina_dao.dart';
import 'dao/historico_dao.dart';
import 'dao/prova_dao.dart';
import 'dao/resultado_dao.dart';
import 'dao/turma_dao.dart';
import 'entity/alternativa_entity.dart';
import 'entity/aluno_entity.dart';
import 'entity/banco_alternativa_entity.dart';
import 'entity/banco_questao_entity.dart';
import 'entity/disciplina_entity.dart';
import 'entity/prova_entity.dart';
import 'entity/questao_entity.dart';
import 'entity/resposta_aluno_entity.dart';
import 'entity/resultado_entity.dart';
import 'entity/turma_entity.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Provas,
    Questoes,
    Alternativas,
    Alunos,
    Resultados,
    RespostasAluno,
    Turmas,
    Disciplinas,
    BancoQuestoes,
    BancoAlternativas,
  ],
  daos: [
    ProvaDao,
    ResultadoDao,
    AlunoDao,
    HistoricoDao,
    TurmaDao,
    DisciplinaDao,
    BancoQuestaoDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? driftDatabase(name: 'provafacil'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(turmas);
        await m.createTable(disciplinas);
        await m.createTable(bancoQuestoes);
        await m.createTable(bancoAlternativas);
        await m.createIndex(idxBancoAlternativasQuestao);
        await m.addColumn(provas, provas.turma);
      }
    },
    beforeOpen: (_) => customStatement('PRAGMA foreign_keys = ON'),
  );
}