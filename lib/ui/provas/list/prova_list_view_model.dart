import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../data/local/app_database.dart';
import '../../../data/local/relation/prova_com_questoes.dart';
import '../../../data/repository/prova_repository.dart';

class ProvaListViewModel extends ChangeNotifier {
  ProvaListViewModel(this._repository) {
    _assinatura = _repository.observarProvas().listen((provas) {
      _provas = provas;
      notifyListeners();
    });
  }

  final ProvaRepository _repository;
  late final StreamSubscription<List<ProvaComQuestoes>> _assinatura;

  List<ProvaComQuestoes> _provas = const [];
  List<ProvaComQuestoes> get provas => _provas;

  Future<void> excluirProva(ProvaEntity prova) => _repository.excluirProva(prova);

  @override
  void dispose() {
    _assinatura.cancel();
    super.dispose();
  }
}
