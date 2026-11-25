import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/data/repository/turma_repository.dart';

void main() {
  test('migração de v1 para v2 preserva provas, alunos e resultados e cria novas tabelas', () async {
    final executor = NativeDatabase.memory(
      setup: (rawDb) {
        rawDb.execute('''
          CREATE TABLE provas (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            disciplina TEXT NOT NULL,
            descricao TEXT NOT NULL DEFAULT '',
            criadaEm INTEGER NOT NULL
          );
        ''');

        rawDb.execute('''
          CREATE TABLE alunos (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            turma TEXT NOT NULL DEFAULT '',
            matricula TEXT COLLATE NOCASE,
            email TEXT
          );
        ''');

        rawDb.execute('''
          CREATE TABLE resultados (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            provaId INTEGER NOT NULL REFERENCES provas(id) ON DELETE CASCADE,
            alunoId INTEGER NOT NULL REFERENCES alunos(id) ON DELETE CASCADE,
            totalQuestoes INTEGER NOT NULL,
            acertos INTEGER NOT NULL,
            erros INTEGER NOT NULL,
            emBranco INTEGER NOT NULL,
            nota REAL NOT NULL,
            notaMaxima REAL NOT NULL,
            corrigidoEm INTEGER NOT NULL
          );
        ''');

        rawDb.execute(
          "INSERT INTO provas (id, titulo, disciplina, descricao, criadaEm) "
              "VALUES (1, 'Prova 1', 'Matemática', 'Bimestral', 1700000000000);",
        );
        rawDb.execute(
          "INSERT INTO alunos (id, nome, turma, matricula, email) "
              "VALUES (1, 'Ana Silva', 'Turma A', '2026001', 'ana@escola.com');",
        );
        rawDb.execute(
          "INSERT INTO resultados "
              "(id, provaId, alunoId, totalQuestoes, acertos, erros, emBranco, nota, notaMaxima, corrigidoEm) "
              "VALUES (1, 1, 1, 10, 8, 2, 0, 8.0, 10.0, 1700000001000);",
        );

        rawDb.execute('PRAGMA user_version = 1;');
      },
    );

    final db = AppDatabase(executor);
    addTearDown(db.close);

    // Verifica que os dados antigos da v1 continuam intactos e provas.turma recebeu ''
    final provas = await db.select(db.provas).get();
    expect(provas.length, 1);
    expect(provas.first.titulo, 'Prova 1');
    expect(provas.first.turma, '');

    final alunos = await db.select(db.alunos).get();
    expect(alunos.length, 1);
    expect(alunos.first.nome, 'Ana Silva');
    expect(alunos.first.turma, 'Turma A');

    final resultados = await db.select(db.resultados).get();
    expect(resultados.length, 1);
    expect(resultados.first.nota, 8.0);

    // Verifica que as 4 tabelas novas da v2 estão operacionais
    final turmaRepo = TurmaRepository(db);
    final disciplinaRepo = DisciplinaRepository(db);
    final bancoRepo = BancoQuestaoRepository(db);

    await turmaRepo.salvar('A');
    await disciplinaRepo.salvar('Matemática');
    final questaoId = await bancoRepo.salvarQuestao(
      disciplina: 'Matemática',
      enunciado: 'Quanto é 1 + 1?',
      alternativas: ['1', '2', '3', '4', '5'],
      indiceCorreta: 1,
    );

    expect((await turmaRepo.observarTodas().first).single.nome, 'Turma A');
    expect((await disciplinaRepo.observarTodas().first).single.nome, 'Matemática');
    expect((await bancoRepo.buscarQuestao(questaoId))?.alternativas.length, 5);
  });
}