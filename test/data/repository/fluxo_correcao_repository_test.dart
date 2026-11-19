import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/backup_resultados.dart';
import 'package:provafacil/data/backup/dados_backup.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/gabarito_mapper.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/data/repository/resultado_repository.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';
import 'package:provafacil/domain/correcao/fluxo_correcao.dart';
import 'package:provafacil/domain/correcao/respostas_lidas_codec.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/domain/scanner/qr_code_prova.dart';

import '../../ajudantes/banco_em_memoria.dart';
import '../../ajudantes/cenarios_correcao.dart';

void main() {
  late AppDatabase db;
  late ProvaRepository provas;
  late ResultadoRepository resultados;
  setUp(() {
    db = criarBancoEmMemoria();
    provas = ProvaRepository(db);
    resultados = ResultadoRepository(db);
  });
  tearDown(() => db.close());

  Future<int> cadastrar({List<String?> gabarito = gabaritoOriginal}) async {
    final id = await provas.salvarConteudoProva(
      provaId: null,
      titulo: 'Cálculo I - Prova 2',
      disciplina: 'Cálculo I',
      descricao: '',
      questoes: [
        for (var i = 0; i < gabarito.length; i++)
          QuestaoInput(
            enunciado: 'Questão ${i + 1}',
            alternativas: [
              for (final l in letrasAE)
                AlternativaInput(texto: 'Alternativa $l'),
            ],
          ),
      ],
    );
    final prova = (await provas.observarProva(id).first)!;
    final questoes = [...prova.questoes]
      ..sort((a, b) => a.questao.ordem.compareTo(b.questao.ordem));
    final respostas = <int, int>{};
    for (final (i, q) in questoes.indexed) {
      final l = gabarito[i];
      if (l != null) {
        final alternativas = [...q.alternativas]
          ..sort((a, b) => a.ordem.compareTo(b.ordem));
        respostas[q.questao.id] = alternativas[l.codeUnitAt(0) - 65].id;
      }
    }
    if (respostas.isNotEmpty) await provas.salvarGabarito(id, respostas);
    return id;
  }

  Future<int> escanear(int id, int aluno, {bool dupla = false}) async {
    final cadastradas = await provas.observarProvas().first;
    final f = FluxoCorrecao.conferirFolha(
      textoQr: QrCodeProva.gerar(
        DadosQrCode(provaId: id, aluno: nomes[aluno], turma: 'Turma A'),
      ),
      respostasLidas: respostasCenario(aluno, dupla: dupla),
      provaEscolhidaId: id,
      buscarProva: (id) => cadastradas
          .where((p) => p.prova.id == id)
          .firstOrNull
          ?.paraCorrecao(),
    ) as Pronta;
    return resultados.corrigirESalvar(
      provaId: id,
      nomeAluno: f.dadosQr.aluno,
      turma: f.dadosQr.turma,
      respostasLidas: RespostasLidasCodec.decodificar(
        RespostasLidasCodec.codificar(f.validacao.respostas),
      ),
    );
  }

  test('scannerAteResultado_salvaNotaERespostas', () async {
    final id = await cadastrar();
    final resultadoId = await escanear(id, 0);
    final d = (await resultados.observarResultado(resultadoId).first)!;
    expect(d.aluno.nome, nomes[0]);
    expect(d.aluno.turma, 'Turma A');
    expect(d.prova.id, id);
    expect(
      [
        d.resultado.totalQuestoes,
        d.resultado.acertos,
        d.resultado.erros,
        d.resultado.emBranco,
        d.resultado.nota,
      ],
      [20, 17, 1, 2, 8.5],
    );
    expect(d.respostas.length, 20);
    final q7 = d.respostas.firstWhere((q) => q.numeroQuestao == 7);
    expect(q7.letrasMarcadas, 'D');
    expect(q7.letraCorreta, 'C');
    expect(q7.situacao, SituacaoQuestao.erro);
    expect(
      d.respostas.firstWhere((q) => q.numeroQuestao == 13).situacao,
      SituacaoQuestao.emBranco,
    );
  });
  test('turmaInteira_notasSalvasBatemComORelatorio', () async {
    final id = await cadastrar();
    for (var a = 0; a < nomes.length; a++) {
      await escanear(id, a);
    }
    final salvos = await resultados.observarResultadosDaProva(id).first;
    expect(salvos.length, nomes.length);
    for (final s in salvos) {
      final a = nomes.indexOf(s.aluno.nome);
      expect(s.resultado.acertos, acertosOriginais[a]);
      expect(s.resultado.nota, notasOriginais[a]);
    }
  });
  test('escanearDeNovo_substituiOResultado', () async {
    final id = await cadastrar();
    final primeiro = await escanear(id, 0);
    final segundo = await escanear(id, 0, dupla: true);
    final salvos = await resultados.observarResultadosDaProva(id).first;
    expect(salvos.length, 1);
    expect(salvos.single.resultado.id, segundo);
    expect(salvos.single.resultado.nota, 7.5);
    expect(await resultados.observarResultado(primeiro).first, isNull);
    expect(
      await (db.select(
        db.respostasAluno,
      )..where((q) => q.resultadoId.equals(primeiro))).get(),
      isEmpty,
    );
    expect(
      (await resultados.observarResultado(segundo).first)!
          .respostas
          .first
          .letrasMarcadas,
      'AB',
    );
  });
  test('provaSemGabarito_naoSalvaNada', () async {
    final id = await cadastrar(gabarito: List.filled(20, null));
    await expectLater(
      resultados.corrigirESalvar(
        provaId: id,
        nomeAluno: nomes[0],
        turma: 'Turma A',
        respostasLidas: respostasCenario(0),
      ),
      throwsA(
        isA<ProvaSemGabaritoException>().having(
          (e) => e.questoesSemGabarito.length,
          'questões',
          20,
        ),
      ),
    );
    expect(await resultados.observarResultadosDaProva(id).first, isEmpty);
    expect(await db.select(db.alunos).get(), isEmpty);
  });
  test('normaliza espaços e encontra aluno sem diferenciar caixa', () async {
    final id = await cadastrar(gabarito: ['A']);
    await resultados.corrigirESalvar(
      provaId: id,
      nomeAluno: '  Ana   Maria ',
      turma: '  Turma   A ',
      respostasLidas: {
        1: {'A'},
      },
    );
    final segundo = await resultados.corrigirESalvar(
      provaId: id,
      nomeAluno: 'ana maria',
      turma: 'turma a',
      respostasLidas: {},
    );
    expect(await db.select(db.alunos).get(), hasLength(1));
    final d = (await resultados.observarResultado(segundo).first)!;
    expect(d.aluno.nome, 'Ana Maria');
    expect(d.aluno.turma, 'Turma A');
    expect(d.resultado.nota, 0);
  });
  test(
    'falha ao inserir respostas reverte aluno e preserva resultado anterior',
    () async {
      final id = await cadastrar(gabarito: ['A']);
      final anterior = await escanear(id, 0);
      await db.customStatement(
        "CREATE TRIGGER falhar_resposta BEFORE INSERT ON respostas_aluno BEGIN SELECT RAISE(ABORT, 'falha de teste'); END",
      );
      await expectLater(escanear(id, 0, dupla: true), throwsA(anything));
      expect(
        (await resultados.observarResultadosDaProva(id).first)
            .single
            .resultado
            .id,
        anterior,
      );
      expect(
        (await resultados.observarResultado(anterior).first)!.respostas,
        hasLength(1),
      );
      await expectLater(
        resultados.corrigirESalvar(
          provaId: id,
          nomeAluno: 'Outro aluno',
          turma: 'A',
          respostasLidas: {
            1: {'A'},
          },
        ),
        throwsA(anything),
      );
      expect(await db.select(db.alunos).get(), hasLength(1));
    },
  );
  test('valida nome e prova antes de gravar', () async {
    for (final (nome, id, mensagem) in [
      (' ', 1, 'Informe o nome do aluno.'),
      ('Ana', 99, 'Esta prova não tem questões cadastradas.'),
    ]) {
      await expectLater(
        resultados.corrigirESalvar(
          provaId: id,
          nomeAluno: nome,
          turma: '',
          respostasLidas: {},
        ),
        throwsA(
          isA<ArgumentError>().having((e) => e.message, 'mensagem', mensagem),
        ),
      );
    }
    expect(await db.select(db.alunos).get(), isEmpty);
  });
  test('backup ocorre após commit; falha não perde a correção', () async {
    final id = await cadastrar(gabarito: ['A']);
    ResultadoParaBackup? enviado;
    resultados = ResultadoRepository(
      db,
      backup: BackupResultados((alunos, enviados) async {
        final r = enviados.single;
        expect(alunos.single.id, r.resultado.alunoId);
        expect(alunos.single.nome, 'Ana');
        enviado = r;
        expect(
          (await resultados.observarResultadosDaProva(id).first)
              .single
              .resultado
              .id,
          r.resultado.resultadoId,
        );
        throw StateError('sem rede');
      }),
    );
    final resultadoId = await resultados.corrigirESalvar(
      provaId: id,
      nomeAluno: 'Ana',
      turma: 'A',
      respostasLidas: {
        1: {'a'},
      },
    );
    expect(
      (await resultados.observarResultado(resultadoId).first)!.resultado.nota,
      10,
    );
    expect(enviado!.resultado.resultadoId, resultadoId);
    expect(enviado!.respostas.single.letrasMarcadas, 'A');
  });
  test(
    'streams observam aluno, prova, respostas e exclusão em cascata',
    () async {
      final id = await cadastrar(gabarito: ['A']);
      final resultadoId = await escanear(id, 0);
      final stream = resultados
          .observarResultado(resultadoId)
          .asBroadcastStream();
      final inicial = (await stream.first)!;
      final mudanca = stream.firstWhere((d) => d?.aluno.nome == 'Novo nome');
      await (db.update(db.alunos)..where((a) => a.id.equals(inicial.aluno.id)))
          .write(const AlunosCompanion(nome: Value('Novo nome')));
      expect((await mudanca)!.aluno.nome, 'Novo nome');
      final exclusao = stream.firstWhere((d) => d == null);
      await provas.excluirProva(inicial.prova);
      expect(await exclusao, isNull);
      expect(await db.select(db.respostasAluno).get(), isEmpty);
    },
  );
}
