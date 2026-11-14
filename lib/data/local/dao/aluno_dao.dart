import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/aluno_entity.dart';
import '../entity/resultado_entity.dart';

part 'aluno_dao.g.dart';

@DriftAccessor(tables: [Alunos, Resultados])
class AlunoDao extends DatabaseAccessor<AppDatabase> with _$AlunoDaoMixin {
  AlunoDao(super.attachedDatabase);

  Stream<List<AlunoEntity>> observarAlunos() => throw UnimplementedError();

  Future<AlunoEntity?> buscarPorId(int alunoId) => throw UnimplementedError();

  /// Mesma busca da correção (nome + turma ignorando maiúsculas), para os dois fluxos acharem o mesmo aluno.
  Future<AlunoEntity?> buscarPorNomeETurma(String nome, String turma) => throw UnimplementedError();

  Future<AlunoEntity?> buscarPorMatricula(String matricula) => throw UnimplementedError();

  Future<int> inserirAluno(Insertable<AlunoEntity> aluno) => throw UnimplementedError();

  Future<void> completarAluno(int alunoId, String? matricula, String? email) =>
      throw UnimplementedError();

  Future<void> atualizarAluno(
    int alunoId,
    String nome,
    String turma,
    String? matricula,
    String? email,
  ) =>
      throw UnimplementedError();

  /// Apaga o aluno; os resultados e as respostas dele são apagados em cascata pelas chaves estrangeiras.
  Future<void> deletarAluno(int alunoId) => throw UnimplementedError();

  /// Provas em que o aluno tem resultado (para remover os documentos da nuvem antes da exclusão).
  Future<List<int>> listarProvasDoAluno(int alunoId) => throw UnimplementedError();

  Future<int> contarResultadosDoAluno(int alunoId) => throw UnimplementedError();
}
