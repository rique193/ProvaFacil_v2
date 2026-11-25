import 'package:drift/drift.dart';

@DataClassName('TurmaEntity')
class Turmas extends Table {
  @override
  String get tableName => 'turmas';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().customConstraint('NOT NULL UNIQUE COLLATE NOCASE')();
  IntColumn get criadaEm => integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();
}