// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banco_questao_dao.dart';

// ignore_for_file: type=lint
mixin _$BancoQuestaoDaoMixin on DatabaseAccessor<AppDatabase> {
  $BancoQuestoesTable get bancoQuestoes => attachedDatabase.bancoQuestoes;
  $BancoAlternativasTable get bancoAlternativas =>
      attachedDatabase.bancoAlternativas;
  BancoQuestaoDaoManager get managers => BancoQuestaoDaoManager(this);
}

class BancoQuestaoDaoManager {
  final _$BancoQuestaoDaoMixin _db;
  BancoQuestaoDaoManager(this._db);
  $$BancoQuestoesTableTableManager get bancoQuestoes =>
      $$BancoQuestoesTableTableManager(_db.attachedDatabase, _db.bancoQuestoes);
  $$BancoAlternativasTableTableManager get bancoAlternativas =>
      $$BancoAlternativasTableTableManager(
        _db.attachedDatabase,
        _db.bancoAlternativas,
      );
}
