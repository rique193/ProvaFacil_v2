import 'package:flutter/foundation.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../domain/auth/regras_login.dart';
import 'login_ui_state.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._auth);

  final AuthRepository _auth;
  LoginUiState _uiState = const LoginUiState();
  bool _descartado = false;

  LoginUiState get uiState => _uiState;

  void atualizarEmail(String valor) => _atualizar((s) => s.copyWith(email: valor, erro: null));

  void atualizarSenha(String valor) => _atualizar((s) => s.copyWith(senha: valor, erro: null));

  void alternarSenhaVisivel() => _atualizar((s) => s.copyWith(senhaVisivel: !s.senhaVisivel));

  Future<void> entrar() async {
    final estado = _uiState;
    if (estado.carregando) return;
    final erroValidacao = validarLogin(email: estado.email, senha: estado.senha);
    if (erroValidacao != null) {
      _atualizar((s) => s.copyWith(erro: erroValidacao));
      return;
    }

    _atualizar((s) => s.copyWith(carregando: true, erro: null));
    try {
      await _auth.entrar(email: estado.email, senha: estado.senha);
      _atualizar((s) => s.copyWith(carregando: false));
    } catch (e) {
      _atualizar((s) => s.copyWith(carregando: false, erro: mensagemDaFalhaDeLogin(e)));
    }
  }

  // Ao entrar, as rotas trocam de tela e descartam este ViewModel antes de o Firebase responder.
  void _atualizar(LoginUiState Function(LoginUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}
