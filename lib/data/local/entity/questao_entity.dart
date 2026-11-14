import 'package:drift/drift.dart';

import 'prova_entity.dart';

@DataClassName('QuestaoEntity')
@TableIndex(name: 'index_questoes_provaId', columns: {#provaId})
class Questoes extends Table {
  @override
  String get tableName => 'questoes';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get provaId => integer().references(Provas, #id, onDelete: KeyAction.cascade)();
  TextColumn get enunciado => text()();
  IntColumn get ordem => integer()();
}
