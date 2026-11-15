import 'package:drift/drift.dart' hide isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/prova_repository.dart';

import '../../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = criarBancoEmMemoria());
  tearDown(() => db.close());

  Future<int> inserirProva(String titulo, int criadaEm) => db.provaDao.inserirProva(
    ProvasCompanion.insert(titulo: titulo, disciplina: 'Física', criadaEm: Value(criadaEm)),
  );

  test('observarProvas ordena da mais nova para a mais antiga', () async {
    await inserirProva('Antiga', 1000);
    await inserirProva('Nova', 2000);

    final provas = await db.provaDao.observarProvas().first;

    expect(provas.map((p) => p.prova.titulo), ['Nova', 'Antiga']);
    expect(provas.every((p) => p.questoes.isEmpty), isTrue);
  });

  test('observarProvas emite de novo quando uma alternativa muda', () async {
    final provaId = await inserirProva('Prova', 1000);
    final questaoId = await db.provaDao.inserirQuestao(
      QuestoesCompanion.insert(provaId: provaId, enunciado: 'Q1', ordem: 0),
    );
    await db.provaDao.inserirAlternativas([
      AlternativasCompanion.insert(questaoId: questaoId, texto: 'A', correta: false, ordem: 0),
    ]);
    final alternativaId = (await db.provaDao.listarQuestoesComAlternativas(provaId))
        .single
        .alternativas
        .single
        .id;

    final emissoes = db.provaDao.observarProvas().map(
      (provas) => provas.single.questoes.single.alternativas.single.correta,
    );
    final esperadas = expectLater(emissoes, emitsInOrder([false, true]));
    await Future<void>.delayed(Duration.zero);
    await db.provaDao.marcarAlternativaComoCorreta(alternativaId);
    await esperadas;
  });

  test('listarQuestoesComAlternativas ordena por ordem e depois por id', () async {
    final provaId = await inserirProva('Prova', 1000);
    for (final (enunciado, ordem) in [('Q3', 2), ('Q1', 0), ('Q2a', 1), ('Q2b', 1)]) {
      await db.provaDao.inserirQuestao(
        QuestoesCompanion.insert(provaId: provaId, enunciado: enunciado, ordem: ordem),
      );
    }

    final questoes = await db.provaDao.listarQuestoesComAlternativas(provaId);

    expect(questoes.map((q) => q.questao.enunciado), ['Q1', 'Q2a', 'Q2b', 'Q3']);
  });

  test('atualizarProva devolve quantas linhas mudaram', () async {
    final provaId = await inserirProva('Prova', 1000);

    expect(await db.provaDao.atualizarProva(provaId, 'Nova', 'Química', ''), 1);
    expect(await db.provaDao.atualizarProva(provaId + 1, 'Nova', 'Química', ''), 0);
  });

  test('excluirProva apaga questões e alternativas em cascata', () async {
    final provaId = await inserirProva('Prova', 1000);
    final questaoId = await db.provaDao.inserirQuestao(
      QuestoesCompanion.insert(provaId: provaId, enunciado: 'Q1', ordem: 0),
    );
    await db.provaDao.inserirAlternativas([
      AlternativasCompanion.insert(questaoId: questaoId, texto: 'A', correta: true, ordem: 0),
    ]);
    final prova = (await db.provaDao.observarProva(provaId).first)!.prova;

    await ProvaRepository(db).excluirProva(prova);

    expect(await db.provaDao.observarProva(provaId).first, isNull);
    expect(await db.select(db.questoes).get(), isEmpty);
    expect(await db.select(db.alternativas).get(), isEmpty);
  });
}
