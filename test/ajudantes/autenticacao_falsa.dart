import 'dart:async';

import 'package:provafacil/data/auth/servico_autenticacao.dart';
import 'package:provafacil/data/repository/auth_repository.dart';

const professoraLogada = UsuarioLogado(uid: 'p1', nome: 'Ana Lima', email: 'ana@escola.com');

/// Login em memória, sem Firebase: guarda as contas criadas e falha com os mesmos códigos.
class ServicoAutenticacaoFalso implements ServicoAutenticacao {
  ServicoAutenticacaoFalso({UsuarioLogado? logado}) : _atual = logado;

  final _contas = <String, ({String senha, UsuarioLogado usuario})>{};
  final _mudancas = StreamController<UsuarioLogado?>.broadcast(sync: true);
  UsuarioLogado? _atual;

  /// Se preenchido, a próxima chamada falha com este código do Firebase.
  String? proximoErro;

  /// Se preenchido, as chamadas só terminam quando ele for completado (para ver o "carregando").
  Completer<void>? pausa;

  int chamadasCadastrar = 0;
  int chamadasEntrar = 0;

  void adicionarConta({required String email, required String senha, String? nome}) {
    _contas[email] = (
      senha: senha,
      usuario: UsuarioLogado(uid: 'u${_contas.length + 1}', nome: nome, email: email),
    );
  }

  @override
  Stream<UsuarioLogado?> get mudancas => _mudancas.stream;

  @override
  UsuarioLogado? get usuarioAtual => _atual;

  @override
  Future<void> cadastrar({
    required String nome,
    required String email,
    required String senha,
  }) async {
    chamadasCadastrar++;
    await _antesDeResponder();
    if (_contas.containsKey(email)) throw const ErroAutenticacao('email-already-in-use');
    if (senha.length < 6) throw const ErroAutenticacao('weak-password');
    adicionarConta(email: email, senha: senha, nome: nome);
    _emitir(_contas[email]!.usuario);
  }

  @override
  Future<void> entrar({required String email, required String senha}) async {
    chamadasEntrar++;
    await _antesDeResponder();
    final conta = _contas[email];
    if (conta == null || conta.senha != senha) throw const ErroAutenticacao('invalid-credential');
    _emitir(conta.usuario);
  }

  @override
  Future<void> sair() async => _emitir(null);

  Future<void> _antesDeResponder() async {
    await pausa?.future;
    final erro = proximoErro;
    if (erro != null) {
      proximoErro = null;
      throw ErroAutenticacao(erro);
    }
  }

  void _emitir(UsuarioLogado? usuario) {
    _atual = usuario;
    _mudancas.add(usuario);
  }
}

/// Repositório já logado como [professoraLogada], para as telas que exigem login.
AuthRepository authLogado() => AuthRepository(ServicoAutenticacaoFalso(logado: professoraLogada));
