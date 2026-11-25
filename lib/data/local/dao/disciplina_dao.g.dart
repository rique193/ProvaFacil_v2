// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disciplina_dao.dart';

// ignore_for_file: type=lint
mixin _$DisciplinaDaoMixin on DatabaseAccessor<AppDatabase> {
  $DisciplinasTable get disciplinas => attachedDatabase.disciplinas;
  DisciplinaDaoManager get managers => DisciplinaDaoManager(this);
}

class DisciplinaDaoManager {
  final _$DisciplinaDaoMixin _db;
  DisciplinaDaoManager(this._db);
  $$DisciplinasTableTableManager get disciplinas =>
      $$DisciplinasTableTableManager(_db.attachedDatabase, _db.disciplinas);
}
