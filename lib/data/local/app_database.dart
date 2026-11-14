import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../domain/correcao/corretor_prova.dart';
import 'dao/aluno_dao.dart';
import 'dao/historico_dao.dart';
import 'dao/prova_dao.dart';
import 'dao/resultado_dao.dart';
import 'entity/alternativa_entity.dart';
import 'entity/aluno_entity.dart';
import 'entity/prova_entity.dart';
import 'entity/questao_entity.dart';
import 'entity/resposta_aluno_entity.dart';
import 'entity/resultado_entity.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Provas, Questoes, Alternativas, Alunos, Resultados, RespostasAluno],
  daos: [ProvaDao, ResultadoDao, AlunoDao, HistoricoDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? driftDatabase(name: 'provafacil'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (_) => customStatement('PRAGMA foreign_keys = ON'),
      );
}
