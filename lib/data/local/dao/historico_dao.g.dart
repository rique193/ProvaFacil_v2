// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_dao.dart';

// ignore_for_file: type=lint
mixin _$HistoricoDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProvasTable get provas => attachedDatabase.provas;
  $QuestoesTable get questoes => attachedDatabase.questoes;
  $AlternativasTable get alternativas => attachedDatabase.alternativas;
  $AlunosTable get alunos => attachedDatabase.alunos;
  $ResultadosTable get resultados => attachedDatabase.resultados;
  $RespostasAlunoTable get respostasAluno => attachedDatabase.respostasAluno;
  HistoricoDaoManager get managers => HistoricoDaoManager(this);
}

class HistoricoDaoManager {
  final _$HistoricoDaoMixin _db;
  HistoricoDaoManager(this._db);
  $$ProvasTableTableManager get provas =>
      $$ProvasTableTableManager(_db.attachedDatabase, _db.provas);
  $$QuestoesTableTableManager get questoes =>
      $$QuestoesTableTableManager(_db.attachedDatabase, _db.questoes);
  $$AlternativasTableTableManager get alternativas =>
      $$AlternativasTableTableManager(_db.attachedDatabase, _db.alternativas);
  $$AlunosTableTableManager get alunos =>
      $$AlunosTableTableManager(_db.attachedDatabase, _db.alunos);
  $$ResultadosTableTableManager get resultados =>
      $$ResultadosTableTableManager(_db.attachedDatabase, _db.resultados);
  $$RespostasAlunoTableTableManager get respostasAluno =>
      $$RespostasAlunoTableTableManager(
        _db.attachedDatabase,
        _db.respostasAluno,
      );
}
