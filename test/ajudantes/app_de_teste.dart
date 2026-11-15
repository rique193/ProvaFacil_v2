import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';
import 'package:provider/provider.dart';

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
Future<AppDatabase> abrirApp(WidgetTester tester, String rota, {AppDatabase? database}) async {
  final db = database ?? criarBancoParaWidgetTest();
  tester.view
    ..physicalSize = const Size(800, 3000)
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  addTearDown(() async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.runAsync(db.close);
  });
  await tester.pumpWidget(
    Provider<AppDatabase>.value(
      value: db,
      child: MaterialApp.router(routerConfig: provaFacilNavHost(initialLocation: rota)),
    ),
  );
  await esperarBanco(tester);
  return db;
}
