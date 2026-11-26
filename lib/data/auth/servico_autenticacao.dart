/// Professor com login feito no app. Não depende de tipos do Firebase, para os testes usarem um
/// serviço falso.
class UsuarioLogado {
  const UsuarioLogado({required this.uid, this.nome, this.email});

  final String uid;
  final String? nome;
  final String? email;

  /// O nome informado no cadastro; sem ele, o e-mail.
  String get identificacao {
    final nomeLimpo = nome?.trim() ?? '';
    return nomeLimpo.isNotEmpty ? nomeLimpo : (email ?? '');
  }

  @override
  bool operator ==(Object other) =>
      other is UsuarioLogado && other.uid == uid && other.nome == nome && other.email == email;

  @override
  int get hashCode => Object.hash(uid, nome, email);

  @override
  String toString() => 'UsuarioLogado($uid, $nome, $email)';
}

/// Falha do serviço de login, com o código do Firebase (ex.: `invalid-credential`). A mensagem
/// para a tela sai de `mensagemErroAuth`.
class ErroAutenticacao implements Exception {
  const ErroAutenticacao(this.codigo);

  final String codigo;

  @override
  String toString() => 'ErroAutenticacao($codigo)';
}

/// O que o app usa do login por e-mail e senha. A implementação real é
/// `ServicoAutenticacaoFirebase`; as falhas chegam como [ErroAutenticacao].
abstract interface class ServicoAutenticacao {
  /// Emite o usuário a cada entrada, saída ou mudança no perfil (como o nome); `null` sem login.
  Stream<UsuarioLogado?> get mudancas;

  UsuarioLogado? get usuarioAtual;

  /// Cria a conta, já entra com ela e grava o [nome] no perfil.
  Future<void> cadastrar({required String nome, required String email, required String senha});

  Future<void> entrar({required String email, required String senha});

  Future<void> sair();
}
