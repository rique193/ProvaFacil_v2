import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/repository/auth_repository.dart';
import 'cadastro/cadastro_screen.dart';
import 'cadastro/cadastro_view_model.dart';
import 'login/login_screen.dart';
import 'login/login_view_model.dart';

const rotaLogin = '/login';
const rotaCadastro = '/cadastro';

/// Sem login, só as telas de login e de cadastro abrem; as outras levam ao login. Com login,
/// essas duas telas levam a [aposEntrar]. `null` deixa abrir o [local] pedido.
String? redirecionarPorLogin({
  required bool logado,
  required String local,
  required String aposEntrar,
}) {
  final naEntrada = local == rotaLogin || local == rotaCadastro;
  if (!logado) return naEntrada ? null : rotaLogin;
  return naEntrada ? aposEntrar : null;
}

/// Telas de login e de criar conta. Depois de entrar, quem troca de tela é o `redirect`.
List<RouteBase> rotasDeAutenticacao(AuthRepository auth) => [
  GoRoute(
    path: rotaLogin,
    builder: (context, state) => ChangeNotifierProvider(
      create: (_) => LoginViewModel(auth),
      child: LoginScreen(onCriarConta: () => context.push(rotaCadastro)),
    ),
  ),
  GoRoute(
    path: rotaCadastro,
    builder: (context, state) => ChangeNotifierProvider(
      create: (_) => CadastroViewModel(auth),
      child: CadastroScreen(
        onVoltar: () => context.canPop() ? context.pop() : context.go(rotaLogin),
      ),
    ),
  ),
];
