import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/aluno_entity.dart';
import '../entity/resultado_entity.dart';

part 'aluno_dao.g.dart';

@DriftAccessor(tables: [Alunos, Resultados])
class AlunoDao extends DatabaseAccessor<AppDatabase> with _$AlunoDaoMixin {
  AlunoDao(super.attachedDatabase);

  Stream<List<AlunoEntity>> observarAlunos() => customSelect(
    'SELECT * FROM alunos ORDER BY turma COLLATE NOCASE, nome COLLATE NOCASE',
    readsFrom: {alunos},
  ).watch().map((linhas) => [for (final linha in linhas) alunos.map(linha.data)]);

  Future<AlunoEntity?> buscarPorId(int alunoId) =>
      (select(alunos)..where((a) => a.id.equals(alunoId))).getSingleOrNull();

  /// Mesma busca da correção (nome + turma ignorando maiúsculas), para os dois fluxos acharem o mesmo aluno.
  Future<AlunoEntity?> buscarPorNomeETurma(String nome, String turma) => _buscarUm(
    'SELECT * FROM alunos WHERE nome = ? COLLATE NOCASE AND turma = ? COLLATE NOCASE LIMIT 1',
    [Variable.withString(nome), Variable.withString(turma)],
  );

  Future<AlunoEntity?> buscarPorMatricula(String matricula) => _buscarUm(
    'SELECT * FROM alunos WHERE matricula = ? COLLATE NOCASE LIMIT 1',
    [Variable.withString(matricula)],
  );

  Future<int> inserirAluno(Insertable<AlunoEntity> aluno) => into(alunos).insert(aluno);

  Future<void> completarAluno(int alunoId, String? matricula, String? email) =>
      (update(alunos)..where((a) => a.id.equals(alunoId))).write(
        AlunosCompanion(matricula: Value(matricula), email: Value(email)),
      );

  Future<void> atualizarAluno(
    int alunoId,
    String nome,
    String turma,
    String? matricula,
    String? email,
  ) => (update(alunos)..where((a) => a.id.equals(alunoId))).write(
    AlunosCompanion(
      nome: Value(nome),
      turma: Value(turma),
      matricula: Value(matricula),
      email: Value(email),
    ),
  );

  /// Apaga o aluno; os resultados e as respostas dele são apagados em cascata pelas chaves estrangeiras.
  Future<void> deletarAluno(int alunoId) =>
      (delete(alunos)..where((a) => a.id.equals(alunoId))).go();

  /// Provas em que o aluno tem resultado (para remover os documentos da nuvem antes da exclusão).
  Future<List<int>> listarProvasDoAluno(int alunoId) => customSelect(
    'SELECT provaId FROM resultados WHERE alunoId = ? ORDER BY provaId',
    variables: [Variable.withInt(alunoId)],
    readsFrom: {resultados},
  ).map((linha) => linha.read<int>('provaId')).get();

  Future<int> contarResultadosDoAluno(int alunoId) => customSelect(
    'SELECT COUNT(*) AS total FROM resultados WHERE alunoId = ?',
    variables: [Variable.withInt(alunoId)],
    readsFrom: {resultados},
  ).map((linha) => linha.read<int>('total')).getSingle();

  Future<AlunoEntity?> _buscarUm(String sql, List<Variable> variaveis) => customSelect(
    sql,
    variables: variaveis,
    readsFrom: {alunos},
  ).map((linha) => alunos.map(linha.data)).getSingleOrNull();
}
