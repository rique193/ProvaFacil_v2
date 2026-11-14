import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/local/relation/questao_com_alternativas.dart';
import 'package:provafacil/data/repository/gabarito_mapper.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';

import '../../ajudantes/banco_em_memoria.dart';

void main() {
  late AppDatabase db;
  late ProvaRepository repository;

  setUp(() {
    db = criarBancoEmMemoria();
    repository = ProvaRepository(db);
  });

  tearDown(() => db.close());

  QuestaoInput nova(String enunciado) => QuestaoInput(
    enunciado: enunciado,
    alternativas: [for (var i = 1; i <= 5; i++) AlternativaInput(texto: 'Alternativa $i')],
  );

  QuestaoInput input(QuestaoComAlternativas q) => QuestaoInput(
    enunciado: q.questao.enunciado,
    id: q.questao.id,
    alternativas: [
      for (final a in [...q.alternativas]..sort((x, y) => x.ordem.compareTo(y.ordem)))
        AlternativaInput(texto: a.texto, id: a.id),
    ],
  );

  List<AlternativaEntity> ordenadas(QuestaoComAlternativas q) =>
      [...q.alternativas]..sort((x, y) => x.ordem.compareTo(y.ordem));

  Future<List<QuestaoComAlternativas>> questoes(int id) async {
    final prova = await repository.observarProva(id).first;
    return [...prova!.questoes]..sort((a, b) => a.questao.ordem.compareTo(b.questao.ordem));
  }

  Future<int> criar() => repository.salvarConteudoProva(
    provaId: null,
    titulo: 'Prova',
    disciplina: 'Matemática',
    descricao: '',
    questoes: [nova('Q1'), nova('Q2'), nova('Q3')],
  );

  Future<void> rejeita(Future<void> Function() bloco) => expectLater(bloco(), throwsArgumentError);

  test('remover questão do meio preserva identidade, gabarito e ordem', () async {
    final id = await criar();
    final originais = await questoes(id);
    await repository.salvarGabarito(id, {
      for (final q in originais) q.questao.id: ordenadas(q)[2].id,
    });
    await repository.salvarConteudoProva(
      provaId: id,
      titulo: 'Editada',
      disciplina: 'Matemática',
      descricao: '',
      questoes: [input(originais[0]), input(originais[2]), nova('Q4')],
    );
    final salvas = await questoes(id);
    expect(salvas.map((q) => q.questao.enunciado), ['Q1', 'Q3', 'Q4']);
    expect(salvas.map((q) => q.questao.ordem), [0, 1, 2]);
    expect(salvas[1].questao.id, originais[2].questao.id);
    expect(salvas.paraGabarito().map((q) => q.letraCorreta), ['C', 'C', null]);
    expect(salvas.fold<int>(0, (soma, q) => soma + q.alternativas.length), 15);
  });

  test('gabarito incompleto ou com alternativa de outra questão não altera o banco', () async {
    final id = await criar();
    final qs = await questoes(id);
    final respostas = {for (final q in qs) q.questao.id: q.alternativas.first.id};
    await repository.salvarGabarito(id, respostas);
    await rejeita(() => repository.salvarGabarito(id, {...respostas}..remove(qs.last.questao.id)));
    await rejeita(
      () => repository.salvarGabarito(id, {
        ...respostas,
        qs[0].questao.id: qs[1].alternativas.first.id,
      }),
    );
    expect({
      for (final q in await questoes(id))
        q.questao.id: q.alternativas.singleWhere((a) => a.correta).id,
    }, respostas);
  });

  test(
    'corrigir usa somente o gabarito da prova selecionada',
    () {},
    skip: 'Depende de ResultadoRepository.corrigirESalvar (Membro 4)',
  );

  test('conteúdo inválido ou questão de outra prova reverte a edição', () async {
    final id = await criar();
    final outra = await criar();
    final questaoDaOutra = (await questoes(outra))[0];
    await rejeita(
      () => repository.salvarConteudoProva(
        provaId: id,
        titulo: 'Título alterado',
        disciplina: 'Matemática',
        descricao: '',
        questoes: [input(questaoDaOutra)],
      ),
    );
    expect((await repository.observarProva(id).first)!.prova.titulo, 'Prova');
    await rejeita(
      () => repository.salvarConteudoProva(
        provaId: null,
        titulo: '',
        disciplina: 'Matemática',
        descricao: '',
        questoes: [nova('Q')],
      ),
    );
    await rejeita(
      () => repository.salvarConteudoProva(
        provaId: id,
        titulo: 'Prova',
        disciplina: 'Matemática',
        descricao: '',
        questoes: [nova('Q').copyWith(alternativas: [])],
      ),
    );
    expect(await questoes(id), hasLength(3));
  });
}
