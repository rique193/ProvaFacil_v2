import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/backup_resultados.dart';
import 'package:provafacil/data/backup/mapeamento_firestore.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/aluno_repository.dart';
import 'package:provafacil/data/repository/backup_nuvem_repository.dart';

import '../../ajudantes/banco_em_memoria.dart';
import '../../ajudantes/correcao_simulada.dart';

/// Envio do banco local para a nuvem com um backup falso, que guarda os documentos num mapa pelo
/// id, como o `set` do Firestore. Não usa internet nem Firebase.
void main() {
  const instalacao = 'instalacao-de-teste';

  late AppDatabase db;
  late Map<String, Map<String, Object?>> nuvem;
  late BackupResultados backupFalso;

  setUp(() {
    db = criarBancoEmMemoria();
    nuvem = {};
    backupFalso = BackupResultados((alunos, resultados) async {
      for (final aluno in alunos) {
        nuvem['alunos/${idDocumentoAluno(instalacao, aluno.id)}'] = alunoParaMapa(
          aluno,
          instalacao,
          0,
        );
      }
      for (final dados in resultados) {
        final id = idDocumentoResultado(
          instalacao,
          dados.resultado.provaId,
          dados.resultado.alunoId,
        );
        nuvem['resultados/$id'] = resultadoParaMapa(dados, instalacao, 0);
      }
    });
  });

  tearDown(() => db.close());

  /// Prova de 2 questões com gabarito A, B.
  Future<int> criarProva() => criarProvaComGabarito(db, titulo: 'Prova 1', gabarito: ['A', 'B']);

  Future<int> corrigir(int provaId, String nome, String turma, Map<int, Set<String>> respostas) =>
      gravarCorrecao(db, provaId: provaId, nome: nome, turma: turma, respostas: respostas);

  Map<String, Map<String, Object?>> documentos(String colecao) => {
    for (final MapEntry(:key, :value) in nuvem.entries)
      if (key.startsWith('$colecao/')) key: value,
  };

  test('envia alunos e resultados com as respostas', () async {
    final provaId = await criarProva();
    await corrigir(provaId, 'Ana', 'Turma A', {
      1: {'A'},
      2: {'C'},
    });
    await corrigir(provaId, 'Bruno', 'Turma B', {
      1: {'A'},
    });
    await AlunoRepository(db).cadastrarAluno(nome: 'Caio', turma: 'C'); // sem resultado

    final resumo = await BackupNuvemRepository(db, backupFalso).enviarTudo();

    expect(resumo, const ResumoEnvioNuvem(resultados: 2, alunos: 3));
    expect(documentos('alunos'), hasLength(3));
    final ana = documentos('resultados').values
        .singleWhere((documento) => (documento['aluno'] as Map)['nome'] == 'Ana');
    expect((ana['prova'] as Map)['titulo'], 'Prova 1');
    expect((ana['respostas'] as List).map((r) => (r as Map)['situacao']), ['ACERTO', 'ERRO']);
  });

  test('reenviar e corrigir de novo não duplica', () async {
    final provaId = await criarProva();
    await corrigir(provaId, 'Ana', 'Turma A', {
      1: {'C'},
    });
    final repository = BackupNuvemRepository(db, backupFalso);
    await repository.enviarTudo();
    await repository.enviarTudo();

    // Nova leitura da folha: outro resultadoId no banco, mesmo documento na nuvem.
    await corrigir(provaId, 'Ana', 'Turma A', {
      1: {'A'},
      2: {'B'},
    });
    await repository.enviarTudo();

    expect(documentos('alunos'), hasLength(1));
    expect(documentos('resultados').values.single['acertos'], 2);
  });

  test('falha no envio não altera o banco local', () async {
    final provaId = await criarProva();
    final resultadoId = await corrigir(provaId, 'Ana', 'Turma A', {
      1: {'A'},
    });
    final semNuvem = BackupNuvemRepository(
      db,
      BackupResultados((_, _) async => throw StateError('sem conexão')),
    );

    await expectLater(
      semNuvem.enviarTudo(),
      throwsStateError,
      reason: 'Deveria repassar a falha para quem chamou',
    );
    final resultado = await (db.select(
      db.resultados,
    )..where((r) => r.id.equals(resultadoId))).getSingleOrNull();
    expect(resultado, isNotNull);
  });

  test('enviar resultado inexistente não envia nada', () async {
    await BackupNuvemRepository(db, backupFalso).enviarResultado(999);
    expect(nuvem, isEmpty);
  });

  test('enviar resultado envia só ele e o aluno dele', () async {
    final provaId = await criarProva();
    await corrigir(provaId, 'Ana', 'Turma A', {
      1: {'A'},
    });
    final resultadoId = await corrigir(provaId, 'Bruno', 'Turma B', {
      1: {'A'},
      2: {'B', 'D'},
    });

    await BackupNuvemRepository(db, backupFalso).enviarResultado(resultadoId);

    expect(documentos('alunos').values.single['nome'], 'Bruno');
    final enviado = documentos('resultados').values.single;
    expect((enviado['aluno'] as Map)['nome'], 'Bruno');
    expect((enviado['respostas'] as List).map((r) => (r as Map)['letrasMarcadas']), ['A', 'BD']);
    expect((enviado['respostas'] as List).map((r) => (r as Map)['situacao']), [
      'ACERTO',
      'MARCACAO_MULTIPLA',
    ]);
  });
}
