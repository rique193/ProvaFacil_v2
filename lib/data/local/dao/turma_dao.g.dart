// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turma_dao.dart';

// ignore_for_file: type=lint
mixin _$TurmaDaoMixin on DatabaseAccessor<AppDatabase> {
  $TurmasTable get turmas => attachedDatabase.turmas;
  TurmaDaoManager get managers => TurmaDaoManager(this);
}

class TurmaDaoManager {
  final _$TurmaDaoMixin _db;
  TurmaDaoManager(this._db);
  $$TurmasTableTableManager get turmas =>
      $$TurmasTableTableManager(_db.attachedDatabase, _db.turmas);
}
