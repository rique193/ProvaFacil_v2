import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';
import 'package:provafacil/data/repository/disciplina_repository.dart';
import 'package:provafacil/data/repository/turma_repository.dart';

Future<List<int>> cadastrarQuestoesBanco(
  AppDatabase db, {
  int quantidade = 6,
  String disciplina = 'Matemática',
}) async {
  final banco = BancoQuestaoRepository(db);
  return [
    for (var i = 1; i <= quantidade; i++)
      await banco.salvarQuestao(
        disciplina: disciplina,
        enunciado: 'Questão $i de $disciplina',
        alternativas: [for (var a = 0; a < 5; a++) 'Resposta $i.$a'],
        indiceCorreta: i % 5,
      ),
  ];
}

Future<void> cadastrarTurmaEDisciplinas(AppDatabase db) async {
  await TurmaRepository(db).salvar('A');
  await DisciplinaRepository(db).salvar('Matemática');
  await DisciplinaRepository(db).salvar('História');
}

Future<void> esperarEstado(ChangeNotifier vm, bool Function() pronto) {
  if (pronto()) return Future<void>.value();
  final fim = Completer<void>();
  void conferir() {
    if (pronto() && !fim.isCompleted) fim.complete();
  }

  vm.addListener(conferir);
  return fim.future
      .timeout(const Duration(seconds: 5))
      .whenComplete(() => vm.removeListener(conferir));
}
