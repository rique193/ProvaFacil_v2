import 'package:drift/drift.dart';

@DataClassName('BancoQuestaoEntity')
class BancoQuestoes extends Table {
  @override
  String get tableName => 'banco_questoes';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get disciplina => text()();
  TextColumn get enunciado => text()();
  IntColumn get criadaEm => integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();
}