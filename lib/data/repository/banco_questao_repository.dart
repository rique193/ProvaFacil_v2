import 'package:drift/drift.dart';

import '../local/app_database.dart';
import '../local/relation/banco_questao_com_alternativas.dart';

class BancoQuestaoRepository {
  BancoQuestaoRepository(this._db);

  final AppDatabase _db;

  Stream<List<BancoQuestaoComAlternativas>> observarQuestoes({String? disciplina}) =>
      _db.bancoQuestaoDao.observarQuestoes(disciplina: disciplina);

  Future<BancoQuestaoComAlternativas?> buscarQuestao(int id) =>
      _db.bancoQuestaoDao.buscarQuestao(id);

  Future<int> salvarQuestao({
    int? id,
    required String disciplina,
    required String enunciado,
    required List<String> alternativas,
    required int indiceCorreta,
  }) async {
    final disciplinaLimpa = disciplina.trim();
    if (disciplinaLimpa.isEmpty) {
      throw ArgumentError('Informe a disciplina.');
    }

    final enunciadoLimpo = enunciado.trim();
    if (enunciadoLimpo.isEmpty) {
      throw ArgumentError('Preencha o enunciado.');
    }

    final alternativasLimpas = alternativas.map((a) => a.trim()).toList();
    if (alternativasLimpas.length != 5 || alternativasLimpas.any((a) => a.isEmpty)) {
      throw ArgumentError('Preencha as cinco alternativas.');
    }

    final unicas = alternativasLimpas.map((a) => a.toLowerCase()).toSet();
    if (unicas.length != 5) {
      throw ArgumentError('Alternativas repetidas.');
    }

    if (indiceCorreta < 0 || indiceCorreta > 4) {
      throw ArgumentError('Marque a alternativa correta.');
    }

    return _db.transaction(() async {
      final int questaoId;
      if (id == null) {
        questaoId = await _db.bancoQuestaoDao.inserirQuestao(
          BancoQuestoesCompanion.insert(
            disciplina: disciplinaLimpa,
            enunciado: enunciadoLimpo,
          ),
        );
      } else {
        await _db.bancoQuestaoDao.atualizarQuestao(id, disciplinaLimpa, enunciadoLimpo);
        questaoId = id;
      }

      final companions = List<BancoAlternativasCompanion>.generate(
        5,
            (i) => BancoAlternativasCompanion.insert(
          bancoQuestaoId: questaoId,
          texto: alternativasLimpas[i],
          correta: Value(i == indiceCorreta),
          ordem: i,
        ),
      );

      await _db.bancoQuestaoDao.substituirAlternativas(questaoId, companions);
      return questaoId;
    });
  }

  Future<void> excluirQuestao(int id) => _db.bancoQuestaoDao.excluirQuestao(id);
}