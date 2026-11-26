import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../data/repository/prova_repository.dart';
import '../../../util/mensagem_erro.dart';
import 'visualizar_prova_ui_state.dart';

/// Observa a prova para refletir edições e alterações do gabarito ao voltar das outras telas.
class VisualizarProvaViewModel extends ChangeNotifier {
  VisualizarProvaViewModel(ProvaRepository repository, int provaId) {
    _assinatura = repository
        .observarProva(provaId)
        .listen(
          (prova) => _atualizar(
            _uiState.copyWith(
              carregando: false,
              prova: prova,
              erro: prova == null ? 'Prova não encontrada.' : null,
            ),
          ),
          onError: (Object erro) => _atualizar(
            _uiState.copyWith(
              carregando: false,
              erro:
                  mensagemDoErro(erro) ?? 'Não foi possível carregar a prova.',
            ),
          ),
        );
  }

  late final StreamSubscription<void> _assinatura;
  VisualizarProvaUiState _uiState = const VisualizarProvaUiState();
  VisualizarProvaUiState get uiState => _uiState;
  bool _descartado = false;

  void _atualizar(VisualizarProvaUiState estado) {
    if (_descartado) return;
    _uiState = estado;
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinatura.cancel();
    super.dispose();
  }
}
