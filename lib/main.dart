import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'data/backup/id_instalacao.dart';
import 'data/local/app_database.dart';
import 'firebase_options.dart';
import 'ui/navigation/prova_facil_nav_host.dart';
import 'ui/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProvaFacilApp());
}

class ProvaFacilApp extends StatefulWidget {
  const ProvaFacilApp({super.key});

  @override
  State<ProvaFacilApp> createState() => _ProvaFacilAppState();
}

class _ProvaFacilAppState extends State<ProvaFacilApp> {
  final GoRouter _router = provaFacilNavHost();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (_) => AppDatabase(),
          dispose: (_, database) => database.close(),
        ),
        // Uma instância só, para o id da instalação ser lido do disco uma vez.
        Provider<IdInstalacao>(create: (_) => IdInstalacao()),
      ],
      child: MaterialApp.router(
        title: 'ProvaFacil',
        debugShowCheckedModeBanner: false,
        theme: ProvaFacilTheme.claro,
        darkTheme: ProvaFacilTheme.escuro,
        themeMode: ThemeMode.system,
        routerConfig: _router,
      ),
    );
  }
}
