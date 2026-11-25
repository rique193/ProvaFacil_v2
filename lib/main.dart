import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'data/local/app_database.dart';
import 'ui/navigation/prova_facil_nav_host.dart';
import 'ui/theme/theme.dart';

  WidgetsFlutterBinding.ensureInitialized();
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
      create: (_) => AppDatabase(),
      dispose: (_, database) => database.close(),
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
