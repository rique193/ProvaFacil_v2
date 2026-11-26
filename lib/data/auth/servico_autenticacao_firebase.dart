import 'package:firebase_auth/firebase_auth.dart';

import 'servico_autenticacao.dart';

/// Login por e-mail e senha com o Firebase Authentication. O Firebase guarda a sessão no
/// aparelho: quem já entrou continua logado ao reabrir o app.
class ServicoAutenticacaoFirebase implements ServicoAutenticacao {
  ServicoAutenticacaoFirebase([FirebaseAuth? auth]) : _auth = auth ?? FirebaseAuth.instance;

  final FirebaseAuth _auth;

  // `userChanges` (e não só `authStateChanges`) avisa também quando o nome é gravado no perfil.
  @override
  Stream<UsuarioLogado?> get mudancas => _auth.userChanges().map(_converter);

  @override
  UsuarioLogado? get usuarioAtual => _converter(_auth.currentUser);

  @override
  Future<void> cadastrar({required String nome, required String email, required String senha}) =>
      _traduzirErros(() async {
        final credencial = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );
        await credencial.user?.updateDisplayName(nome);
      });

  @override
  Future<void> entrar({required String email, required String senha}) => _traduzirErros(
    () => _auth.signInWithEmailAndPassword(email: email, password: senha),
  );

  @override
  Future<void> sair() => _traduzirErros(_auth.signOut);

  static UsuarioLogado? _converter(User? usuario) => usuario == null
      ? null
      : UsuarioLogado(uid: usuario.uid, nome: usuario.displayName, email: usuario.email);

  static Future<void> _traduzirErros(Future<void> Function() acao) async {
    try {
      await acao();
    } on FirebaseAuthException catch (e, pilha) {
      Error.throwWithStackTrace(ErroAutenticacao(e.code), pilha);
    }
  }
}
