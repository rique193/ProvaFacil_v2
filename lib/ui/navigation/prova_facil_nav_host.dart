import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/backup/backup_firestore.dart';
import '../../data/backup/id_instalacao.dart';
import '../../data/local/app_database.dart';
import '../../data/repository/aluno_repository.dart';
import '../../data/repository/prova_repository.dart';
import '../alunos/alunos_screen.dart';
import '../alunos/alunos_view_model.dart';
import '../../data/repository/historico_repository.dart';
import '../../data/repository/estatisticas_repository.dart';
import '../components/tela_provisoria.dart';
import '../correcao/correcao_rotas.dart';
import '../provas/form/prova_form_screen.dart';
import '../provas/form/prova_form_view_model.dart';
import '../provas/gabarito/gabarito_screen.dart';
import '../provas/gabarito/gabarito_view_model.dart';
import '../provas/list/prova_list_screen.dart';
import '../provas/list/prova_list_view_model.dart';
import '../historico/historico_screen.dart';
import '../historico/historico_view_model.dart';
import '../estatisticas/estatisticas_screen.dart';
import '../estatisticas/estatisticas_view_model.dart';
import '../relatorio/relatorio_notas_screen.dart';

const _argProvaId = 'provaId';
const _argQr = 'qr';

const rotaLista = '/provas';
const rotaAlunos = '/alunos';
const rotaHistorico = '/historico';

String rotaFormulario(int? provaId) => '/provas/form?$_argProvaId=${provaId ?? -1}';
String rotaGabarito(int provaId) => '/provas/$provaId/gabarito';
String rotaEstatisticas(int provaId) => '/estatisticas/$provaId';
String rotaRelatorio(int provaId) => '/relatorio/$provaId';

/// O id da prova acompanha o escaneamento para chegar já preenchido na tela de correção.
String rotaScanQr(int? provaId) => '/scan_qr?$_argProvaId=${provaId ?? -1}';

/// O texto lido do QR Code vai junto para a leitura das respostas, que o valida de novo.
String rotaScanRespostas(int? provaId, String textoQr) =>
    '/scan_respostas?$_argProvaId=${provaId ?? -1}&$_argQr=${Uri.encodeComponent(textoQr)}';

int? _idOpcional(String? valor) {
  final id = int.tryParse(valor ?? '') ?? -1;
  return id == -1 ? null : id;
}

GoRouter provaFacilNavHost({String initialLocation = rotaLista}) => GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: rotaLista,
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => ProvaListViewModel(ProvaRepository(context.read<AppDatabase>())),
            child: ProvaListScreen(
              onNovaProva: () => context.push(rotaFormulario(null)),
              onEditarProva: (provaId) => context.push(rotaFormulario(provaId)),
              onAbrirGabarito: (provaId) => context.push(rotaGabarito(provaId)),
              onCorrigirProva: (provaId) => context.push(rotaScanQr(provaId)),
              onAbrirAlunos: () => context.push(rotaAlunos),
              onAbrirHistorico: () => context.push(rotaHistorico),
            ),
          ),
        ),
        GoRoute(
          path: '/provas/form',
          builder: (context, state) {
            final provaId = _idOpcional(state.uri.queryParameters[_argProvaId]);
            return ChangeNotifierProvider(
              create: (context) =>
                  ProvaFormViewModel(ProvaRepository(context.read<AppDatabase>()), provaId),
              child: ProvaFormScreen(
                onSalvo: (idSalvo) {
                  final router = GoRouter.of(context);
                  router.pop();
                  if (provaId == null) router.push(rotaGabarito(idSalvo));
                },
                onVoltar: () => context.pop(),
              ),
            );
          },
        ),
        GoRoute(
          path: '/provas/:$_argProvaId/gabarito',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters[_argProvaId]!);
            return ChangeNotifierProvider(
              create: (context) =>
                  GabaritoViewModel(ProvaRepository(context.read<AppDatabase>()), provaId),
              child: GabaritoScreen(
                onVoltar: () => context.pop(),
                onSalvo: () => context.pop(),
              ),
            );
          },
        ),
        GoRoute(
          path: '/scan_qr',
          builder: (context, state) {
            final provaId = _idOpcional(state.uri.queryParameters[_argProvaId]);
            return TelaProvisoria(nome: 'Scanner', parametros: {_argProvaId: provaId});
          },
        ),
        GoRoute(
          path: '/scan_respostas',
          builder: (context, state) {
            final provaId = _idOpcional(state.uri.queryParameters[_argProvaId]);
            final textoQr = state.uri.queryParameters[_argQr];
            return TelaProvisoria(
              nome: 'ScanRespostas',
              parametros: {_argProvaId: provaId, _argQr: textoQr},
            );
          },
        ),
        ...rotasDeCorrecao(aoConcluir: (context) => context.go(rotaLista)),
        GoRoute(
          path: rotaAlunos,
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => AlunosViewModel(
              AlunoRepository(
                context.read<AppDatabase>(),
                backup: BackupAlunosFirestore(context.read<IdInstalacao>()),
              ),
            ),
            child: AlunosScreen(onVoltar: () => context.pop()),
          ),
        ),
        GoRoute(
          path: '/historico',
          builder: (context, state) {
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => HistoricoViewModel(
                repository: HistoricoRepository(database),
                enviarTudoNuvem: () async {}, // Stub temporário até o Membro 3 integrar o backup
              ),
              child: HistoricoScreen(
                onVoltar: () => context.pop(),
                onAbrirEstatisticas: (provaId) => context.push('/estatisticas/$provaId'),
                onAbrirRelatorio: (provaId) => context.push('/relatorio/$provaId'),
              ),
            );
          },
        ),
        GoRoute(
          path: '/estatisticas/:provaId',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters['provaId']!);
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => EstatisticasViewModel(
                repository: EstatisticasRepository(database),
                provaId: provaId,
              ),
              child: EstatisticasScreen(
                provaId: provaId,
                onVoltar: () => context.pop(),
              ),
            );
          },
        ),
        GoRoute(
          path: '/relatorio/:provaId',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters['provaId']!);
            return RelatorioNotasScreen(
              provaId: provaId,
              onVoltar: () => context.pop(),
            );
          },
        ),
      ],
    );
