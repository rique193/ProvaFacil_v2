import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart' show SqliteException;
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/backup_alunos.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/aluno_repository.dart';

import '../../ajudantes/banco_em_memoria.dart';
import '../../ajudantes/correcao_simulada.dart';

/// Backup falso: registra o que seria enviado ou removido da nuvem, ou falha como sem conexão.
class BackupAlunosFalso implements BackupAlunos {
  BackupAlunosFalso({this.falhar = false});

  final bool falhar;
  final salvos = <AlunoEntity>[];
  final removidos = <(int, List<int>)>[];

  @override
  Future<void> salvarAluno(AlunoEntity aluno) async {
    if (falhar) throw StateError('sem conexão');
    salvos.add(aluno);
  }

  @override
  Future<void> removerAluno(int alunoId, List<int> provaIds) async {
    if (falhar) throw StateError('sem conexão');
    removidos.add((alunoId, provaIds));
  }
}

void main() {
  late AppDatabase db;
  late BackupAlunosFalso backup;
  late AlunoRepository repository;

  setUp(() {
    db = criarBancoEmMemoria();
    backup = BackupAlunosFalso();
    repository = AlunoRepository(db, backup: backup);
  });

  tearDown(() => db.close());

  Future<List<AlunoEntity>> alunos() => repository.observarAlunos().first;

  Future<void> rejeita(String trecho, Future<void> Function() bloco) => expectLater(
    bloco(),
    throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains(trecho))),
  );

  Future<ResultadoEntity> resultado(int resultadoId) =>
      (db.select(db.resultados)..where((r) => r.id.equals(resultadoId))).getSingle();

  /// Prova de uma questão com gabarito "A", corrigida para o aluno como faria o fluxo do QR Code.
  Future<int> corrigirPeloQrCode(String nome, String turma) async {
    final provaId = await criarProvaComGabarito(db, gabarito: ['A']);
    return gravarCorrecao(
      db,
      provaId: provaId,
      nome: nome,
      turma: turma,
      respostas: {
        1: {'A'},
      },
    );
  }

  test('cadastro normaliza turma, nome e opcionais', () async {
    final salvo = await repository.cadastrarAluno(
      nome: '  Ana   Souza ',
      turma: 'a',
      matricula: ' 2023001 ',
      email: '  ',
    );
    expect(salvo.nome, 'Ana Souza');
    expect(salvo.turma, 'Turma A');
    expect(salvo.matricula, '2023001');
    expect(salvo.email, isNull);
    expect(await alunos(), [salvo]);
    expect(backup.salvos, [salvo]);
  });

  test('somente nome e turma são obrigatórios', () async {
    final salvo = await repository.cadastrarAluno(
      nome: 'Ana',
      turma: '3b',
      matricula: '',
      email: '',
    );
    expect(salvo.turma, 'Turma 3B');
    expect(salvo.matricula, isNull);
    await rejeita(
      'Informe a turma',
      () => repository.cadastrarAluno(nome: 'Bruno', turma: 'turma'),
    );
    await rejeita(
      'E-mail inválido',
      () => repository.cadastrarAluno(nome: 'Bruno', turma: 'A', email: 'bruno@'),
    );
    expect(await alunos(), hasLength(1));
  });

  test('correção encontra o aluno cadastrado', () async {
    final cadastrado = await repository.cadastrarAluno(
      nome: 'Ana Souza',
      turma: 'turma a',
      matricula: '2023001',
    );
    final resultadoId = await corrigirPeloQrCode('Ana Souza', 'Turma A');
    expect((await resultado(resultadoId)).alunoId, cadastrado.id);
    expect(await alunos(), hasLength(1));
  });

  test('cadastro completa aluno criado pela correção', () async {
    final resultadoId = await corrigirPeloQrCode('Ana Souza', 'Turma A');
    final criadoPelaCorrecao = (await alunos()).single;
    expect(criadoPelaCorrecao.matricula, isNull);

    final completado = await repository.cadastrarAluno(
      nome: 'ana souza',
      turma: 'A',
      matricula: '2023001',
      email: 'ana@escola.com',
    );
    expect(completado.id, criadoPelaCorrecao.id);
    expect(completado.matricula, '2023001');
    expect(completado.email, 'ana@escola.com');
    expect(await alunos(), [completado]);
    expect((await resultado(resultadoId)).alunoId, completado.id);
  });

  test('mesmo nome e turma com outra matrícula falha sem sobrescrever', () async {
    final original = await repository.cadastrarAluno(
      nome: 'Ana Souza',
      turma: 'A',
      matricula: '2023001',
      email: 'ana@escola.com',
    );
    await rejeita(
      'com outra matrícula (2023001)',
      () => repository.cadastrarAluno(
        nome: 'Ana Souza',
        turma: 'Turma A',
        matricula: '2099999',
        email: 'outra@escola.com',
      ),
    );
    await rejeita(
      'já está cadastrado',
      () => repository.cadastrarAluno(nome: 'Ana Souza', turma: 'A'),
    );
    expect(await alunos(), [original]);
    expect(backup.salvos, [original]);
  });

  test('matrícula duplicada ignora maiúsculas', () async {
    await repository.cadastrarAluno(nome: 'Ana Souza', turma: 'A', matricula: 'ab123');
    await rejeita(
      'Já existe um aluno com a matrícula ab123',
      () => repository.cadastrarAluno(nome: 'Bruno Lima', turma: 'B', matricula: 'AB123'),
    );
    expect(await alunos(), hasLength(1));
  });

  test('índice do banco também barra matrícula com outra caixa', () async {
    await db.alunoDao.inserirAluno(
      AlunosCompanion.insert(
        nome: 'Ana',
        turma: const Value('Turma A'),
        matricula: const Value('ab123'),
      ),
    );
    await expectLater(
      db.alunoDao.inserirAluno(
        AlunosCompanion.insert(
          nome: 'Bruno',
          turma: const Value('Turma B'),
          matricula: const Value('AB123'),
        ),
      ),
      throwsA(isA<SqliteException>()),
      reason: 'O índice único de matrícula deveria ignorar maiúsculas',
    );
    // Vários alunos sem matrícula (criados pela correção) continuam permitidos.
    await db.alunoDao.inserirAluno(
      AlunosCompanion.insert(nome: 'Caio', turma: const Value('Turma A')),
    );
    await db.alunoDao.inserirAluno(
      AlunosCompanion.insert(nome: 'Duda', turma: const Value('Turma A')),
    );
    expect(await alunos(), hasLength(3));
  });

  test('falha no backup não desfaz o cadastro', () async {
    final semNuvem = AlunoRepository(db, backup: BackupAlunosFalso(falhar: true));
    final salvo = await semNuvem.cadastrarAluno(
      nome: 'Ana Souza',
      turma: 'A',
      matricula: '2023001',
    );
    expect(await alunos(), [salvo]);
  });

  test('editar atualiza o banco e envia ao backup', () async {
    final ana = await repository.cadastrarAluno(
      nome: 'Ana Souza',
      turma: 'A',
      matricula: '2023001',
    );
    final resultadoId = await corrigirPeloQrCode('Ana Souza', 'Turma A');

    final editada = await repository.editarAluno(
      alunoId: ana.id,
      nome: ' Ana  Paula ',
      turma: 'b',
      matricula: '2023001',
      email: 'ana@escola.com',
    );

    expect(
      editada,
      AlunoEntity(
        id: ana.id,
        nome: 'Ana Paula',
        turma: 'Turma B',
        matricula: '2023001',
        email: 'ana@escola.com',
      ),
    );
    expect(await alunos(), [editada]);
    expect(backup.salvos.last, editada);
    // O resultado continua ligado pelo id.
    expect((await resultado(resultadoId)).alunoId, ana.id);
  });

  test('editar ignora o próprio aluno e recusa conflito com outro', () async {
    final ana = await repository.cadastrarAluno(
      nome: 'Ana Souza',
      turma: 'A',
      matricula: '2023001',
    );
    await repository.cadastrarAluno(nome: 'Bruno Lima', turma: 'B', matricula: '2023002');

    // Mesma matrícula e mesmo nome + turma da própria Ana: aceito. Matrícula em branco é apagada.
    await repository.editarAluno(
      alunoId: ana.id,
      nome: 'ANA SOUZA',
      turma: 'A',
      matricula: '2023001',
      email: 'ana@escola.com',
    );
    final semMatricula = await repository.editarAluno(
      alunoId: ana.id,
      nome: 'Ana Souza',
      turma: 'A',
      matricula: '',
    );
    expect(semMatricula.matricula, isNull);

    await rejeita(
      'Já existe um aluno com a matrícula 2023002',
      () => repository.editarAluno(
        alunoId: ana.id,
        nome: 'Ana Souza',
        turma: 'A',
        matricula: '2023002',
      ),
    );
    await rejeita(
      'Bruno Lima já está cadastrado na Turma B',
      () => repository.editarAluno(alunoId: ana.id, nome: 'Bruno Lima', turma: 'B'),
    );
    await rejeita(
      'Aluno não encontrado',
      () => repository.editarAluno(alunoId: 999, nome: 'Caio', turma: 'C'),
    );
  });

  test('excluir apaga aluno, resultados e respostas e avisa o backup', () async {
    final prova1 = (await resultado(await corrigirPeloQrCode('Ana Souza', 'Turma A'))).provaId;
    final prova2 = (await resultado(await corrigirPeloQrCode('Ana Souza', 'Turma A'))).provaId;
    await corrigirPeloQrCode('Bruno Lima', 'Turma B');
    final ana = (await alunos()).singleWhere((a) => a.nome == 'Ana Souza');
    expect(await repository.contarResultadosDoAluno(ana.id), 2);
    expect(await contarLinhas(db, 'respostas_aluno'), 3);

    await repository.excluirAluno(ana.id);

    expect((await alunos()).map((a) => a.nome), ['Bruno Lima']);
    expect(await contarLinhas(db, 'resultados'), 1);
    expect(await contarLinhas(db, 'respostas_aluno'), 1);
    expect(await repository.contarResultadosDoAluno(ana.id), 0);
    final (alunoRemovido, provasRemovidas) = backup.removidos.single;
    expect(alunoRemovido, ana.id);
    expect(provasRemovidas, [prova1, prova2]..sort());
  });

  test('excluir aluno sem resultados avisa o backup sem provas', () async {
    final ana = await repository.cadastrarAluno(nome: 'Ana Souza', turma: 'A');
    await repository.excluirAluno(ana.id);
    expect(await alunos(), isEmpty);
    final (alunoRemovido, provasRemovidas) = backup.removidos.single;
    expect(alunoRemovido, ana.id);
    expect(provasRemovidas, isEmpty);
  });

  test('falha no backup não impede editar nem excluir', () async {
    final semNuvem = AlunoRepository(db, backup: BackupAlunosFalso(falhar: true));
    final ana = await semNuvem.cadastrarAluno(nome: 'Ana Souza', turma: 'A');
    await corrigirPeloQrCode('Ana Souza', 'Turma A');

    final editada = await semNuvem.editarAluno(alunoId: ana.id, nome: 'Ana Souza', turma: 'B');
    expect(editada.turma, 'Turma B');
    await semNuvem.excluirAluno(ana.id);

    expect(await alunos(), isEmpty);
    expect(await contarLinhas(db, 'resultados'), 0);
  });

  test('alunos ordenados por turma e nome sem diferenciar maiúsculas', () async {
    await repository.cadastrarAluno(nome: 'bruno', turma: 'B');
    await repository.cadastrarAluno(nome: 'Caio', turma: 'A');
    await repository.cadastrarAluno(nome: 'ana', turma: 'A');
    expect((await alunos()).map((a) => '${a.turma}: ${a.nome}'), [
      'Turma A: ana',
      'Turma A: Caio',
      'Turma B: bruno',
    ]);
  });
}
