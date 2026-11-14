// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado_dao.dart';

// ignore_for_file: type=lint
mixin _$ResultadoDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProvasTable get provas => attachedDatabase.provas;
  $AlunosTable get alunos => attachedDatabase.alunos;
  $ResultadosTable get resultados => attachedDatabase.resultados;
  $QuestoesTable get questoes => attachedDatabase.questoes;
  $RespostasAlunoTable get respostasAluno => attachedDatabase.respostasAluno;
  ResultadoDaoManager get managers => ResultadoDaoManager(this);
}

class ResultadoDaoManager {
  final _$ResultadoDaoMixin _db;
  ResultadoDaoManager(this._db);
  $$ProvasTableTableManager get provas =>
      $$ProvasTableTableManager(_db.attachedDatabase, _db.provas);
  $$AlunosTableTableManager get alunos =>
      $$AlunosTableTableManager(_db.attachedDatabase, _db.alunos);
  $$ResultadosTableTableManager get resultados =>
      $$ResultadosTableTableManager(_db.attachedDatabase, _db.resultados);
  $$QuestoesTableTableManager get questoes =>
      $$QuestoesTableTableManager(_db.attachedDatabase, _db.questoes);
  $$RespostasAlunoTableTableManager get respostasAluno =>
      $$RespostasAlunoTableTableManager(
        _db.attachedDatabase,
        _db.respostasAluno,
      );
}
