import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/historico_repository.dart';
import 'package:provafacil/domain/prova/status_prova.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late HistoricoRepository repo;
  late int provaId;
  late List<int> alunos;

  setUp(() async {
    db = criarBancoEmMemoria();
    repo = HistoricoRepository(db);
    provaId = await db
        .into(db.provas)
        .insert(
          ProvasCompanion.insert(
            titulo: 'P',
            disciplina: 'D',
            turma: const Value('Turma A'),
          ),
        );
    alunos = [
      for (final (nome, turma) in [
        ('Ana', 'Turma A'),
        ('Bia', 'turma a'),
        ('Caio', 'Turma A'),
        ('Duda', 'Turma B'),
      ])
        await db
            .into(db.alunos)
            .insert(AlunosCompanion.insert(nome: nome, turma: Value(turma))),
    ];
  });

  tearDown(() => db.close());

  Future<void> corrigir(int alunoId) => db
      .into(db.resultados)
      .insert(
        ResultadosCompanion.insert(
          provaId: provaId,
          alunoId: alunoId,
          totalQuestoes: 2,
          acertos: 1,
          erros: 1,
          emBranco: 0,
          nota: 5,
          notaMaxima: 10,
        ),
      )
      .then((_) {});

  test('0, 1 e 3 corrigidos, atualizando sozinho', () async {
    // Uma única assinatura aberta o tempo todo: cada correção salva tem que chegar nela.
    final recebidos = <(int, int, StatusProva)>[];
    final assinatura = repo.observarProgressoProvas().listen((lista) {
      final p = lista.single;
      recebidos.add((p.totalAlunosTurma, p.totalCorrigidos, p.status));
    });
    addTearDown(assinatura.cancel);

    Future<void> esperarCorrigidos(int total) async {
      for (
        var i = 0;
        i < 100 && (recebidos.isEmpty || recebidos.last.$2 != total);
        i++
      ) {
        await Future<void>.delayed(const Duration(milliseconds: 20));
      }
      expect(recebidos.last.$2, total);
    }

    await esperarCorrigidos(0);
    expect(recebidos.last, (3, 0, StatusProva.pendente));

    await corrigir(alunos[0]);
    await esperarCorrigidos(1);
    expect(recebidos.last, (3, 1, StatusProva.emCorrecao));

    await corrigir(alunos[1]);
    await corrigir(alunos[2]);
    await esperarCorrigidos(3);
    expect(recebidos.last, (3, 3, StatusProva.corrigida));
  });

  test('alunos pendentes são os da turma sem resultado', () async {
    expect(
      (await repo.observarAlunosPendentes(provaId).first).map((a) => a.nome),
      ['Ana', 'Bia', 'Caio'],
    );
    await corrigir(alunos[1]);
    expect(
      (await repo.observarAlunosPendentes(provaId).first).map((a) => a.nome),
      ['Ana', 'Caio'],
    );
  });

  test(
    'prova sem turma: 0 alunos na turma, status só pelos resultados',
    () async {
      final semTurma = await db
          .into(db.provas)
          .insert(ProvasCompanion.insert(titulo: 'S', disciplina: 'D'));
      var lista = await repo.observarProgressoProvas().first;
      var p = lista.firstWhere((e) => e.provaId == semTurma);
      expect((p.totalAlunosTurma, p.status), (0, StatusProva.pendente));
      expect(await repo.observarAlunosPendentes(semTurma).first, isEmpty);

      await db
          .into(db.resultados)
          .insert(
            ResultadosCompanion.insert(
              provaId: semTurma,
              alunoId: alunos[3],
              totalQuestoes: 1,
              acertos: 1,
              erros: 0,
              emBranco: 0,
              nota: 10,
              notaMaxima: 10,
            ),
          );
      lista = await repo.observarProgressoProvas().first;
      p = lista.firstWhere((e) => e.provaId == semTurma);
      expect(p.status, StatusProva.corrigida);
    },
  );
}
