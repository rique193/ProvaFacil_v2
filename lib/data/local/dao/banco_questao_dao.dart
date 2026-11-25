import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';

import '../app_database.dart';
import '../entity/banco_alternativa_entity.dart';
import '../entity/banco_questao_entity.dart';
import '../relation/banco_questao_com_alternativas.dart';

part 'banco_questao_dao.g.dart';

@DriftAccessor(tables: [BancoQuestoes, BancoAlternativas])
class BancoQuestaoDao extends DatabaseAccessor<AppDatabase> with _$BancoQuestaoDaoMixin {
  BancoQuestaoDao(super.attachedDatabase);

  Stream<List<BancoQuestaoComAlternativas>> observarQuestoes({String? disciplina}) {
    final filtro = disciplina?.trim();
    final queryQuestoes = select(bancoQuestoes)
      ..orderBy([
            (q) => OrderingTerm.desc(q.criadaEm),
            (q) => OrderingTerm.desc(q.id),
      ]);

    if (filtro != null && filtro.isNotEmpty) {
      queryQuestoes.where((q) => q.disciplina.equals(filtro));
    }

    final queryAlternativas = select(bancoAlternativas)
      ..orderBy([(a) => OrderingTerm.asc(a.ordem)]);

    return Rx.combineLatest2(
      queryQuestoes.watch(),
      queryAlternativas.watch(),
          (List<BancoQuestaoEntity> questoes, List<BancoAlternativaEntity> alternativas) {
        final porQuestao = <int, List<BancoAlternativaEntity>>{};
        for (final alt in alternativas) {
          porQuestao.putIfAbsent(alt.bancoQuestaoId, () => []).add(alt);
        }
        return questoes
            .map(
              (q) => BancoQuestaoComAlternativas(
            questao: q,
            alternativas: porQuestao[q.id] ?? const [],
          ),
        )
            .toList();
      },
    );
  }

  Future<BancoQuestaoComAlternativas?> buscarQuestao(int id) async {
    final questao = await (select(bancoQuestoes)..where((q) => q.id.equals(id))).getSingleOrNull();
    if (questao == null) return null;

    final alternativas = await (select(bancoAlternativas)
      ..where((a) => a.bancoQuestaoId.equals(id))
      ..orderBy([(a) => OrderingTerm.asc(a.ordem)]))
        .get();

    return BancoQuestaoComAlternativas(questao: questao, alternativas: alternativas);
  }

  Future<int> inserirQuestao(BancoQuestoesCompanion questao) => into(bancoQuestoes).insert(questao);

  Future<void> atualizarQuestao(int id, String disciplina, String enunciado) async {
    await (update(bancoQuestoes)..where((q) => q.id.equals(id))).write(
      BancoQuestoesCompanion(
        disciplina: Value(disciplina),
        enunciado: Value(enunciado),
      ),
    );
  }

  Future<void> substituirAlternativas(
      int bancoQuestaoId,
      List<BancoAlternativasCompanion> novasAlternativas,
      ) async {
    await (delete(bancoAlternativas)..where((a) => a.bancoQuestaoId.equals(bancoQuestaoId))).go();
    await batch((b) {
      b.insertAll(bancoAlternativas, novasAlternativas);
    });
  }

  Future<void> excluirQuestao(int id) =>
      (delete(bancoQuestoes)..where((q) => q.id.equals(id))).go();
}