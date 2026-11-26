import 'package:flutter/material.dart';

import '../../data/repository/auth_repository.dart';

/// Botão da conta na barra da lista de provas: mostra quem está logado e o item "Sair". Ao sair,
/// o `redirect` das rotas leva para o login.
class MenuProfessor extends StatelessWidget {
  const MenuProfessor({super.key, required this.auth});

  final AuthRepository auth;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: auth,
    builder: (context, _) {
      final usuario = auth.usuario;
      final nome = usuario?.identificacao ?? '';
      final email = usuario?.email ?? '';
      return PopupMenuButton<_AcaoConta>(
        tooltip: 'Conta',
        icon: const Icon(Icons.account_circle),
        onSelected: (acao) => switch (acao) {
          _AcaoConta.sair => auth.sair(),
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.person),
              title: Text(nome),
              subtitle: email.isNotEmpty && email != nome ? Text(email) : null,
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: _AcaoConta.sair,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.logout),
              title: Text('Sair'),
            ),
          ),
        ],
      );
    },
  );
}

enum _AcaoConta { sair }
