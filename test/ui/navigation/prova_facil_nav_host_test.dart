import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/ui/navigation/prova_facil_nav_host.dart';

import '../../ajudantes/app_de_teste.dart';

Future<void> abrir(WidgetTester tester, String rota) => abrirApp(tester, rota);

void main() {
  testWidgets('abre na lista de provas', (tester) async {
    await abrirApp(tester, rotaLista);
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('formulário sem prova abre como prova nova', (tester) async {
    await abrir(tester, rotaFormulario(null));
    expect(find.text('Nova Prova'), findsOneWidget);
  });

  testWidgets('formulário com id abre em modo de edição', (tester) async {
    await abrir(tester, rotaFormulario(7));
    expect(find.text('Editar Prova'), findsOneWidget);
    expect(find.text('Prova não encontrada.'), findsOneWidget);
  });

  testWidgets('gabarito de prova inexistente avisa', (tester) async {
    await abrir(tester, rotaGabarito(3));
    expect(find.text('Gabarito'), findsOneWidget);
    expect(find.text('Prova não encontrada.'), findsOneWidget);
  });

  testWidgets('scanner do QR Code', (tester) async {
    await abrir(tester, rotaScanQr(null));
    expect(find.text('Scanner'), findsWidgets);
    expect(find.text('provaId: null'), findsOneWidget);
  });

  testWidgets('leitura das respostas recebe o texto do QR Code', (
    tester,
  ) async {
    await abrir(
      tester,
      rotaScanRespostas(5, 'PROVAFACIL|1|5|Ana Souza|Turma A'),
    );
    expect(find.text('ScanRespostas'), findsWidgets);
    expect(find.text('provaId: 5'), findsOneWidget);
    expect(find.text('qr: PROVAFACIL|1|5|Ana Souza|Turma A'), findsOneWidget);
  });

  testWidgets('correção sem parâmetros', (tester) async {
    await abrir(tester, '/correcao');
    expect(find.text('Corrigir Prova'), findsWidgets);
    expect(
      find.text(
        'Nenhuma prova cadastrada. Cadastre uma prova e o gabarito antes de corrigir.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('resultado', (tester) async {
    await abrir(tester, '/resultados/9');
    expect(find.text('Resultado'), findsWidgets);
    expect(find.text('Resultado não encontrado.'), findsOneWidget);
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
