import 'package:drift/drift.dart';

import 'questao_entity.dart';

@DataClassName('AlternativaEntity')
@TableIndex(name: 'index_alternativas_questaoId', columns: {#questaoId})
class Alternativas extends Table {
  @override
  String get tableName => 'alternativas';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get questaoId => integer().references(Questoes, #id, onDelete: KeyAction.cascade)();
  TextColumn get texto => text()();
  BoolColumn get correta => boolean()();
  IntColumn get ordem => integer()();
}
