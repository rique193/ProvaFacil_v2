import 'package:drift/drift.dart';

/// Aluno identificado por nome + turma. A matrícula é única ignorando maiúsculas/minúsculas
/// (`COLLATE NOCASE` na coluna vale também para o índice).
@DataClassName('AlunoEntity')
@TableIndex(name: 'index_alunos_nome_turma', columns: {#nome, #turma}, unique: true)
@TableIndex(name: 'index_alunos_matricula', columns: {#matricula}, unique: true)
class Alunos extends Table {
  @override
  String get tableName => 'alunos';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text()();
  TextColumn get turma => text().withDefault(const Constant(''))();
  TextColumn get matricula => text().nullable().customConstraint('COLLATE NOCASE')();
  TextColumn get email => text().nullable()();
}
