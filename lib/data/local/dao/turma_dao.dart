import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/turma_entity.dart';

part 'turma_dao.g.dart';

@DriftAccessor(tables: [Turmas])
class TurmaDao extends DatabaseAccessor<AppDatabase> with _$TurmaDaoMixin {
  TurmaDao(super.attachedDatabase);

  Stream<List<TurmaEntity>> observarTodas() => select(turmas).watch();

  Future<List<TurmaEntity>> listarTodas() => select(turmas).get();

  Future<int> inserir(TurmasCompanion turma) => into(turmas).insert(turma);

  Future<void> excluir(int id) => (delete(turmas)..where((t) => t.id.equals(id))).go();
}