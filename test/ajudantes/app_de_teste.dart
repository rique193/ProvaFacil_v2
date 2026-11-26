import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/backup_resultados.dart';
import 'package:provafacil/data/backup/id_instalacao.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/auth_repository.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Banco em memória para widget tests: fecha os streams na hora, sem deixar timers pendentes.
AppDatabase criarBancoParaWidgetTest() =>
    AppDatabase(DatabaseConnection(NativeDatabase.memory(), closeStreamsSynchronously: true));

/// As consultas do drift só terminam com tempo real; o relógio falso do widget test não basta.
Future<void> esperarBanco(WidgetTester tester) async {
  for (var i = 0; i < 3; i++) {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

/// Abre o app na [rota] com um banco em memória e o devolve para o teste preparar dados.
/// Sem [auth], o app abre sem pedir login.
Future<AppDatabase> abrirApp(
  WidgetTester tester,
  String rota, {
  AppDatabase? database,
  BackupResultados? backup,
  AuthRepository? auth,
}) async {
  final db = database ?? criarBancoParaWidgetTest();
  tester.view
    ..physicalSize = const Size(800, 3000)
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  addTearDown(() async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.runAsync(db.close);
  });
  SharedPreferences.setMockInitialValues({});
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: db),
        Provider<IdInstalacao>(create: (_) => IdInstalacao()),
      ],
      child: MaterialApp.router(
        routerConfig: provaFacilNavHost(initialLocation: rota, backup: backup, auth: auth),
      ),
    ),
  );
  await esperarBanco(tester);
  return db;
}
