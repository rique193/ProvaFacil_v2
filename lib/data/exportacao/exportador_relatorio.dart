import 'dart:typed_data';

import '../../domain/estatisticas/estatisticas_prova.dart';
import '../../domain/historico/formato_turmas.dart';
import '../local/app_database.dart';
import '../local/dao/historico_dao.dart';
import '../repository/estatisticas_repository.dart';
import 'gerador_planilha_xlsx.dart';
import 'planilha_relatorio.dart';

/// Exporta o relatório de uma prova para .xlsx: lê os resultados e respostas gravados, monta as abas
/// ([PlanilhaRelatorio]) e gera o arquivo ([GeradorPlanilhaXlsx]).
///
/// Roda na isolate principal: o banco (Drift) não pode ser enviado para outra isolate.
class ExportadorRelatorio {
  ExportadorRelatorio(AppDatabase database)
    : _historicoDao = database.historicoDao,
      _estatisticas = EstatisticasRepository(database);

  final HistoricoDao _historicoDao;
  final EstatisticasRepository _estatisticas;

  /// Devolve os bytes do .xlsx da prova [provaId]. [exportadoEm] é a data da exportação em
  /// milissegundos (agora, por padrão).
  Future<Uint8List> exportar(int provaId, {int? exportadoEm}) async {
    final dados = await _estatisticas.observarDadosDaProva(provaId).first;
    final resultados = await _historicoDao.listarResultadosParaExportacao(provaId);
    final abas = PlanilhaRelatorio.montar(
      DadosRelatorioExportacao(
        tituloProva: dados.prova?.titulo ?? '',
        disciplina: dados.prova?.disciplina ?? '',
        turmas: formatarTurmas(dados.turmas),
        resultados: resultados,
        estatisticas: EstatisticasProva.calcular(dados.questoes, dados.respostas),
      ),
      _formatarData(exportadoEm ?? DateTime.now().millisecondsSinceEpoch),
    );
    return GeradorPlanilhaXlsx.escrever(abas);
  }

  /// Data no formato dd/MM/yyyy, no fuso do aparelho.
  static String _formatarData(int milissegundos) {
    final data = DateTime.fromMillisecondsSinceEpoch(milissegundos);
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    return '$dia/$mes/${data.year.toString().padLeft(4, '0')}';
  }
}
