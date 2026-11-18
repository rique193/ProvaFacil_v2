import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/dados_backup.dart';
import 'package:provafacil/data/backup/mapeamento_firestore.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';

void main() {
  const instalacao = '6f1c2a9e-0b3d-4e5f-8a7b-1c2d3e4f5a6b';

  LinhaResultadoBackup resultado({int resultadoId = 7, int provaId = 3, int alunoId = 12}) =>
      LinhaResultadoBackup(
        resultadoId: resultadoId,
        provaId: provaId,
        tituloProva: 'Prova 1',
        disciplina: 'Matemática',
        alunoId: alunoId,
        nomeAluno: 'Ana Souza',
        turma: 'Turma A',
        matricula: null,
        totalQuestoes: 2,
        acertos: 1,
        erros: 0,
        emBranco: 1,
        nota: 5.0,
        notaMaxima: 10.0,
        corrigidoEm: 1000,
      );

  LinhaRespostaBackup resposta(
    int resultadoId,
    int numero,
    String marcadas,
    SituacaoQuestao situacao,
  ) => LinhaRespostaBackup(
    resultadoId: resultadoId,
    questaoId: 100 + numero,
    numeroQuestao: numero,
    letrasMarcadas: marcadas,
    letraCorreta: 'A',
    situacao: situacao,
  );

  test('ids usam o prefixo da instalação', () {
    expect(idDocumentoAluno(instalacao, 12), '${instalacao}_12');
    expect(idDocumentoResultado(instalacao, 3, 12), '${instalacao}_3_12');
  });

  test('mesmo aluno em outro aparelho tem outro documento', () {
    expect(idDocumentoAluno('aparelho-1', 1), isNot(idDocumentoAluno('aparelho-2', 1)));
    expect(
      idDocumentoResultado('aparelho-1', 1, 1),
      isNot(idDocumentoResultado('aparelho-2', 1, 1)),
    );
  });

  test('id do resultado não depende do id do resultado local', () {
    // Corrigir de novo cria outro resultadoId no banco, mas o documento na nuvem é o mesmo.
    final primeiraCorrecao = resultado(resultadoId: 7);
    final novaCorrecao = resultado(resultadoId: 8);
    expect(
      idDocumentoResultado(instalacao, primeiraCorrecao.provaId, primeiraCorrecao.alunoId),
      idDocumentoResultado(instalacao, novaCorrecao.provaId, novaCorrecao.alunoId),
    );
  });

  test('id de instalação inválido é recusado', () {
    for (final invalido in ['', '  ', 'a/b']) {
      expect(() => idDocumentoAluno(invalido, 1), throwsArgumentError, reason: invalido);
    }
  });

  test('aluno com opcionais nulos explícitos', () {
    final mapa = alunoParaMapa(
      const AlunoEntity(id: 12, nome: 'Ana Souza', turma: 'Turma A'),
      instalacao,
      5000,
    );
    expect(mapa, {
      'idInstalacao': instalacao,
      'alunoId': 12,
      'nome': 'Ana Souza',
      'turma': 'Turma A',
      'matricula': null,
      'email': null,
      'atualizadoEm': 5000,
    });
    expect(mapa.containsKey('matricula') && mapa.containsKey('email'), isTrue);
    expect(mapa['alunoId'], isA<int>());
    expect(mapa['atualizadoEm'], isA<int>());
  });

  test('aluno completo', () {
    const aluno = AlunoEntity(
      id: 1,
      nome: 'Bruno',
      turma: 'Turma B',
      matricula: '2023001',
      email: 'b@escola.br',
    );
    final mapa = alunoParaMapa(aluno, instalacao, 0);
    expect(mapa['matricula'], '2023001');
    expect(mapa['email'], 'b@escola.br');
  });

  test('resultado com prova, aluno e respostas', () {
    final dados = ResultadoParaBackup(
      resultado: resultado(),
      respostas: [
        resposta(7, 1, 'A', SituacaoQuestao.acerto),
        resposta(7, 2, '', SituacaoQuestao.emBranco),
      ],
    );
    final mapa = resultadoParaMapa(dados, instalacao, 9000);

    expect(mapa['idInstalacao'], instalacao);
    expect(mapa['prova'], {'id': 3, 'titulo': 'Prova 1', 'disciplina': 'Matemática'});
    expect(mapa['aluno'], {'id': 12, 'nome': 'Ana Souza', 'turma': 'Turma A', 'matricula': null});
    expect(mapa['totalQuestoes'], 2);
    expect(mapa['acertos'], 1);
    expect(mapa['erros'], 0);
    expect(mapa['emBranco'], 1);
    expect(mapa['nota'], 5.0);
    expect(mapa['notaMaxima'], 10.0);
    expect(mapa['corrigidoEm'], 1000);
    expect(mapa['atualizadoEm'], 9000);
    expect(mapa['respostas'], [
      {
        'numero': 1,
        'questaoId': 101,
        'letrasMarcadas': 'A',
        'letraCorreta': 'A',
        'situacao': 'ACERTO',
      },
      {
        'numero': 2,
        'questaoId': 102,
        'letrasMarcadas': '',
        'letraCorreta': 'A',
        'situacao': 'EM_BRANCO',
      },
    ]);
  });

  test('resultado mantém os tipos do documento antigo: inteiros e nota em double', () {
    final mapa = resultadoParaMapa(
      ResultadoParaBackup(resultado: resultado(), respostas: const []),
      instalacao,
      0,
    );
    for (final campo in ['totalQuestoes', 'acertos', 'erros', 'emBranco', 'corrigidoEm']) {
      expect(mapa[campo], isA<int>(), reason: campo);
    }
    expect(mapa['nota'], isA<double>());
    expect(mapa['notaMaxima'], isA<double>());
    expect((mapa['prova'] as Map)['id'], isA<int>());
    expect((mapa['aluno'] as Map)['id'], isA<int>());
  });

  test('agrupa respostas por resultado em ordem', () {
    final resultados = [
      resultado(resultadoId: 7, alunoId: 1),
      resultado(resultadoId: 8, alunoId: 2),
    ];
    final respostas = [
      resposta(8, 2, 'B', SituacaoQuestao.erro),
      resposta(7, 2, 'AC', SituacaoQuestao.marcacaoMultipla),
      resposta(8, 1, 'A', SituacaoQuestao.acerto),
      resposta(7, 1, 'A', SituacaoQuestao.acerto),
    ];
    final agrupados = agruparResultadosParaBackup(resultados, respostas);
    expect(agrupados.map((d) => d.resultado.resultadoId), [7, 8]);
    expect(agrupados[0].respostas.map((r) => r.numeroQuestao), [1, 2]);
    expect(agrupados[0].respostas.map((r) => r.letrasMarcadas), ['A', 'AC']);
    expect(agrupados[1].respostas.map((r) => r.letrasMarcadas), ['A', 'B']);
  });

  test('resultado sem respostas fica com lista vazia', () {
    final agrupados = agruparResultadosParaBackup([resultado()], const []);
    expect(agrupados.single.respostas, isEmpty);
    expect(resultadoParaMapa(agrupados.single, instalacao, 0)['respostas'], isEmpty);
  });
}
