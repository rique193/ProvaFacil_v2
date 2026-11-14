import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase database;

  setUp(() => database = criarBancoEmMemoria());
  tearDown(() => database.close());

  Future<int> inserirProva() => database
      .into(database.provas)
      .insert(ProvasCompanion.insert(titulo: 'Prova 1', disciplina: 'Matemática'));

  Future<int> inserirQuestao(int provaId) => database
      .into(database.questoes)
      .insert(QuestoesCompanion.insert(provaId: provaId, enunciado: 'Quanto é 2 + 2?', ordem: 0));

  Future<int> inserirResultado(int provaId, int alunoId) => database.into(database.resultados).insert(
        ResultadosCompanion.insert(
          provaId: provaId,
          alunoId: alunoId,
          totalQuestoes: 1,
          acertos: 1,
          erros: 0,
          emBranco: 0,
          nota: 10,
          notaMaxima: 10,
        ),
      );

  Future<void> inserirResposta(int resultadoId, int questaoId, SituacaoQuestao situacao) =>
      database.into(database.respostasAluno).insert(
            RespostasAlunoCompanion.insert(
              resultadoId: resultadoId,
              questaoId: questaoId,
              numeroQuestao: 1,
              letrasMarcadas: 'BD',
              letraCorreta: 'A',
              situacao: situacao,
            ),
          );

  test('apagar a prova apaga em cascata questões, alternativas, resultados e respostas', () async {
    final provaId = await inserirProva();
    final questaoId = await inserirQuestao(provaId);
    await database.into(database.alternativas).insert(
          AlternativasCompanion.insert(questaoId: questaoId, texto: '4', correta: true, ordem: 0),
        );
    final alunoId = await database
        .into(database.alunos)
        .insert(AlunosCompanion.insert(nome: 'Ana', turma: const Value('Turma A')));
    final resultadoId = await inserirResultado(provaId, alunoId);
    await inserirResposta(resultadoId, questaoId, SituacaoQuestao.acerto);

    await (database.delete(database.provas)..where((p) => p.id.equals(provaId))).go();

    expect(await database.select(database.questoes).get(), isEmpty);
    expect(await database.select(database.alternativas).get(), isEmpty);
    expect(await database.select(database.resultados).get(), isEmpty);
    expect(await database.select(database.respostasAluno).get(), isEmpty);
    expect(await database.select(database.alunos).get(), hasLength(1));
  });

  test('situação é gravada em maiúsculas', () async {
    final provaId = await inserirProva();
    final questaoId = await inserirQuestao(provaId);
    final alunoId = await database.into(database.alunos).insert(AlunosCompanion.insert(nome: 'Bia'));
    final resultadoId = await inserirResultado(provaId, alunoId);
    await inserirResposta(resultadoId, questaoId, SituacaoQuestao.marcacaoMultipla);

    final linha = await database.customSelect('SELECT situacao FROM respostas_aluno').getSingle();
    expect(linha.read<String>('situacao'), 'MARCACAO_MULTIPLA');
    final resposta = await database.select(database.respostasAluno).getSingle();
    expect(resposta.situacao, SituacaoQuestao.marcacaoMultipla);
  });

  test('matrícula é única ignorando maiúsculas', () async {
    await database
        .into(database.alunos)
        .insert(AlunosCompanion.insert(nome: 'Ana', matricula: const Value('ab12')));

    expect(
      database
          .into(database.alunos)
          .insert(AlunosCompanion.insert(nome: 'Bia', matricula: const Value('AB12'))),
      throwsA(isA<SqliteException>()),
    );
  });

  test('nome e turma são únicos', () async {
    await database.into(database.alunos).insert(AlunosCompanion.insert(nome: 'Ana'));

    expect(
      database.into(database.alunos).insert(AlunosCompanion.insert(nome: 'Ana')),
      throwsA(isA<SqliteException>()),
    );
  });
}
