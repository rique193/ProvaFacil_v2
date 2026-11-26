import 'package:flutter/foundation.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../domain/auth/regras_login.dart';
import 'cadastro_ui_state.dart';

class CadastroViewModel extends ChangeNotifier {
  CadastroViewModel(this._auth);

  final AuthRepository _auth;
  CadastroUiState _uiState = const CadastroUiState();
  bool _descartado = false;

  CadastroUiState get uiState => _uiState;

  void atualizarNome(String valor) => _atualizar((s) => s.copyWith(nome: valor, erro: null));

  void atualizarEmail(String valor) => _atualizar((s) => s.copyWith(email: valor, erro: null));

  void atualizarSenha(String valor) => _atualizar((s) => s.copyWith(senha: valor, erro: null));

  void atualizarConfirmacaoSenha(String valor) =>
      _atualizar((s) => s.copyWith(confirmacaoSenha: valor, erro: null));

  void alternarSenhaVisivel() => _atualizar((s) => s.copyWith(senhaVisivel: !s.senhaVisivel));

  Future<void> criarConta() async {
    final estado = _uiState;
    if (estado.carregando) return;
    final erroValidacao = validarCadastroProfessor(
      nome: estado.nome,
      email: estado.email,
      senha: estado.senha,
      confirmacaoSenha: estado.confirmacaoSenha,
    );
    if (erroValidacao != null) {
      _atualizar((s) => s.copyWith(erro: erroValidacao));
      return;
    }

    _atualizar((s) => s.copyWith(carregando: true, erro: null));
    try {
      await _auth.cadastrar(nome: estado.nome, email: estado.email, senha: estado.senha);
      _atualizar((s) => s.copyWith(carregando: false));
    } catch (e) {
      _atualizar((s) => s.copyWith(carregando: false, erro: mensagemDaFalhaDeLogin(e)));
    }
  }

  // Criada a conta, as rotas trocam de tela e descartam este ViewModel antes de o nome ser
  // gravado no perfil.
  void _atualizar(CadastroUiState Function(CadastroUiState) f) {
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
