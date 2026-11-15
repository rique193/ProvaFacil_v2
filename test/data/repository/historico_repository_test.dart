import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/estatisticas_repository.dart';
import 'package:provafacil/data/repository/historico_repository.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';

import '../../ajudantes/banco_em_memoria.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;

void main() {
  late AppDatabase db;
  late HistoricoRepository historico;
  late EstatisticasRepository estatisticas;

  setUp(() {
    db = criarBancoEmMemoria();
    historico = HistoricoRepository(db);
    estatisticas = EstatisticasRepository(db);
  });

  tearDown(() => db.close());

  Future<int> inserirProva(String titulo) => db
      .into(db.provas)
      .insert(ProvasCompanion.insert(titulo: titulo, disciplina: 'Matemática'));

  Future<int> inserirAluno(String nome, {String turma = '', String? matricula}) => db
      .into(db.alunos)
      .insert(AlunosCompanion.insert(nome: nome, turma: Value(turma), matricula: Value(matricula)));

  Future<int> inserirResultado(
      int provaId,
      int alunoId, {
        required int acertos,
        required double nota,
        int corrigidoEm = 1000,
      }) => db.into(db.resultados).insert(
    ResultadosCompanion.insert(
      provaId: provaId,
      alunoId: alunoId,
      totalQuestoes: 2,
      acertos: acertos,
      erros: 2 - acertos,
      emBranco: 0,
      nota: nota,
      notaMaxima: 10,
      corrigidoEm: Value(corrigidoEm),
    ),
  );

  test('prova sem resultado não aparece no histórico', () async {
    await inserirProva('Sem correção');

    expect(await historico.observarProvasCorrigidas().first, isEmpty);
  });

  test('resumo da prova: total, média, última correção e turmas', () async {
    final provaId = await inserirProva('Frações');
    final ana = await inserirAluno('Ana', turma: 'Turma A');
    final bruno = await inserirAluno('Bruno', turma: 'Turma B');
    await inserirResultado(provaId, ana, acertos: 2, nota: 10, corrigidoEm: 1000);
    await inserirResultado(provaId, bruno, acertos: 1, nota: 5, corrigidoEm: 3000);

    final [resumo] = await historico.observarProvasCorrigidas().first;

    expect(resumo.provaId, provaId);
    expect(resumo.titulo, 'Frações');
    expect(resumo.disciplina, 'Matemática');
    expect(resumo.totalCorrigidos, 2);
    expect(resumo.media, closeTo(7.5, 1e-9));
    expect(resumo.ultimaCorrecaoEm, 3000);
    expect(resumo.turmas!.split(',').toSet(), {'Turma A', 'Turma B'});
  });

  test('a prova corrigida mais recentemente vem primeiro', () async {
    final antiga = await inserirProva('Antiga');
    final nova = await inserirProva('Nova');
    final ana = await inserirAluno('Ana');
    await inserirResultado(antiga, ana, acertos: 1, nota: 5, corrigidoEm: 1000);
    await inserirResultado(nova, ana, acertos: 2, nota: 10, corrigidoEm: 2000);

    final provas = await historico.observarProvasCorrigidas().first;

    expect(provas.map((p) => p.titulo), ['Nova', 'Antiga']);
  });

  test('notas da prova em ordem alfabética ignorando maiúsculas', () async {
    final provaId = await inserirProva('Prova');
    for (final nome in ['bruno', 'Ana', 'Carla']) {
      await inserirResultado(provaId, await inserirAluno(nome), acertos: 1, nota: 5);
    }

    final notas = await historico.observarNotasDaProva(provaId).first;

    expect(notas.map((n) => n.nome), ['Ana', 'bruno', 'Carla']);
    expect(notas.first.matricula, null);
    expect(notas.first.nota, 5);
  });

  test('observarProva devolve nulo para prova inexistente', () async {
    expect(await historico.observarProva(999).first, null);
  });

  test('dados de estatísticas combinam prova, turmas, notas, questões e respostas', () async {
    final provaId = await inserirProva('Prova');
    final questaoId = await db
        .into(db.questoes)
        .insert(QuestoesCompanion.insert(provaId: provaId, enunciado: 'Q1', ordem: 0));
    for (var i = 0; i < 2; i++) {
      await db.into(db.alternativas).insert(
        AlternativasCompanion.insert(
          questaoId: questaoId,
          texto: 'Alt $i',
          correta: i == 0,
          ordem: i,
        ),
      );
    }
    final alunoId = await inserirAluno('Ana', turma: 'Turma A');
    final resultadoId = await inserirResultado(
      provaId,
      alunoId,
      acertos: 1,
      nota: 10,
      corrigidoEm: 5000,
    );
    await db.into(db.respostasAluno).insert(
      RespostasAlunoCompanion.insert(
        resultadoId: resultadoId,
        questaoId: questaoId,
        numeroQuestao: 1,
        letrasMarcadas: 'A',
        letraCorreta: 'A',
        situacao: SituacaoQuestao.acerto,
      ),
    );

    final dados = await estatisticas.observarDadosDaProva(provaId).first;

    expect(dados.prova!.titulo, 'Prova');
    expect(dados.turmas, 'Turma A');
    expect(dados.notas.single.nome, 'Ana');
    expect(dados.questoes.single.totalAlternativas, 2);
    expect(dados.respostas.single.situacao, SituacaoQuestao.acerto);
    expect(dados.respostas.single.corrigidoEm, 5000);
  });
}