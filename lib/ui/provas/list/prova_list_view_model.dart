import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../data/local/app_database.dart';
import '../../../data/local/relation/prova_com_questoes.dart';
import '../../../data/local/relation/progresso_prova.dart';
import '../../../data/repository/historico_repository.dart';
import '../../../data/repository/prova_repository.dart';

class ProvaListViewModel extends ChangeNotifier {
  ProvaListViewModel(this._repository, [HistoricoRepository? historico]) {
    _assinatura = _repository.observarProvas().listen((provas) {
      _provas = provas;
      notifyListeners();
    });
    _assinaturaProgresso = historico?.observarProgressoProvas().listen((
      progressos,
    ) {
      _progressos = {for (final p in progressos) p.provaId: p};
      notifyListeners();
    });
  }

  final ProvaRepository _repository;
  late final StreamSubscription<List<ProvaComQuestoes>> _assinatura;
  StreamSubscription<List<ProgressoProva>>? _assinaturaProgresso;

  Map<int, ProgressoProva> _progressos = const {};

  /// Progresso de correção da prova (status e "X de Y corrigidos"); `null` enquanto carrega.
  ProgressoProva? progressoDe(int provaId) => _progressos[provaId];

  List<ProvaComQuestoes> _provas = const [];
  List<ProvaComQuestoes> get provas => _provas;

  Future<void> excluirProva(ProvaEntity prova) =>
      _repository.excluirProva(prova);

  @override
  void dispose() {
    _assinatura.cancel();
    _assinaturaProgresso?.cancel();
    super.dispose();
  }
}
