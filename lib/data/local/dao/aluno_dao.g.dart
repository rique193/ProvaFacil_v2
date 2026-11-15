// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_dao.dart';

// ignore_for_file: type=lint
mixin _$AlunoDaoMixin on DatabaseAccessor<AppDatabase> {
  $AlunosTable get alunos => attachedDatabase.alunos;
  $ProvasTable get provas => attachedDatabase.provas;
  $ResultadosTable get resultados => attachedDatabase.resultados;
  AlunoDaoManager get managers => AlunoDaoManager(this);
}

class AlunoDaoManager {
  final _$AlunoDaoMixin _db;
  AlunoDaoManager(this._db);
  $$AlunosTableTableManager get alunos =>
      $$AlunosTableTableManager(_db.attachedDatabase, _db.alunos);
  $$ProvasTableTableManager get provas =>
      $$ProvasTableTableManager(_db.attachedDatabase, _db.provas);
  $$ResultadosTableTableManager get resultados =>
      $$ResultadosTableTableManager(_db.attachedDatabase, _db.resultados);
}
