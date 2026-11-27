import 'package:firebase_core/firebase_core.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'data/auth/servico_autenticacao_firebase.dart';
import 'data/backup/id_instalacao.dart';
import 'data/local/app_database.dart';
import 'data/local/nome_banco_conta.dart';
import 'data/repository/auth_repository.dart';
import 'firebase_options.dart';
import 'ui/auth/auth_rotas.dart';
import 'ui/conta/sessao_da_conta.dart';
import 'ui/navigation/prova_facil_nav_host.dart';
import 'ui/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ao trocar de conta, o banco novo abre um instante antes de o antigo fechar. São arquivos
  // diferentes (`provafacil_<uid>`), então o aviso de "banco aberto duas vezes" não se aplica.
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  await initializeDateFormatting('pt_BR');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProvaFacilApp());
}

class ProvaFacilApp extends StatefulWidget {
  const ProvaFacilApp({super.key});

  @override
  State<ProvaFacilApp> createState() => _ProvaFacilAppState();
}

class _ProvaFacilAppState extends State<ProvaFacilApp> {
  final AuthRepository _auth = AuthRepository(ServicoAutenticacaoFirebase());
  // Uma instância só, para o id da instalação ser lido do disco uma vez.
  final IdInstalacao _idInstalacao = IdInstalacao();

  @override
  void dispose() {
    _auth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SessaoDaConta(
      auth: _auth,
      idInstalacao: _idInstalacao,
      // Um banco por professor: `provafacil_<uid>`. O antigo `provafacil` não é mais aberto.
      abrirBanco: (uid) => AppDatabase(driftDatabase(name: nomeBancoDaConta(uid))),
      criarRouter: (uid) => provaFacilNavHost(
        auth: _auth,
        uidDaSessao: (uid: uid),
        initialLocation: uid == null ? rotaLogin : rotaLista,
      ),
      construir: (context, router) => MaterialApp.router(
        title: 'ProvaFacil',
        debugShowCheckedModeBanner: false,
        theme: ProvaFacilTheme.claro,
        darkTheme: ProvaFacilTheme.escuro,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
