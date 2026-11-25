import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/disciplina_entity.dart';

part 'disciplina_dao.g.dart';

@DriftAccessor(tables: [Disciplinas])
class DisciplinaDao extends DatabaseAccessor<AppDatabase> with _$DisciplinaDaoMixin {
  DisciplinaDao(super.attachedDatabase);

  Stream<List<DisciplinaEntity>> observarTodas() => select(disciplinas).watch();

  Future<List<DisciplinaEntity>> listarTodas() => select(disciplinas).get();

  Future<int> inserir(DisciplinasCompanion disciplina) => into(disciplinas).insert(disciplina);

  Future<void> excluir(int id) => (delete(disciplinas)..where((d) => d.id.equals(id))).go();
}