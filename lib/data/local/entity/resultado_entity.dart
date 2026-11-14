import 'package:drift/drift.dart';

import 'aluno_entity.dart';
import 'prova_entity.dart';

@DataClassName('ResultadoEntity')
@TableIndex(name: 'index_resultados_provaId_alunoId', columns: {#provaId, #alunoId}, unique: true)
@TableIndex(name: 'index_resultados_alunoId', columns: {#alunoId})
class Resultados extends Table {
  @override
  String get tableName => 'resultados';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get provaId => integer().references(Provas, #id, onDelete: KeyAction.cascade)();
  IntColumn get alunoId => integer().references(Alunos, #id, onDelete: KeyAction.cascade)();
  IntColumn get totalQuestoes => integer()();
  IntColumn get acertos => integer()();

  /// Respostas erradas + marcações múltiplas (anuladas).
  IntColumn get erros => integer()();
  IntColumn get emBranco => integer()();
  RealColumn get nota => real()();
  RealColumn get notaMaxima => real()();
  IntColumn get corrigidoEm => integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();
}
