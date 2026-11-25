import 'package:drift/drift.dart';

@DataClassName('ProvaEntity')
class Provas extends Table {
  @override
  String get tableName => 'provas';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get titulo => text()();
  TextColumn get disciplina => text()();
  TextColumn get descricao => text().withDefault(const Constant(''))();
  IntColumn get criadaEm => integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();
  TextColumn get turma => text().withDefault(const Constant(''))();
}