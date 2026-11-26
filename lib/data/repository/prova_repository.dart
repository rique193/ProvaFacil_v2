import 'dart:math';

import 'package:drift/drift.dart';

import '../../domain/model/questao_input.dart';
import '../../domain/prova/embaralhador.dart';
import '../local/app_database.dart';
import '../local/dao/prova_dao.dart';
import '../local/relation/prova_com_questoes.dart';
import '../local/relation/banco_questao_com_alternativas.dart';

/// Fonte única de verdade para provas/gabaritos, usada pelas ViewModels da feature de
/// cadastro de provas.
class ProvaRepository {
  ProvaRepository(this._database) : _dao = _database.provaDao;

  final AppDatabase _database;
  final ProvaDao _dao;

  Stream<List<ProvaComQuestoes>> observarProvas() => _dao.observarProvas();

  Stream<ProvaComQuestoes?> observarProva(int provaId) => _dao.observarProva(provaId);

  /// Copia o banco para uma prova independente, já na ordem definitiva do PDF e da correção.
  Future<int> gerarProvaDoBanco({
    required String titulo,
    required String disciplina,
    required String turma,
    String descricao = '',
    required List<int> bancoQuestaoIds,
    required bool embaralharQuestoes,
    required bool embaralharAlternativas,
    Random? random,
  }) {
    // O chamador pode mudar sua seleção enquanto a transação aguarda o banco.
    final ids = List<int>.of(bancoQuestaoIds);
    return _database.transaction(() async {
      _exigir(titulo.trim().isNotEmpty, 'Informe o título da prova.');
      _exigir(disciplina.trim().isNotEmpty, 'Informe a disciplina.');
      _exigir(turma.trim().isNotEmpty, 'Informe a turma.');
      _exigir(ids.isNotEmpty, 'Selecione ao menos uma questão do banco.');
      _exigir(ids.toSet().length == ids.length, 'Questões repetidas.');

      final questoes = <BancoQuestaoComAlternativas>[];
      for (final id in ids) {
        final questao = await _database.bancoQuestaoDao.buscarQuestao(id);
        _exigir(questao != null, 'Questão não encontrada no banco.');
        final encontrada = questao!;
        _exigir(
          encontrada.questao.disciplina == disciplina.trim(),
          'Selecione somente questões da disciplina escolhida.',
        );
        _exigir(
          encontrada.alternativas.length == 5 &&
              encontrada.alternativas.every((a) => a.texto.trim().isNotEmpty),
          'Preencha as cinco alternativas de cada questão do banco.',
        );
        _exigir(
          encontrada.alternativas.where((a) => a.correta).length == 1,
          'Defina uma alternativa correta para cada questão do banco.',
        );
        questoes.add(encontrada);
      }

      final sorteio = random ?? Random();
      final ordenadas = embaralharQuestoes
          ? Embaralhador.embaralhar(questoes, sorteio)
          : questoes;
      final provaId = await _dao.inserirProva(
        ProvasCompanion.insert(
          titulo: titulo.trim(),
          disciplina: disciplina.trim(),
          turma: Value(turma.trim()),
          descricao: Value(descricao.trim()),
        ),
      );
      for (final (ordem, origem) in ordenadas.indexed) {
        final questaoId = await _dao.inserirQuestao(
          QuestoesCompanion.insert(
            provaId: provaId,
            enunciado: origem.questao.enunciado,
            ordem: ordem,
          ),
        );
        final originais = [...origem.alternativas]
          ..sort((a, b) => a.ordem.compareTo(b.ordem));
        final alternativas = embaralharAlternativas
            ? Embaralhador.embaralhar(originais, sorteio)
            : originais;
        await _dao.inserirAlternativas([
          for (final (indice, alternativa) in alternativas.indexed)
            AlternativasCompanion.insert(
              questaoId: questaoId,
              texto: alternativa.texto,
              correta: alternativa.correta,
              ordem: indice,
            ),
        ]);
      }
      return provaId;
    });
  }

  /// Atualiza por identidade, preservando o gabarito das questões que permanecem.
  Future<int> salvarConteudoProva({
    required int? provaId,
    required String titulo,
    required String disciplina,
    required String descricao,
    required List<QuestaoInput> questoes,
  }) => _database.transaction(() async {
    _exigir(titulo.trim().isNotEmpty, 'Informe o título da prova.');
    _exigir(disciplina.trim().isNotEmpty, 'Informe a disciplina.');
    _exigir(questoes.isNotEmpty, 'Adicione ao menos uma questão.');
    _exigir(_semRepetidos(questoes.map((q) => q.id)), 'Questões repetidas.');
    for (final questao in questoes) {
      _exigir(questao.enunciado.trim().isNotEmpty, 'Preencha o enunciado das questões.');
      _exigir(
        questao.alternativas.length == 5 &&
            questao.alternativas.every((a) => a.texto.trim().isNotEmpty),
        'Preencha as cinco alternativas de cada questão.',
      );
      _exigir(_semRepetidos(questao.alternativas.map((a) => a.id)), 'Alternativas repetidas.');
    }

    final int idFinal;
    if (provaId == null) {
      idFinal = await _dao.inserirProva(
        ProvasCompanion.insert(
          titulo: titulo.trim(),
          disciplina: disciplina.trim(),
          descricao: Value(descricao.trim()),
        ),
      );
    } else {
      final alteradas = await _dao.atualizarProva(
        provaId,
        titulo.trim(),
        disciplina.trim(),
        descricao.trim(),
      );
      _exigir(alteradas == 1, 'Prova não encontrada.');
      idFinal = provaId;
    }

    final existentes = {
      for (final q in await _dao.listarQuestoesComAlternativas(idFinal)) q.questao.id: q,
    };
    for (final (indice, input) in questoes.indexed) {
      final existente = input.id == null ? null : existentes[input.id];
      if (input.id != null) _exigir(existente != null, 'Questão não pertence à prova.');

      final int questaoId;
      if (existente != null) {
        await _dao.atualizarEnunciadoDaQuestao(
          existente.questao.id,
          input.enunciado.trim(),
          indice,
        );
        questaoId = existente.questao.id;
      } else {
        questaoId = await _dao.inserirQuestao(
          QuestoesCompanion.insert(
            provaId: idFinal,
            enunciado: input.enunciado.trim(),
            ordem: indice,
          ),
        );
      }

      final alternativas = {for (final a in existente?.alternativas ?? const []) a.id: a};
      for (final (ordem, alternativa) in input.alternativas.indexed) {
        final alternativaId = alternativa.id;
        if (alternativaId != null) {
          _exigir(alternativas.containsKey(alternativaId), 'Alternativa não pertence à questão.');
          await _dao.atualizarTextoDaAlternativa(alternativaId, alternativa.texto.trim(), ordem);
        } else {
          await _dao.inserirAlternativas([
            AlternativasCompanion.insert(
              questaoId: questaoId,
              texto: alternativa.texto.trim(),
              correta: false,
              ordem: ordem,
            ),
          ]);
        }
      }
      final alternativasMantidas = input.alternativas.map((a) => a.id).nonNulls.toSet();
      for (final id in alternativas.keys.where((id) => !alternativasMantidas.contains(id))) {
        await _dao.deletarAlternativaPorId(id);
      }
    }

    final questoesMantidas = questoes.map((q) => q.id).nonNulls.toSet();
    for (final id in existentes.keys.where((id) => !questoesMantidas.contains(id))) {
      await _dao.deletarQuestaoPorId(id);
    }
    return idFinal;
  });

  Future<void> excluirProva(ProvaEntity prova) => _dao.deletarProva(prova);

  /// Define, para cada questão informada, qual alternativa é a correta. [respostas] mapeia
  /// o id da questão para o id da alternativa marcada como certa.
  Future<void> salvarGabarito(int provaId, Map<int, int> respostas) => _database.transaction(
    () async {
      final questoes = await _dao.listarQuestoesComAlternativas(provaId);
      _exigir(questoes.isNotEmpty, 'Prova não encontrada ou sem questões.');
      final idsDaProva = questoes.map((q) => q.questao.id).toSet();
      _exigir(
        respostas.length == idsDaProva.length && idsDaProva.containsAll(respostas.keys),
        'Defina a resposta correta de todas as questões. Reabra o gabarito se a prova foi editada.',
      );
      for (final questao in questoes) {
        final alternativaId = respostas[questao.questao.id];
        _exigir(
          questao.alternativas.any((a) => a.id == alternativaId),
          'Alternativa não pertence à questão.',
        );
      }
      for (final MapEntry(key: questaoId, value: alternativaId) in respostas.entries) {
        await _dao.limparAlternativaCorretaDaQuestao(questaoId);
        await _dao.marcarAlternativaComoCorreta(alternativaId);
      }
    },
  );

  static void _exigir(bool condicao, String mensagem) {
    if (!condicao) throw ArgumentError(mensagem);
  }

  static bool _semRepetidos(Iterable<int?> ids) {
    final preenchidos = ids.nonNulls.toList();
    return preenchidos.length == preenchidos.toSet().length;
  }
}
