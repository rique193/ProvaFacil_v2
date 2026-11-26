import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../util/mensagem_erro.dart';
import '../auth/servico_autenticacao.dart';

/// Estado de login do app. É o `refreshListenable` das rotas: avisa quando o professor entra,
/// sai ou tem o perfil atualizado. Não separa os dados por professor; o login é só a porta de
/// entrada do app.
class AuthRepository extends ChangeNotifier {
  AuthRepository(this._servico) : _usuario = _servico.usuarioAtual {
    _inscricao = _servico.mudancas.listen(_atualizar);
  }

  final ServicoAutenticacao _servico;
  late final StreamSubscription<UsuarioLogado?> _inscricao;
  UsuarioLogado? _usuario;
  bool _descartado = false;

  UsuarioLogado? get usuario => _usuario;

  bool get logado => _usuario != null;

  /// Cria a conta e já entra com ela. Falhas do Firebase chegam como [ErroAutenticacao].
  Future<void> cadastrar({
    required String nome,
    required String email,
    required String senha,
  }) async {
    await _servico.cadastrar(nome: nome.trim(), email: email.trim(), senha: senha);
    _atualizar(_servico.usuarioAtual);
  }

  Future<void> entrar({required String email, required String senha}) async {
    await _servico.entrar(email: email.trim(), senha: senha);
    _atualizar(_servico.usuarioAtual);
  }

  Future<void> sair() async {
    await _servico.sair();
    _atualizar(null);
  }

  void _atualizar(UsuarioLogado? novo) {
    if (_descartado || novo == _usuario) return;
    _usuario = novo;
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _inscricao.cancel();
    super.dispose();
  }
}

const _mensagemGenerica = 'Algo deu errado. Tente de novo em instantes.';

/// Mensagem em português para o código de erro do Firebase Authentication.
String mensagemErroAuth(String codigo) => switch (codigo) {
  'invalid-email' => 'E-mail inválido.',
  'email-already-in-use' => 'Este e-mail já está cadastrado.',
  'weak-password' => 'Senha fraca: use pelo menos 6 caracteres.',
  'invalid-credential' ||
  'wrong-password' ||
  'user-not-found' ||
  'INVALID_LOGIN_CREDENTIALS' => 'E-mail ou senha incorretos.',
  'network-request-failed' => 'Sem conexão com a internet. Verifique e tente de novo.',
  'too-many-requests' => 'Muitas tentativas seguidas. Espere um pouco e tente de novo.',
  'user-disabled' => 'Esta conta foi desativada.',
  _ => _mensagemGenerica,
};

/// Mensagem para a tela quando entrar ou cadastrar falha, venha o erro do Firebase ou não.
String mensagemDaFalhaDeLogin(Object erro) => erro is ErroAutenticacao
    ? mensagemErroAuth(erro.codigo)
    : mensagemDoErro(erro) ?? _mensagemGenerica;
