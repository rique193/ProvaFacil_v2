import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/prova_com_questoes.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';
import 'package:provafacil/data/repository/gabarito_mapper.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';

import '../../ajudantes/banco_em_memoria.dart';
import '../../ajudantes/cenarios_geracao_prova.dart';

void main() {
  late AppDatabase db;
  late ProvaRepository provas;
  late List<int> ids;

  setUp(() async {
    db = criarBancoEmMemoria();
    provas = ProvaRepository(db);
    ids = await cadastrarQuestoesBanco(db);
  });
  tearDown(() => db.close());

  Future<int> gerar({
    List<int>? questoes,
    bool embaralharQuestoes = false,
    bool embaralharAlternativas = false,
    String titulo = ' Avaliação ',
    String disciplina = ' Matemática ',
    String turma = ' Turma A ',
  }) => provas.gerarProvaDoBanco(
    titulo: titulo,
    disciplina: disciplina,
    turma: turma,
    descricao: ' Conteúdo do semestre ',
    bancoQuestaoIds: questoes ?? ids,
    embaralharQuestoes: embaralharQuestoes,
    embaralharAlternativas: embaralharAlternativas,
    random: Random(42),
  );

  Future<ProvaComQuestoes> ler(int id) async =>
      (await provas.observarProva(id).first)!;

  for (final questoes in [false, true]) {
    for (final alternativas in [false, true]) {
      test(
        'copia texto correto e gabarito: questões=$questoes, alternativas=$alternativas',
        () async {
          final origem = [
            for (final id in ids)
              (await BancoQuestaoRepository(db).buscarQuestao(id))!,
          ];
          final prova = await ler(
            await gerar(
              embaralharQuestoes: questoes,
              embaralharAlternativas: alternativas,
            ),
          );
          expect(prova.prova.titulo, 'Avaliação');
          expect(prova.prova.disciplina, 'Matemática');
          expect(prova.prova.turma, 'Turma A');
          expect(prova.prova.descricao, 'Conteúdo do semestre');
          final salvas = [...prova.questoes]
            ..sort((a, b) => a.questao.ordem.compareTo(b.questao.ordem));
          final enunciados = origem.map((q) => q.questao.enunciado).toList();
          expect(
            salvas.map((q) => q.questao.enunciado),
            unorderedEquals(enunciados),
          );
          expect(salvas.map((q) => q.questao.ordem), [0, 1, 2, 3, 4, 5]);
          expect(
            salvas.map((q) => q.questao.enunciado),
            questoes
                ? isNot(orderedEquals(enunciados))
                : orderedEquals(enunciados),
          );
          for (final (indice, q) in salvas.indexed) {
            final fonte = origem.singleWhere(
              (item) => item.questao.enunciado == q.questao.enunciado,
            );
            final alts = [...q.alternativas]
              ..sort((a, b) => a.ordem.compareTo(b.ordem));
            expect(alts.map((a) => a.ordem), [0, 1, 2, 3, 4]);
            expect(
              alts.map((a) => a.texto),
              unorderedEquals(fonte.alternativas.map((a) => a.texto)),
            );
            if (!alternativas) {
              expect(
                alts.map((a) => a.texto),
                fonte.alternativas.map((a) => a.texto),
              );
            }
            expect(
              alts.singleWhere((a) => a.correta).texto,
              fonte.alternativas.singleWhere((a) => a.correta).texto,
            );
            final gabarito = salvas.paraGabarito()[indice];
            final posicao = gabarito.letraCorreta!.codeUnitAt(0) - 65;
            expect(
              alts[posicao].texto,
              fonte.alternativas.singleWhere((a) => a.correta).texto,
            );
          }
          expect(
            await ler(prova.prova.id),
            prova,
            reason: 'A ordem não muda ao reabrir.',
          );
          for (final (indice, id) in ids.indexed) {
            final fonte = (await BancoQuestaoRepository(db).buscarQuestao(id))!;
            expect(fonte.alternativas, origem[indice].alternativas);
          }
        },
      );
    }
  }

  test('a mesma semente gera versões com o mesmo conteúdo e ordem', () async {
    final a = await ler(
      await gerar(embaralharQuestoes: true, embaralharAlternativas: true),
    );
    final b = await ler(
      await gerar(embaralharQuestoes: true, embaralharAlternativas: true),
    );
    expect(
      a.questoes.map((q) => q.questao.enunciado),
      b.questoes.map((q) => q.questao.enunciado),
    );
    for (var i = 0; i < a.questoes.length; i++) {
      expect(
        a.questoes[i].alternativas.map((a) => (a.texto, a.correta)),
        b.questoes[i].alternativas.map((a) => (a.texto, a.correta)),
      );
    }
  });

  test('editar a prova e excluir o banco não perde a correta nem vincula as cópias', () async {
    final id = await gerar(embaralharAlternativas: true);
    final original = await ler(id);
    await provas.salvarConteudoProva(
      provaId: id,
      titulo: 'Editada',
      disciplina: 'Matemática',
      turma: original.prova.turma,
      descricao: '',
      questoes: [
        for (final q in original.questoes)
          QuestaoInput(
            id: q.questao.id,
            enunciado: q.questao.enunciado,
            alternativas: [
              for (final a in q.alternativas)
                AlternativaInput(id: a.id, texto: a.texto),
            ],
          ),
      ],
    );
    for (final id in ids) {
      await BancoQuestaoRepository(db).excluirQuestao(id);
    }
    final editada = await ler(id);
    expect(editada.prova.titulo, 'Editada');
    expect(editada.prova.turma, 'Turma A');
    expect(editada.questoes.paraGabarito(), original.questoes.paraGabarito());
  });

  test(
    'valida campos obrigatórios, seleção vazia, ids inexistentes e repetidos',
    () async {
      for (final tentativa in [
        () => gerar(titulo: ' '),
        () => gerar(disciplina: ' '),
        () => gerar(turma: ' '),
        () => gerar(questoes: []),
        () => gerar(questoes: [ids.first, 99999]),
        () => gerar(questoes: [ids.first, ids.first]),
        () => gerar(disciplina: 'História'),
      ]) {
        await expectLater(tentativa(), throwsArgumentError);
      }
      expect(await provas.observarProvas().first, isEmpty);
    },
  );

  test('recusa banco com gabarito inválido', () async {
    await db.customStatement('UPDATE banco_alternativas SET correta = 0');
    await expectLater(gerar(), throwsArgumentError);
    expect(await provas.observarProvas().first, isEmpty);
  });

  test(
    'falha durante a gravação desfaz prova, questões e alternativas',
    () async {
      await db.customStatement("""
      CREATE TRIGGER falha_geracao BEFORE INSERT ON questoes
      WHEN NEW.enunciado = 'Questão 2 de Matemática'
      BEGIN SELECT RAISE(ABORT, 'Falha simulada'); END
    """);
      await expectLater(gerar(), throwsA(isA<Exception>()));
      expect(await db.select(db.provas).get(), isEmpty);
      expect(await db.select(db.questoes).get(), isEmpty);
      expect(await db.select(db.alternativas).get(), isEmpty);
      expect(await db.select(db.bancoQuestoes).get(), hasLength(6));
    },
  );
}
