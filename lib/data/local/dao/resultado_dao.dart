import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/aluno_entity.dart';
import '../entity/prova_entity.dart';
import '../entity/resposta_aluno_entity.dart';
import '../entity/resultado_entity.dart';
import '../relation/resultado_com_detalhes.dart';

part 'resultado_dao.g.dart';

@DriftAccessor(tables: [Provas, Alunos, Resultados, RespostasAluno])
class ResultadoDao extends DatabaseAccessor<AppDatabase>
    with _$ResultadoDaoMixin {
  ResultadoDao(super.attachedDatabase);

  Future<AlunoEntity?> buscarAluno(String nome, String turma) =>
      (select(alunos)
            ..where(
              (a) =>
                  a.nome.collate(Collate.noCase).equals(nome) &
                  a.turma.collate(Collate.noCase).equals(turma),
            )
            ..limit(1))
          .getSingleOrNull();

  Future<int> inserirAluno(Insertable<AlunoEntity> aluno) =>
      into(alunos).insert(aluno);

  Future<void> deletarResultadoDoAluno(int provaId, int alunoId) async {
    await (delete(resultados)
          ..where((r) => r.provaId.equals(provaId) & r.alunoId.equals(alunoId)))
        .go();
  }

  Future<int> inserirResultado(Insertable<ResultadoEntity> resultado) =>
      into(resultados).insert(resultado);

  Future<void> inserirRespostas(
    List<Insertable<RespostaAlunoEntity>> respostas,
  ) => batch((b) => b.insertAll(respostasAluno, respostas));

  Stream<ResultadoComDetalhes?> observarResultado(int resultadoId) {
    final consulta =
        select(resultados).join([
            innerJoin(alunos, alunos.id.equalsExp(resultados.alunoId)),
            innerJoin(provas, provas.id.equalsExp(resultados.provaId)),
            leftOuterJoin(
              respostasAluno,
              respostasAluno.resultadoId.equalsExp(resultados.id),
            ),
          ])
          ..where(resultados.id.equals(resultadoId))
          ..orderBy([
            OrderingTerm.asc(respostasAluno.numeroQuestao),
            OrderingTerm.asc(respostasAluno.id),
          ]);
    return consulta.watch().map((linhas) {
      if (linhas.isEmpty) return null;
      final primeira = linhas.first;
      return ResultadoComDetalhes(
        resultado: primeira.readTable(resultados),
        aluno: primeira.readTable(alunos),
        prova: primeira.readTable(provas),
        respostas: [
          for (final linha in linhas) ?linha.readTableOrNull(respostasAluno),
        ],
      );
    });
  }

  Stream<List<ResultadoComAluno>> observarResultadosDaProva(int provaId) {
    final consulta =
        select(resultados)
            .join([innerJoin(alunos, alunos.id.equalsExp(resultados.alunoId))])
          ..where(resultados.provaId.equals(provaId))
          ..orderBy([
            OrderingTerm(expression: alunos.nome.collate(Collate.noCase)),
          ]);
    return consulta.watch().map(
      (linhas) => [
        for (final linha in linhas)
          ResultadoComAluno(
            resultado: linha.readTable(resultados),
            aluno: linha.readTable(alunos),
          ),
      ],
    );
  }
}
