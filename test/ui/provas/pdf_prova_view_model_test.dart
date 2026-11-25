import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/aluno_repository.dart';
import 'package:provafacil/ui/provas/pdf/pdf_prova_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late PdfProvaViewModel viewModel;

  setUp(() async {
    db = criarBancoEmMemoria();
    viewModel = PdfProvaViewModel(AlunoRepository(db));
    for (final (nome, turma) in [('Ana', 'Turma A'), ('Bia', 'Turma A'), ('Caio', 'Turma B')]) {
      await db.into(db.alunos).insert(AlunosCompanion.insert(nome: nome, turma: Value(turma)));
    }
  });

  tearDown(() => db.close());

  ProvaEntity prova(String turma) => ProvaEntity(
    id: 1,
    titulo: 'P',
    disciplina: 'D',
    descricao: '',
    criadaEm: 0,
    turma: turma,
  );

  test('lista só os alunos da turma da prova', () async {
    final alunos = await viewModel.alunosDaProva(prova('turma a'));
    expect(alunos.map((a) => a.nome), ['Ana', 'Bia']);
  });

  test('prova sem turma lista todos os alunos', () async {
    expect((await viewModel.alunosDaProva(prova(''))).length, 3);
  });

  test('turma sem alunos devolve lista vazia', () async {
    expect(await viewModel.alunosDaProva(prova('Turma Z')), isEmpty);
  });
}
