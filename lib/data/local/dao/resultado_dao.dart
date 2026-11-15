import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/aluno_entity.dart';
import '../entity/prova_entity.dart';
import '../entity/resposta_aluno_entity.dart';
import '../entity/resultado_entity.dart';
import '../relation/resultado_com_detalhes.dart';

part 'resultado_dao.g.dart';

@DriftAccessor(tables: [Provas, Alunos, Resultados, RespostasAluno])
class ResultadoDao extends DatabaseAccessor<AppDatabase> with _$ResultadoDaoMixin {
  ResultadoDao(super.attachedDatabase);

  Future<AlunoEntity?> buscarAluno(String nome, String turma) => throw UnimplementedError();

  Future<int> inserirAluno(Insertable<AlunoEntity> aluno) => throw UnimplementedError();

  Future<void> deletarResultadoDoAluno(int provaId, int alunoId) => throw UnimplementedError();

  Future<int> inserirResultado(Insertable<ResultadoEntity> resultado) => throw UnimplementedError();

  Future<void> inserirRespostas(List<Insertable<RespostaAlunoEntity>> respostas) =>
      throw UnimplementedError();

  Stream<ResultadoComDetalhes?> observarResultado(int resultadoId) => throw UnimplementedError();

  Stream<List<ResultadoComAluno>> observarResultadosDaProva(int provaId) =>
      throw UnimplementedError();
}
