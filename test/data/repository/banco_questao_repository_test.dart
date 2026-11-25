import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/banco_questao_repository.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late BancoQuestaoRepository repository;

  const alternativasValidas = ['A1', 'B2', 'C3', 'D4', 'E5'];

  setUp(() {
    db = criarBancoEmMemoria();
    repository = BancoQuestaoRepository(db);
  });

  tearDown(() => db.close());

  test('salva, busca, filtra por disciplina e ordena mais recentes primeiro', () async {
    final id1 = await repository.salvarQuestao(
      disciplina: 'Matemática',
      enunciado: 'Quanto é 2+2?',
      alternativas: alternativasValidas,
      indiceCorreta: 1,
    );
    final id2 = await repository.salvarQuestao(
      disciplina: 'Física',
      enunciado: 'Qual a unidade de força?',
      alternativas: alternativasValidas,
      indiceCorreta: 0,
    );

    final todas = await repository.observarQuestoes().first;
    expect(todas.map((q) => q.questao.id).toList(), [id2, id1]);

    final soMat = await repository.observarQuestoes(disciplina: 'Matemática').first;
    expect(soMat.length, 1);
    expect(soMat.first.questao.id, id1);

    final buscada = await repository.buscarQuestao(id1);
    expect(buscada, isNotNull);
    expect(buscada!.alternativas.map((a) => a.ordem).toList(), [0, 1, 2, 3, 4]);
    expect(buscada.alternativas[1].correta, isTrue);
  });

  test('edição substitui as alternativas', () async {
    final id = await repository.salvarQuestao(
      disciplina: 'Química',
      enunciado: 'Antigo',
      alternativas: alternativasValidas,
      indiceCorreta: 0,
    );

    await repository.salvarQuestao(
      id: id,
      disciplina: 'Química',
      enunciado: 'Novo enunciado',
      alternativas: ['N1', 'N2', 'N3', 'N4', 'N5'],
      indiceCorreta: 4,
    );

    final atualizada = await repository.buscarQuestao(id);
    expect(atualizada!.questao.enunciado, 'Novo enunciado');
    expect(atualizada.alternativas.map((a) => a.texto).toList(), ['N1', 'N2', 'N3', 'N4', 'N5']);
    expect(atualizada.alternativas[4].correta, isTrue);
    expect(atualizada.alternativas.where((a) => a.correta).length, 1);
  });

  test('exclui questão e alternativas em cascata', () async {
    final id = await repository.salvarQuestao(
      disciplina: 'História',
      enunciado: 'Pergunta',
      alternativas: alternativasValidas,
      indiceCorreta: 2,
    );

    await repository.excluirQuestao(id);

    expect(await repository.buscarQuestao(id), isNull);
    final altsRestantes = await db.select(db.bancoAlternativas).get();
    expect(altsRestantes, isEmpty);
  });

  test('valida campos obrigatórios e regras de negócio', () async {
    expect(
          () => repository.salvarQuestao(
        disciplina: '',
        enunciado: 'E',
        alternativas: alternativasValidas,
        indiceCorreta: 0,
      ),
      throwsA(isA<ArgumentError>().having((e) => e.message, 'message', 'Informe a disciplina.')),
    );
    expect(
          () => repository.salvarQuestao(
        disciplina: 'Mat',
        enunciado: '  ',
        alternativas: alternativasValidas,
        indiceCorreta: 0,
      ),
      throwsA(isA<ArgumentError>().having((e) => e.message, 'message', 'Preencha o enunciado.')),
    );
    expect(
          () => repository.salvarQuestao(
        disciplina: 'Mat',
        enunciado: 'E',
        alternativas: ['A', 'B', 'C', 'D'],
        indiceCorreta: 0,
      ),
      throwsA(
        isA<ArgumentError>().having((e) => e.message, 'message', 'Preencha as cinco alternativas.'),
      ),
    );
    expect(
          () => repository.salvarQuestao(
        disciplina: 'Mat',
        enunciado: 'E',
        alternativas: ['A', 'a', 'C', 'D', 'E'],
        indiceCorreta: 0,
      ),
      throwsA(isA<ArgumentError>().having((e) => e.message, 'message', 'Alternativas repetidas.')),
    );
    expect(
          () => repository.salvarQuestao(
        disciplina: 'Mat',
        enunciado: 'E',
        alternativas: alternativasValidas,
        indiceCorreta: 5,
      ),
      throwsA(
        isA<ArgumentError>().having((e) => e.message, 'message', 'Marque a alternativa correta.'),
      ),
    );
  });
}