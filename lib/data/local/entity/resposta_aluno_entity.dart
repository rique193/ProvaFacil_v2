import 'package:drift/drift.dart';

import '../../../domain/correcao/corretor_prova.dart';
import 'questao_entity.dart';
import 'resultado_entity.dart';

class SituacaoQuestaoConverter extends TypeConverter<SituacaoQuestao, String> {
  const SituacaoQuestaoConverter();

  @override
  SituacaoQuestao fromSql(String fromDb) => SituacaoQuestao.deNome(fromDb);

  @override
  String toSql(SituacaoQuestao value) => value.nome;
}

@DataClassName('RespostaAlunoEntity')
@TableIndex(name: 'index_respostas_aluno_resultadoId', columns: {#resultadoId})
@TableIndex(name: 'index_respostas_aluno_questaoId', columns: {#questaoId})
class RespostasAluno extends Table {
  @override
  String get tableName => 'respostas_aluno';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get resultadoId => integer().references(Resultados, #id, onDelete: KeyAction.cascade)();
  IntColumn get questaoId => integer().references(Questoes, #id, onDelete: KeyAction.cascade)();
  IntColumn get numeroQuestao => integer()();

  /// Letras marcadas pelo aluno, ex.: "B". Vazio = em branco; "BD" = marcou mais de uma.
  TextColumn get letrasMarcadas => text()();

  /// Letra correta no gabarito no momento da correção, ex.: "C".
  TextColumn get letraCorreta => text()();
  TextColumn get situacao => text().map(const SituacaoQuestaoConverter())();
}
