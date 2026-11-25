import 'package:drift/drift.dart';

import 'banco_questao_entity.dart';

@TableIndex(name: 'idx_banco_alternativas_questao', columns: {#bancoQuestaoId})
@DataClassName('BancoAlternativaEntity')
class BancoAlternativas extends Table {
  @override
  String get tableName => 'banco_alternativas';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get bancoQuestaoId =>
      integer().references(BancoQuestoes, #id, onDelete: KeyAction.cascade)();
  TextColumn get texto => text()();
  BoolColumn get correta => boolean().withDefault(const Constant(false))();
  IntColumn get ordem => integer()();
}