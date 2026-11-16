import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../data/local/app_database.dart';
import '../../data/repository/estatisticas_repository.dart';
import '../../domain/estatisticas/estatistica_questao.dart';
import '../../domain/estatisticas/estatisticas_prova.dart';
import '../../domain/historico/resumo_notas.dart';
import '../../domain/historico/formato_turmas.dart';
import 'estatisticas_ui_state.dart';

class EstatisticasViewModel extends ChangeNotifier {
  EstatisticasViewModel({
    required EstatisticasRepository repository,
    required int provaId,
  }) : _repository = repository,
        _provaId = provaId {
    _inscricao = _repository.observarDadosDaProva(_provaId).listen(calcularEstatisticas);
  }

  final EstatisticasRepository _repository;
  final int _provaId;
  StreamSubscription<dynamic>? _inscricao;
  bool _descartado = false;

  EstatisticasUiState _uiState = const EstatisticasUiState();
  EstatisticasUiState get uiState => _uiState;

  void _atualizar(EstatisticasUiState Function(EstatisticasUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  void calcularEstatisticas(DadosEstatisticasProva dados) {
    final resumo = ResumoNotas.de(dados.notas.map((it) => it.nota).toList());
    final questoesCalculadas = EstatisticasProva.calcular(dados.questoes, dados.respostas);
    final questoes = questoesCalculadas.map(paraUiState).toList();

    _atualizar(
          (estado) => estado.copyWith(
        carregando: false,
        tituloProva: dados.prova?.titulo ?? '',
        disciplina: dados.prova?.disciplina ?? '',
        turmas: formatarTurmas(dados.turmas),
        mediaDaTurma: resumo.media,
        maiorNota: resumo.maiorNota,
        menorNota: resumo.menorNota,
        totalAlunosCorrigidos: dados.notas.length,
        todasAsQuestoes: questoes,
        questoesExibidas: filtrarQuestoes(questoes, estado.filtroSelecionado),
      ),
    );
  }

  QuestaoEstatisticaUiState paraUiState(EstatisticaQuestao questao) {
    return QuestaoEstatisticaUiState(
      numero: questao.numero,
      percentualAcerto: questao.percentualAcerto,
      letraDoGabarito: questao.letraDoGabarito?.toString(),
      distribuicao: questao.distribuicao.entries.map((entry) {
        final letraStr = entry.key.toString();
        return AlternativaDistribuicaoUiState(
          letra: letraStr,
          quantidade: entry.value,
          ehGabarito: letraStr == questao.letraDoGabarito?.toString(),
          ehMaisMarcada: letraStr == questao.alternativaMaisMarcada?.toString(),
        );
      }).toList(),
      totalRespostas: questao.totalRespostas,
      quantidadeEmBranco: questao.emBranco,
      quantidadeMultipla: questao.marcacaoMultipla,
      alternativaMaisMarcada: questao.alternativaMaisMarcada?.toString(),
      divergeDoGabarito: questao.divergeDoGabarito,
      gabaritoAlterado: questao.gabaritoAlterado,
    );
  }

  void selecionarFiltro(FiltroEstatisticas filtro) {
    _atualizar(
          (estado) => estado.copyWith(
        filtroSelecionado: filtro,
        questoesExibidas: filtrarQuestoes(estado.todasAsQuestoes, filtro),
      ),
    );
  }

  @override
  void dispose() {
    _descartado = true;
    _inscricao?.cancel();
    super.dispose();
  }

  static ViewModelProviderFactory<EstatisticasViewModel> factory(int provaId) {
    return (BuildContext context) {
      final database = AppDatabase.getInstance(context);
      return EstatisticasViewModel(
        repository: EstatisticasRepository(database),
        provaId: provaId,
      );
    };
  }
}

// Tipo auxiliar para a factory do Provider compatível com Flutter/Provider
typedef ViewModelProviderFactory<T extends ChangeNotifier> = T Function(BuildContext context);