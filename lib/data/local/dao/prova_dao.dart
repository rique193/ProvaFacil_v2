import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entity/alternativa_entity.dart';
import '../entity/prova_entity.dart';
import '../entity/questao_entity.dart';
import '../relation/prova_com_questoes.dart';
import '../relation/questao_com_alternativas.dart';

part 'prova_dao.g.dart';

@DriftAccessor(tables: [Provas, Questoes, Alternativas])
class ProvaDao extends DatabaseAccessor<AppDatabase> with _$ProvaDaoMixin {
  ProvaDao(super.attachedDatabase);

  Stream<List<ProvaComQuestoes>> observarProvas() => _consultarProvas().watch().map(_agruparProvas);

  Stream<ProvaComQuestoes?> observarProva(int provaId) =>
      _consultarProvas(provaId: provaId)
          .watch()
          .map((linhas) => _agruparProvas(linhas).firstOrNull);

  /// Leitura pontual (não observável), usada ao salvar o conteúdo de uma prova existente.
  Future<List<QuestaoComAlternativas>> listarQuestoesComAlternativas(int provaId) async {
    final consulta =
        select(questoes)
            .join([leftOuterJoin(alternativas, alternativas.questaoId.equalsExp(questoes.id))])
          ..where(questoes.provaId.equals(provaId))
          ..orderBy([
            OrderingTerm.asc(questoes.ordem),
            OrderingTerm.asc(questoes.id),
            OrderingTerm.asc(alternativas.id),
          ]);
    final porQuestao = <int, (QuestaoEntity, List<AlternativaEntity>)>{};
    for (final linha in await consulta.get()) {
      final questao = linha.readTable(questoes);
      final grupo = porQuestao.putIfAbsent(questao.id, () => (questao, []));
      final alternativa = linha.readTableOrNull(alternativas);
      if (alternativa != null) grupo.$2.add(alternativa);
    }
    return [
      for (final (questao, alternativas) in porQuestao.values)
        QuestaoComAlternativas(questao: questao, alternativas: alternativas),
    ];
  }

  Future<int> inserirProva(Insertable<ProvaEntity> prova) => into(provas).insert(prova);

  Future<int> atualizarProva(int provaId, String titulo, String disciplina, String descricao) =>
      (update(provas)..where((p) => p.id.equals(provaId))).write(
        ProvasCompanion(
          titulo: Value(titulo),
          disciplina: Value(disciplina),
          descricao: Value(descricao),
        ),
      );

  Future<void> deletarProva(ProvaEntity prova) => delete(provas).delete(prova);

  Future<int> inserirQuestao(Insertable<QuestaoEntity> questao) => into(questoes).insert(questao);

  Future<void> atualizarEnunciadoDaQuestao(int questaoId, String enunciado, int ordem) =>
      (update(questoes)..where((q) => q.id.equals(questaoId))).write(
        QuestoesCompanion(enunciado: Value(enunciado), ordem: Value(ordem)),
      );

  Future<void> deletarQuestaoPorId(int questaoId) =>
      (delete(questoes)..where((q) => q.id.equals(questaoId))).go();

  Future<void> inserirAlternativas(List<Insertable<AlternativaEntity>> alternativas) =>
      batch((b) => b.insertAll(this.alternativas, alternativas));

  Future<void> atualizarTextoDaAlternativa(int alternativaId, String texto, int ordem) =>
      (update(alternativas)..where((a) => a.id.equals(alternativaId))).write(
        AlternativasCompanion(texto: Value(texto), ordem: Value(ordem)),
      );

  Future<void> deletarAlternativaPorId(int alternativaId) =>
      (delete(alternativas)..where((a) => a.id.equals(alternativaId))).go();

  Future<void> limparAlternativaCorretaDaQuestao(int questaoId) =>
      (update(alternativas)..where((a) => a.questaoId.equals(questaoId))).write(
        const AlternativasCompanion(correta: Value(false)),
      );

  Future<void> marcarAlternativaComoCorreta(int alternativaId) =>
      (update(alternativas)..where((a) => a.id.equals(alternativaId))).write(
        const AlternativasCompanion(correta: Value(true)),
      );

  /// Uma consulta só (prova + questões + alternativas) para o stream observar as 3 tabelas e
  /// emitir a prova sempre completa.
  JoinedSelectStatement<HasResultSet, dynamic> _consultarProvas({int? provaId}) {
    final consulta = select(provas).join([
      leftOuterJoin(questoes, questoes.provaId.equalsExp(provas.id)),
      leftOuterJoin(alternativas, alternativas.questaoId.equalsExp(questoes.id)),
    ]);
    if (provaId != null) consulta.where(provas.id.equals(provaId));
    consulta.orderBy([
      OrderingTerm.desc(provas.criadaEm),
      OrderingTerm.desc(provas.id),
      OrderingTerm.asc(questoes.id),
      OrderingTerm.asc(alternativas.id),
    ]);
    return consulta;
  }

  List<ProvaComQuestoes> _agruparProvas(List<TypedResult> linhas) {
    final porProva = <int, (ProvaEntity, Map<int, (QuestaoEntity, List<AlternativaEntity>)>)>{};
    for (final linha in linhas) {
      final prova = linha.readTable(provas);
      final questoesDaProva = porProva.putIfAbsent(prova.id, () => (prova, {})).$2;
      final questao = linha.readTableOrNull(questoes);
      if (questao == null) continue;
      final alternativasDaQuestao = questoesDaProva.putIfAbsent(questao.id, () => (questao, [])).$2;
      final alternativa = linha.readTableOrNull(alternativas);
      if (alternativa != null) alternativasDaQuestao.add(alternativa);
    }
    return [
      for (final (prova, questoesDaProva) in porProva.values)
        ProvaComQuestoes(
          prova: prova,
          questoes: [
            for (final (questao, alternativas) in questoesDaProva.values)
              QuestaoComAlternativas(questao: questao, alternativas: alternativas),
          ],
        ),
    ];
  }
}
