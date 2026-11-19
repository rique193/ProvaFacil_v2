import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';
import 'package:provafacil/domain/correcao/fluxo_correcao.dart';
import 'package:provafacil/domain/correcao/respostas_lidas_codec.dart';
import 'package:provafacil/domain/scanner/qr_code_prova.dart';

import '../../ajudantes/cenarios_correcao.dart';

String qr(int aluno, [int id = 1]) => QrCodeProva.gerar(
  DadosQrCode(provaId: id, aluno: nomes[aluno], turma: 'Turma A'),
);
ConferenciaFolha conferir(
  String? texto,
  Map<int, Set<String>> respostas, {
  List<ProvaParaCorrecao>? provas,
  int? escolhida = 1,
}) => FluxoCorrecao.conferirFolha(
  textoQr: texto,
  respostasLidas: respostas,
  provaEscolhidaId: escolhida,
  buscarProva: (id) =>
      (provas ?? [provaCenario()]).where((p) => p.provaId == id).firstOrNull,
);

(Pronta, CorrecaoProva) escanear(
  int aluno, {
  bool dupla = false,
  bool metade = false,
  ProvaParaCorrecao? prova,
}) {
  final p = prova ?? provaCenario();
  final c = conferir(
    qr(aluno, p.provaId),
    respostasCenario(aluno, dupla: dupla, metade: metade),
    provas: [p],
    escolhida: p.provaId,
  ) as Pronta;
  return (
    c,
    FluxoCorrecao.corrigir(
      p,
      RespostasLidasCodec.decodificar(
        RespostasLidasCodec.codificar(c.validacao.respostas),
      ),
    ),
  );
}

void main() {
  test('turmaInteira_notasBatemComORelatorio', () {
    for (var a = 0; a < nomes.length; a++) {
      final (_, c) = escanear(a);
      expect(c.acertos, acertosOriginais[a]);
      expect(c.nota, notasOriginais[a]);
      expect(c.totalQuestoes, 20);
    }
  });
  test('beatriz_duasEmBrancoEUmErro', () {
    final (f, c) = escanear(0);
    expect(f.dadosQr.aluno, nomes[0]);
    expect(f.dadosQr.turma, 'Turma A');
    expect(f.validacao.detectadas, 18);
    expect(f.validacao.emBranco, [13, 18]);
    expect([c.acertos, c.erros, c.emBranco, c.nota], [17, 1, 2, 8.5]);
    final q = c.questoes.firstWhere((q) => q.numero == 7);
    expect(q.situacao, SituacaoQuestao.erro);
    expect(q.letrasMarcadas, {'D'});
    expect(q.letraCorreta, 'C');
  });
  test('marina_erraSoAQuestao5', () {
    final (f, c) = escanear(2);
    expect(f.validacao.completa, isTrue);
    expect(c.acertos, 19);
    expect(c.nota, 9.5);
    expect(
      c.questoes
          .where((q) => q.situacao == SituacaoQuestao.erro)
          .map((q) => q.numero),
      [5],
    );
  });
  test('notaMaximaDiferente', () {
    final (f, _) = escanear(2);
    expect(
      FluxoCorrecao.corrigir(
        provaCenario(),
        f.validacao.respostas,
        notaMaxima: 100,
      ).nota,
      95.0,
    );
  });
  test('marcacaoDupla_anulaAsQuestoes', () {
    final (f, c) = escanear(0, dupla: true);
    expect(f.validacao.marcacaoMultipla, [1, 2]);
    expect(c.questoes.take(2).map((q) => q.situacao), [
      SituacaoQuestao.marcacaoMultipla,
      SituacaoQuestao.marcacaoMultipla,
    ]);
    expect([c.acertos, c.erros, c.nota], [15, 3, 7.5]);
  });
  test('metadeDaFolhaEmBranco', () {
    final (f, c) = escanear(0, metade: true);
    expect(f.validacao.emBranco, List.generate(10, (i) => 11 + i));
    expect(f.validacao.temAvisos, isTrue);
    expect([c.acertos, c.emBranco, c.nota], [9, 10, 4.5]);
  });
  test('folhaEmBranco_bloqueia', () {
    final f = conferir(qr(0), {}) as Bloqueada;
    expect(f.motivo, MotivoBloqueio.nenhumaRespostaLida);
    expect(f.dadosQr?.aluno, nomes[0]);
  });
  test('alunoSemFolhaNoMock_nadaLido', () {
    final f = conferir(
      QrCodeProva.gerar(const DadosQrCode(provaId: 1, aluno: 'Fulano de Tal')),
      {},
    ) as Bloqueada;
    expect(f.motivo, MotivoBloqueio.nenhumaRespostaLida);
  });
  test('provaComMenosQuestoesQueAFolha_ignoraAsQueSobram', () {
    final (f, c) = escanear(
      0,
      prova: provaCenario(gabarito: gabaritoOriginal.take(10).toList()),
    );
    expect(f.validacao.foraDaProva, [11, 12, 14, 15, 16, 17, 19, 20]);
    expect([c.totalQuestoes, c.acertos, c.nota], [10, 9, 9.0]);
  });
  test('letraQueNaoExisteNaQuestao_viraEmBranco', () {
    final p = provaCenario(
      gabarito: ['A', 'B', 'D'],
      letras: ['A', 'B', 'C', 'D'],
    );
    final f = conferir(
      'PROVAFACIL|1|1|Ana|',
      {
        1: {'E'},
        2: {'B'},
        3: {'D'},
      },
      provas: [p],
    ) as Pronta;
    expect(f.validacao.letrasInvalidas, {
      1: {'E'},
    });
    expect(f.validacao.emBranco, [1]);
    final c = FluxoCorrecao.corrigir(p, f.validacao.respostas);
    expect(c.questoes.first.situacao, SituacaoQuestao.emBranco);
    expect(c.acertos, 2);
    expect(c.nota, 6.67);
  });
  test('qrCodeInvalido_bloqueiaAntesDeTudo', () {
    for (final t in [
      null,
      '',
      'https://www.exemplo.com.br/cardapio',
      'PROVAFACIL|1|xyz|Ana|A',
      'PROVAFACIL|2|1|Ana|A',
    ]) {
      final f = conferir(t, respostasCenario(0)) as Bloqueada;
      expect(f.motivo, MotivoBloqueio.qrInvalido);
      expect(f.dadosQr, isNull);
    }
  });
  test(
    'folhaDeOutraProva_bloqueia',
    () => expect(
      (conferir(
        qr(0, 2),
        respostasCenario(0),
        provas: [provaCenario(), provaCenario(provaId: 2)],
      ) as Bloqueada).motivo,
      MotivoBloqueio.provaDiferente,
    ),
  );
  test(
    'semProvaEscolhida_usaAProvaDoQrCode',
    () => expect(
      (conferir(
        qr(0, 2),
        respostasCenario(0),
        provas: [provaCenario(), provaCenario(provaId: 2)],
        escolhida: null,
      ) as Pronta).prova.provaId,
      2,
    ),
  );
  test(
    'provaDoQrCodeNaoCadastrada',
    () => expect(
      (conferir(
        qr(0, 99),
        respostasCenario(0),
        escolhida: null,
      ) as Bloqueada).motivo,
      MotivoBloqueio.provaNaoEncontrada,
    ),
  );
  test(
    'provaSemGabarito_bloqueia',
    () => expect(
      (conferir(
        qr(0),
        respostasCenario(0),
        provas: [provaCenario(gabarito: List.filled(20, null))],
      ) as Bloqueada).motivo,
      MotivoBloqueio.provaSemGabarito,
    ),
  );
  test(
    'provaSemGabarito_corretorRecusa',
    () => expect(
      () =>
          FluxoCorrecao.corrigir(provaCenario(gabarito: List.filled(3, null)), {
            1: {'A'},
          }),
      throwsA(
        isA<ProvaSemGabaritoException>().having(
          (e) => e.questoesSemGabarito,
          'questões',
          [1, 2, 3],
        ),
      ),
    ),
  );
  test('gabaritoIncompleto_bloqueiaDizendoQuaisFaltam', () {
    final p = provaCenario(
      gabarito: [
        for (final (i, l) in gabaritoOriginal.indexed)
          if (i == 2 || i == 7) null else l,
      ],
    );
    final f = conferir(qr(0), respostasCenario(0), provas: [p]) as Bloqueada;
    expect(f.motivo, MotivoBloqueio.gabaritoIncompleto);
    expect(f.mensagem, contains('3, 8'));
  });
  test(
    'provaSemQuestoes_bloqueia',
    () => expect(
      (conferir(
        qr(0),
        respostasCenario(0),
        provas: [provaCenario(gabarito: [])],
      ) as Bloqueada).motivo,
      MotivoBloqueio.provaSemQuestoes,
    ),
  );
  test(
    'ordem dos bloqueios evita consultar prova de QR inválido ou diferente',
    () {
      for (final (texto, motivo) in [
        ('inválido', MotivoBloqueio.qrInvalido),
        (qr(0, 2), MotivoBloqueio.provaDiferente),
      ]) {
        final f = FluxoCorrecao.conferirFolha(
          textoQr: texto,
          respostasLidas: {},
          provaEscolhidaId: 1,
          buscarProva: (_) => throw StateError('Não deve consultar'),
        ) as Bloqueada;
        expect(f.motivo, motivo);
      }
    },
  );
}
