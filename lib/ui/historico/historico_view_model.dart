import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../data/repository/historico_repository.dart';
import '../../domain/historico/formato_turmas.dart';
import 'historico_ui_state.dart';

/// ViewModel da tela de Histórico: lista as provas que já têm resultados salvos, da correção mais
/// recente para a mais antiga, e se atualiza sozinha quando uma nova correção é gravada. Ao abrir,
/// sincroniza os alunos e resultados com a nuvem, como backup.
class HistoricoViewModel extends ChangeNotifier {
  HistoricoViewModel({
    required this._repository,
    this._enviarTudoNuvem,
    this._contaId,
  }) {
    _inscricao = _repository.observarProvasCorrigidas().listen((provas) {
      final avaliacoes = provas
          .map(
            (prova) => AvaliacaoHistoricoUiState(
          provaId: prova.provaId,
          titulo: prova.titulo,
          disciplina: prova.disciplina,
          turmas: formatarTurmas(prova.turmas),
          totalCorrigidos: prova.totalCorrigidos,
          media: prova.media,
          ultimaCorrecaoEm: prova.ultimaCorrecaoEm,
        ),
      )
          .toList();
      _atualizar(
            (estado) => estado.copyWith(
          carregando: false,
          avaliacoes: avaliacoes,
        ),
      );
    });
    sincronizarComNuvem();
  }

  static const String _tag = 'HistoricoViewModel';

  /// Contas (uid) cuja sincronização desta execução do app já foi feita. Sem conta (testes), vale `''`.
  static final Set<String> _sincronizadas = {};

  @visibleForTesting
  static void resetarSincronizacaoParaTeste() {
    _sincronizadas.clear();
  }

  /// Uid da conta dona do banco; a sincronização vale uma vez por conta, não uma por app.
  final String? _contaId;
  String get _chaveConta => _contaId ?? '';

  final HistoricoRepository _repository;
  final Future<void> Function()? _enviarTudoNuvem;

  StreamSubscription<dynamic>? _inscricao;
  bool _descartado = false;

  HistoricoUiState _uiState = const HistoricoUiState();
  HistoricoUiState get uiState => _uiState;

  void _atualizar(HistoricoUiState Function(HistoricoUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  /// Envia todos os alunos e resultados para a nuvem, uma vez por conta a cada execução do app, para cobrir as
  /// correções feitas antes do backup existir. Silencioso: não espera a rede nem mostra mensagem.
  void sincronizarComNuvem() {
    if (_sincronizadas.contains(_chaveConta)) return;
    _sincronizadas.add(_chaveConta);

    final enviar = _enviarTudoNuvem;
    if (enviar == null) return;

    unawaited(() async {
      try {
        await enviar();
      } catch (e) {
        _sincronizadas.remove(_chaveConta); // tenta de novo na próxima vez que o Histórico abrir
        log(
          'Falha na sincronização com a nuvem; os dados locais não mudaram.',
          name: _tag,
          error: e,
        );
      }
    }());
  }

  @override
  void dispose() {
    _descartado = true;
    _inscricao?.cancel();
    super.dispose();
  }
}