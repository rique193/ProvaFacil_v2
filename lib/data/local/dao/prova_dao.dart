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

  Stream<List<ProvaComQuestoes>> observarProvas() => throw UnimplementedError();

  Stream<ProvaComQuestoes?> observarProva(int provaId) => throw UnimplementedError();

  /// Leitura pontual (não observável), usada ao salvar o conteúdo de uma prova existente.
  Future<List<QuestaoComAlternativas>> listarQuestoesComAlternativas(int provaId) =>
      throw UnimplementedError();

  Future<int> inserirProva(Insertable<ProvaEntity> prova) => throw UnimplementedError();

  Future<int> atualizarProva(int provaId, String titulo, String disciplina, String descricao) =>
      throw UnimplementedError();

  Future<void> deletarProva(ProvaEntity prova) => throw UnimplementedError();

  Future<int> inserirQuestao(Insertable<QuestaoEntity> questao) => throw UnimplementedError();

  Future<void> atualizarEnunciadoDaQuestao(int questaoId, String enunciado, int ordem) =>
      throw UnimplementedError();

  Future<void> deletarQuestaoPorId(int questaoId) => throw UnimplementedError();

  Future<void> inserirAlternativas(List<Insertable<AlternativaEntity>> alternativas) =>
      throw UnimplementedError();

  Future<void> atualizarTextoDaAlternativa(int alternativaId, String texto, int ordem) =>
      throw UnimplementedError();

  Future<void> deletarAlternativaPorId(int alternativaId) => throw UnimplementedError();

  Future<void> limparAlternativaCorretaDaQuestao(int questaoId) => throw UnimplementedError();

  Future<void> marcarAlternativaComoCorreta(int alternativaId) => throw UnimplementedError();
}
