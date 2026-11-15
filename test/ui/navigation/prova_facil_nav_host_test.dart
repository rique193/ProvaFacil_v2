import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

Future<void> abrir(WidgetTester tester, String rota) async {
  await tester.pumpWidget(MaterialApp.router(routerConfig: provaFacilNavHost(initialLocation: rota)));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('abre na lista de provas', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerConfig: provaFacilNavHost()));
    await tester.pumpAndSettle();
    expect(find.text('ProvaList'), findsWidgets);
  });

  testWidgets('formulário sem prova recebe null', (tester) async {
    await abrir(tester, rotaFormulario(null));
    expect(find.text('ProvaForm'), findsWidgets);
    expect(find.text('provaId: null'), findsOneWidget);
  });

  testWidgets('formulário de edição recebe o id', (tester) async {
    await abrir(tester, rotaFormulario(7));
    expect(find.text('provaId: 7'), findsOneWidget);
  });

  testWidgets('gabarito', (tester) async {
    await abrir(tester, rotaGabarito(3));
    expect(find.text('Gabarito'), findsWidgets);
    expect(find.text('provaId: 3'), findsOneWidget);
  });

  testWidgets('scanner do QR Code', (tester) async {
    await abrir(tester, rotaScanQr(null));
    expect(find.text('Scanner'), findsWidgets);
    expect(find.text('provaId: null'), findsOneWidget);
  });

  testWidgets('leitura das respostas recebe o texto do QR Code', (tester) async {
    await abrir(tester, rotaScanRespostas(5, 'PROVAFACIL|1|5|Ana Souza|Turma A'));
    expect(find.text('ScanRespostas'), findsWidgets);
    expect(find.text('provaId: 5'), findsOneWidget);
    expect(find.text('qr: PROVAFACIL|1|5|Ana Souza|Turma A'), findsOneWidget);
  });

  testWidgets('correção sem parâmetros', (tester) async {
    await abrir(tester, '/correcao');
    expect(find.text('Correcao'), findsWidgets);
    expect(find.text('provaId: null'), findsOneWidget);
  });

  testWidgets('resultado', (tester) async {
    await abrir(tester, '/resultados/9');
    expect(find.text('Resultado'), findsWidgets);
    expect(find.text('resultadoId: 9'), findsOneWidget);
  });

  testWidgets('alunos', (tester) async {
    await abrir(tester, rotaAlunos);
    expect(find.text('Alunos'), findsWidgets);
  });

  testWidgets('histórico', (tester) async {
    await abrir(tester, rotaHistorico);
    expect(find.text('Historico'), findsWidgets);
  });

  testWidgets('estatísticas', (tester) async {
    await abrir(tester, rotaEstatisticas(4));
    expect(find.text('Estatisticas'), findsWidgets);
    expect(find.text('provaId: 4'), findsOneWidget);
  });

  testWidgets('relatório', (tester) async {
    await abrir(tester, rotaRelatorio(4));
    expect(find.text('RelatorioNotas'), findsWidgets);
    expect(find.text('provaId: 4'), findsOneWidget);
  });
}
