import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/estatisticas/estatisticas_prova.dart';
import '../local/app_database.dart';
import '../local/dao/historico_dao.dart';
import '../local/relation/historico_relacoes.dart';

part 'estatisticas_repository.freezed.dart';

/// Tudo o que a tela de Estatísticas precisa de uma prova, lido do banco.
@freezed
abstract class DadosEstatisticasProva with _$DadosEstatisticasProva {
  const factory DadosEstatisticasProva({
    required ProvaEntity? prova,

    /// Turmas separadas por vírgula, como vêm do `GROUP_CONCAT`.
    required String? turmas,
    required List<NotaAluno> notas,
    required List<QuestaoDaProva> questoes,
    required List<RespostaRegistrada> respostas,
  }) = _DadosEstatisticasProva;
}

/// Dados das estatísticas de uma prova, lidos dos resultados e respostas que a correção grava.
/// Só leitura; os cálculos ficam em `EstatisticasProva`.
class EstatisticasRepository {
  EstatisticasRepository(AppDatabase database) : _dao = database.historicoDao;

  final HistoricoDao _dao;

  Stream<DadosEstatisticasProva> observarDadosDaProva(int provaId) => Rx.combineLatest5(
    _dao.observarProva(provaId),
    _dao.observarTurmasDaProva(provaId),
    _dao.observarNotasDaProva(provaId),
    _dao.observarQuestoesDaProva(provaId),
    _dao.observarRespostasDaProva(provaId),
        (prova, turmas, notas, questoes, respostas) => DadosEstatisticasProva(
      prova: prova,
      turmas: turmas,
      notas: notas,
      questoes: questoes,
      respostas: respostas,
    ),
  );
}