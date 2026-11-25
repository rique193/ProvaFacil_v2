import 'package:drift/drift.dart';

@DataClassName('DisciplinaEntity')
class Disciplinas extends Table {
  @override
  String get tableName => 'disciplinas';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().customConstraint('NOT NULL UNIQUE COLLATE NOCASE')();
  IntColumn get criadaEm => integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();
}