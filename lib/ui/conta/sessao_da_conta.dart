import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/backup/id_instalacao.dart';
import '../../data/local/app_database.dart';
import '../../data/repository/auth_repository.dart';

/// Abre o banco local da conta [uid] (um banco por professor).
typedef AbrirBancoDaConta = AppDatabase Function(String uid);

/// Cria o router de uma sessão. [uid] é a conta logada, ou `null` sem login.
typedef CriarRouterDaSessao = GoRouter Function(String? uid);

/// Dá a cada professor o próprio banco local. Escuta o login e, quando a conta muda, descarta a
/// árvore abaixo e monta outra com banco, prefixo de backup e router novos, tudo ligado ao uid:
///
/// - logado: `Provider<AppDatabase>` com o banco `provafacil_<uid>`, aberto ao entrar e fechado ao
///   sair (ou trocar de conta), e um router que começa na lista de provas;
/// - sem login: nenhum banco, e um router que só abre login e cadastro.
///
/// Como o banco, o router e as telas da conta antiga somem juntos, nada dela vaza para a próxima
/// conta e nenhuma tela usa um banco fechado. O [AuthRepository] e o [IdInstalacao] ficam fora da
/// troca, criados uma vez só.
class SessaoDaConta extends StatelessWidget {
  const SessaoDaConta({
    super.key,
    required this.auth,
    required this.idInstalacao,
    required this.abrirBanco,
    required this.criarRouter,
    required this.construir,
  });

  final AuthRepository auth;
  final IdInstalacao idInstalacao;
  final AbrirBancoDaConta abrirBanco;
  final CriarRouterDaSessao criarRouter;

  /// Monta o app (o `MaterialApp.router`) já dentro dos providers da sessão.
  final Widget Function(BuildContext context, GoRouter router) construir;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: auth,
    builder: (context, _) {
      final uid = auth.usuario?.uid;
      return _Sessao(
        // Mesma conta (até com o perfil atualizado) mantém a sessão; outra conta a recria.
        key: ValueKey(uid ?? 'sem-conta'),
        uid: uid,
        idInstalacao: idInstalacao,
        abrirBanco: abrirBanco,
        criarRouter: criarRouter,
        construir: construir,
      );
    },
  );
}

class _Sessao extends StatefulWidget {
  const _Sessao({
    super.key,
    required this.uid,
    required this.idInstalacao,
    required this.abrirBanco,
    required this.criarRouter,
    required this.construir,
  });

  final String? uid;
  final IdInstalacao idInstalacao;
  final AbrirBancoDaConta abrirBanco;
  final CriarRouterDaSessao criarRouter;
  final Widget Function(BuildContext context, GoRouter router) construir;

  @override
  State<_Sessao> createState() => _SessaoState();
}

class _SessaoState extends State<_Sessao> {
  late final AppDatabase? _banco = widget.uid == null ? null : widget.abrirBanco(widget.uid!);
  late final GoRouter _router = widget.criarRouter(widget.uid);

  @override
  void dispose() {
    // As telas filhas já foram descartadas (filhos saem antes do pai), então nada usa o banco.
    _router.dispose();
    _banco?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banco = _banco;
    final uid = widget.uid;
    return MultiProvider(
      providers: [
        if (banco != null) Provider<AppDatabase>.value(value: banco),
        Provider<IdInstalacao>.value(
          value: uid == null ? widget.idInstalacao : IdInstalacaoDaConta(widget.idInstalacao, uid),
        ),
      ],
      child: Builder(builder: (context) => widget.construir(context, _router)),
    );
  }
}
