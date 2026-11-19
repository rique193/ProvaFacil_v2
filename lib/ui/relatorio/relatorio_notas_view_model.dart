import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/exportacao/exportador_relatorio.dart';
import '../../data/exportacao/nome_arquivo_relatorio.dart';
import '../../data/local/app_database.dart';
import '../../data/repository/historico_repository.dart';
import '../../domain/historico/ordenacao_relatorio.dart';
import '../../domain/historico/resumo_notas.dart';
import '../../util/mensagem_erro.dart';
import 'relatorio_ui_state.dart';

/// ViewModel da tela de Relatório de Notas de uma prova.
class RelatorioNotasViewModel extends ChangeNotifier {
  RelatorioNotasViewModel({
    required HistoricoRepository repository,
    required this._exportador,
    required this._provaId,
  }) {
    _inscricao = Rx.combineLatest2(
      repository.observarProva(_provaId),
      repository.observarNotasDaProva(_provaId),
      (prova, notas) => (prova, notas),
    ).listen((par) {
      final prova = par.$1;
      final notas = par.$2;

      _linhasBase = notas.map((nota) {
        return LinhaRelatorioUiState(
          alunoId: nota.alunoId,
          nome: nota.nome,
          matricula: nota.matricula,
          acertos: nota.acertos,
          nota: nota.nota,
        );
      }).toList();

      final resumo = ResumoNotas.de(_linhasBase.map((it) => it.nota).toList());

      _atualizar((estado) {
        return estado.copyWith(
          carregando: false,
          tituloProva: prova?.titulo ?? '',
          linhas: ordenarLinhas(
            _linhasBase,
            estado.colunaOrdenacao,
            estado.direcaoOrdenacao,
          ),
          mediaDaTurma: resumo.media,
          maiorNota: resumo.maiorNota,
          menorNota: resumo.menorNota,
        );
      });
    });
  }

  final ExportadorRelatorio _exportador;
  final int _provaId;

  StreamSubscription<dynamic>? _inscricao;
  bool _descartado = false;
  List<LinhaRelatorioUiState> _linhasBase = [];

  RelatorioNotasUiState _uiState = const RelatorioNotasUiState();
  RelatorioNotasUiState get uiState => _uiState;

  void _atualizar(RelatorioNotasUiState Function(RelatorioNotasUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  void ordenarPor(ColunaOrdenacao coluna) {
    _atualizar((estado) {
      final novaDirecao = estado.colunaOrdenacao == coluna
          ? estado.direcaoOrdenacao.invertida()
          : DirecaoOrdenacao.ascendente;

      return estado.copyWith(
        colunaOrdenacao: coluna,
        direcaoOrdenacao: novaDirecao,
        linhas: ordenarLinhas(_linhasBase, coluna, novaDirecao),
      );
    });
  }

  /// Nome sugerido no seletor de arquivos, ex.: "Prova_1_28-10-2026.csv".
  String nomeSugeridoArquivo() =>
      nomeArquivoRelatorio(_uiState.tituloProva, DateTime.now().millisecondsSinceEpoch);

  /// Gera o relatório e entrega os bytes para [salvarArquivo], que pergunta ao professor onde
  /// salvar e devolve o caminho escolhido (ou `null` se ele cancelar).
  ///
  /// Roda na isolate principal: o banco (Drift) não pode ser enviado para outra isolate.
  Future<void> exportar(
    Future<String?> Function(String nomeArquivo, Uint8List bytes) salvarArquivo,
  ) async {
    if (!_uiState.podeExportar) return;
    _atualizar((estado) => estado.copyWith(exportando: true));

    String? mensagem;
    try {
      final nomeArquivo = nomeSugeridoArquivo();
      final bytes = await _exportador.exportar(_provaId);
      final caminho = await salvarArquivo(nomeArquivo, bytes);
      if (caminho != null) mensagem = 'Relatório exportado: $nomeArquivo';
    } catch (e) {
      mensagem = 'Não foi possível exportar: ${mensagemDoErro(e) ?? e.runtimeType}';
    }

    _atualizar((estado) => estado.copyWith(exportando: false, mensagem: mensagem));
  }

  void mensagemExibida() {
    _atualizar((estado) => estado.copyWith(mensagem: null));
  }

  @override
  void dispose() {
    _descartado = true;
    _inscricao?.cancel();
    super.dispose();
  }

  static ViewModelProviderFactory<RelatorioNotasViewModel> factory(int provaId) {
    return (BuildContext context) {
      final database = context.read<AppDatabase>();
      return RelatorioNotasViewModel(
        repository: HistoricoRepository(database),
        exportador: ExportadorRelatorio(database),
        provaId: provaId,
      );
    };
  }
}

typedef ViewModelProviderFactory<T extends ChangeNotifier> = T Function(BuildContext context);
