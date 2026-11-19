import 'package:drift/drift.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/gabarito_mapper.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/correcao/corretor_prova.dart';
import 'package:provafacil/domain/model/questao_input.dart';

/// Cria uma prova com uma questão por letra de [gabarito] (5 alternativas cada) e salva o gabarito.
Future<int> criarProvaComGabarito(
  AppDatabase db, {
  required List<String> gabarito,
  String titulo = 'Prova',
  String disciplina = 'Matemática',
}) async {
  final provas = ProvaRepository(db);
  final provaId = await provas.salvarConteudoProva(
    provaId: null,
    titulo: titulo,
    disciplina: disciplina,
    descricao: '',
    questoes: [
      for (var i = 1; i <= gabarito.length; i++)
        QuestaoInput(
          enunciado: 'Q$i',
          alternativas: [for (var n = 1; n <= 5; n++) AlternativaInput(texto: 'Alternativa $n')],
        ),
    ],
  );
  final questoes = await db.provaDao.listarQuestoesComAlternativas(provaId);
  await provas.salvarGabarito(provaId, {
    for (final (indice, questao) in questoes.indexed)
      questao.questao.id: ([
        ...questao.alternativas,
      ]..sort((a, b) => a.ordem.compareTo(b.ordem)))[gabarito[indice].codeUnitAt(0) - 65].id,
  });
  return provaId;
}

/// Grava a correção de uma folha direto no banco, com os mesmos passos do
/// `ResultadoRepository.corrigirESalvar` (Membro 4): acha o aluno por nome + turma (ou cria),
/// apaga o resultado anterior dele na prova e grava o novo resultado com as respostas.
///
/// Provisório: troque pelo `ResultadoRepository` quando ele entrar na `main`.
Future<int> gravarCorrecao(
  AppDatabase db, {
  required int provaId,
  required String nome,
  required String turma,
  required Map<int, Set<String>> respostas,
}) => db.transaction(() async {
  final gabarito = (await db.provaDao.listarQuestoesComAlternativas(provaId)).paraGabarito();
  final aluno = await db.alunoDao.buscarPorNomeETurma(nome, turma);
  final alunoId =
      aluno?.id ??
      await db.into(db.alunos).insert(AlunosCompanion.insert(nome: nome, turma: Value(turma)));
  await (db.delete(
    db.resultados,
  )..where((r) => r.provaId.equals(provaId) & r.alunoId.equals(alunoId))).go();

  final corrigidas = [
    for (final questao in gabarito) (questao, ([...?respostas[questao.numero]]..sort()).join()),
  ];
  final situacoes = [
    for (final (questao, marcadas) in corrigidas) _situacao(marcadas, questao.letraCorreta),
  ];
  final acertos = situacoes.where((s) => s == SituacaoQuestao.acerto).length;
  final emBranco = situacoes.where((s) => s == SituacaoQuestao.emBranco).length;

  final resultadoId = await db
      .into(db.resultados)
      .insert(
        ResultadosCompanion.insert(
          provaId: provaId,
          alunoId: alunoId,
          totalQuestoes: gabarito.length,
          acertos: acertos,
          erros: gabarito.length - acertos - emBranco,
          emBranco: emBranco,
          nota: acertos * 10 / gabarito.length,
          notaMaxima: 10,
        ),
      );
  for (final (indice, (questao, marcadas)) in corrigidas.indexed) {
    await db
        .into(db.respostasAluno)
        .insert(
          RespostasAlunoCompanion.insert(
            resultadoId: resultadoId,
            questaoId: questao.questaoId,
            numeroQuestao: questao.numero,
            letrasMarcadas: marcadas,
            letraCorreta: questao.letraCorreta ?? '',
            situacao: situacoes[indice],
          ),
        );
  }
  return resultadoId;
});

SituacaoQuestao _situacao(String marcadas, String? letraCorreta) => switch (marcadas.length) {
  0 => SituacaoQuestao.emBranco,
  > 1 => SituacaoQuestao.marcacaoMultipla,
  _ => marcadas == letraCorreta ? SituacaoQuestao.acerto : SituacaoQuestao.erro,
};

/// Quantas linhas a [tabela] tem.
Future<int> contarLinhas(AppDatabase db, String tabela) => db
    .customSelect('SELECT COUNT(*) AS total FROM $tabela')
    .map((linha) => linha.read<int>('total'))
    .getSingle();
