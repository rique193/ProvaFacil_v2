// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prova_dao.dart';

// ignore_for_file: type=lint
mixin _$ProvaDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProvasTable get provas => attachedDatabase.provas;
  $QuestoesTable get questoes => attachedDatabase.questoes;
  $AlternativasTable get alternativas => attachedDatabase.alternativas;
  ProvaDaoManager get managers => ProvaDaoManager(this);
}

class ProvaDaoManager {
  final _$ProvaDaoMixin _db;
  ProvaDaoManager(this._db);
  $$ProvasTableTableManager get provas =>
      $$ProvasTableTableManager(_db.attachedDatabase, _db.provas);
  $$QuestoesTableTableManager get questoes =>
      $$QuestoesTableTableManager(_db.attachedDatabase, _db.questoes);
  $$AlternativasTableTableManager get alternativas =>
      $$AlternativasTableTableManager(_db.attachedDatabase, _db.alternativas);
}
