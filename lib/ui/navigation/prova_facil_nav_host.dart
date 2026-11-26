import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/backup/backup_firestore.dart';
import '../../data/backup/backup_resultados.dart';
import '../../data/backup/id_instalacao.dart';
import '../../data/local/app_database.dart';
import '../../data/repository/aluno_repository.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/backup_nuvem_repository.dart';
import '../../data/repository/banco_questao_repository.dart';
import '../../data/repository/disciplina_repository.dart';
import '../../data/repository/estatisticas_repository.dart';
import '../../data/repository/historico_repository.dart';
import '../../data/repository/prova_repository.dart';
import '../../data/repository/turma_repository.dart';
import '../alunos/alunos_screen.dart';
import '../alunos/alunos_view_model.dart';
import '../auth/auth_rotas.dart';
import '../auth/menu_professor.dart';
import '../banco_questoes/banco_questoes_screen.dart';
import '../banco_questoes/banco_questoes_view_model.dart';
import '../banco_questoes/form/banco_questao_form_screen.dart';
import '../banco_questoes/form/banco_questao_form_view_model.dart';
import '../correcao/correcao_rotas.dart';
import '../estatisticas/estatisticas_screen.dart';
import '../estatisticas/estatisticas_view_model.dart';
import '../historico/historico_screen.dart';
import '../historico/historico_view_model.dart';
import '../provas/form/prova_form_screen.dart';
import '../provas/form/prova_form_view_model.dart';
import '../provas/gabarito/gabarito_screen.dart';
import '../provas/gabarito/gabarito_view_model.dart';
import '../provas/gerar/gerar_prova_screen.dart';
import '../provas/gerar/gerar_prova_view_model.dart';
import '../provas/list/prova_list_screen.dart';
import '../provas/list/prova_list_view_model.dart';
import '../provas/pdf/pdf_prova_view_model.dart';
import '../provas/visualizar/visualizar_prova_screen.dart';
import '../provas/visualizar/visualizar_prova_view_model.dart';
import '../relatorio/relatorio_notas_screen.dart';
import '../scanner/qr_code_scanner_view_model.dart';
import '../scanner/fotografar_folha.dart';
import '../scanner/scan_respostas_screen.dart';
import '../scanner/scan_respostas_view_model.dart';
import '../scanner/scanner_screen.dart';
import '../turmas_disciplinas/turmas_disciplinas_screen.dart';
import '../turmas_disciplinas/turmas_disciplinas_view_model.dart';

const _argProvaId = 'provaId';
const _argQr = 'qr';

const rotaLista = '/provas';
const rotaAlunos = '/alunos';
const rotaHistorico = '/historico';
const rotaTurmas = '/turmas';

String rotaFormulario(int? provaId) => '/provas/form?$_argProvaId=${provaId ?? -1}';
String rotaGerarProva() => '/provas/gerar';
String rotaVisualizarProva(int provaId) => '/provas/$provaId';
String rotaGabarito(int provaId) => '/provas/$provaId/gabarito';
String rotaEstatisticas(int provaId) => '/estatisticas/$provaId';
String rotaRelatorio(int provaId) => '/relatorio/$provaId';
String rotaBancoQuestoes() => '/banco-questoes';
String rotaFormularioBancoQuestao(int? id) =>
    id == null ? '/banco-questoes/form' : '/banco-questoes/form?id=$id';

/// O id da prova acompanha o escaneamento para chegar já preenchido na tela de correção.
String rotaScanQr(int? provaId) => '/scan_qr?$_argProvaId=${provaId ?? -1}';

/// O texto lido do QR Code vai junto para a leitura das respostas, que o valida de novo.
String rotaScanRespostas(int? provaId, String textoQr) =>
    '/scan_respostas?$_argProvaId=${provaId ?? -1}&$_argQr=${Uri.encodeComponent(textoQr)}';

int? _idOpcional(String? valor) {
  final id = int.tryParse(valor ?? '') ?? -1;
  return id == -1 ? null : id;
}

/// [backup] troca o envio para o Firestore (usado nos testes); sem ele, vale o Firestore real.
/// [auth] liga o login: sem professor logado, só abrem as telas de login e de cadastro. Sem ele
/// (nos testes que não tratam de login), o app abre direto.
///
/// [usarCamera] liga a câmera de verdade na leitura do QR Code; os testes passam `false` para
/// usar o modo simulação.
GoRouter provaFacilNavHost({
  String initialLocation = rotaLista,
  BackupResultados? backup,
  AuthRepository? auth,
  bool usarCamera = true,
}) =>
    GoRouter(
      initialLocation: initialLocation,
      refreshListenable: auth,
      redirect: auth == null
          ? null
          : (context, state) => redirecionarPorLogin(
        logado: auth.logado,
        local: state.uri.path,
        aposEntrar: rotaLista,
      ),
      routes: [
        if (auth != null) ...rotasDeAutenticacao(auth),
        GoRoute(
          path: rotaLista,
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => ProvaListViewModel(
              ProvaRepository(context.read<AppDatabase>()),
              HistoricoRepository(context.read<AppDatabase>()),
            ),
            child: ProvaListScreen(
              onNovaProva: () => context.push(rotaFormulario(null)),
              onGerarProvaDoBanco: () => context.push(rotaGerarProva()),
              onVisualizarProva: (provaId) => context.push(rotaVisualizarProva(provaId)),
              onEditarProva: (provaId) => context.push(rotaFormulario(provaId)),
              onAbrirGabarito: (provaId) => context.push(rotaGabarito(provaId)),
              onCorrigirProva: (provaId) => context.push(rotaScanQr(provaId)),
              onAbrirAlunos: () => context.push(rotaAlunos),
              onAbrirHistorico: () => context.push(rotaHistorico),
              onAbrirTurmasDisciplinas: () => context.push(rotaTurmas),
              onAbrirBancoQuestoes: () => context.push(rotaBancoQuestoes()),
              menuConta: auth == null ? null : MenuProfessor(auth: auth),
            ),
          ),
        ),
        GoRoute(
          path: '/provas/form',
          builder: (context, state) {
            final provaId = _idOpcional(state.uri.queryParameters[_argProvaId]);
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => ProvaFormViewModel(
                ProvaRepository(database),
                provaId,
                disciplinaRepository: DisciplinaRepository(database),
                turmaRepository: TurmaRepository(database),
              ),
              child: ProvaFormScreen(
                onSalvo: (idSalvo) {
                  final router = GoRouter.of(context);
                  router.pop();
                  if (provaId == null) router.push(rotaGabarito(idSalvo));
                },
                onVoltar: () => context.pop(),
                onAbrirTurmasDisciplinas: () => context.push(rotaTurmas),
              ),
            );
          },
        ),
        GoRoute(
          path: '/provas/gerar',
          builder: (context, state) {
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => GerarProvaViewModel(
                provas: ProvaRepository(database),
                bancoQuestoes: BancoQuestaoRepository(database),
                disciplinas: DisciplinaRepository(database),
                turmas: TurmaRepository(database),
              ),
              child: GerarProvaScreen(
                onVoltar: () => context.pop(),
                onGerada: (id) => context.pushReplacement(rotaVisualizarProva(id)),
                // Contrato do Membro 1: rotaBancoQuestoes() => '/banco-questoes'.
                onAbrirBancoQuestoes: () => context.push(rotaBancoQuestoes()),
              ),
            );
          },
        ),
        GoRoute(
          path: '/provas/:$_argProvaId',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters[_argProvaId]!);
            final database = context.read<AppDatabase>();
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => VisualizarProvaViewModel(ProvaRepository(database), provaId)),
                ChangeNotifierProvider(create: (_) => PdfProvaViewModel(AlunoRepository(database))),
              ],
              child: VisualizarProvaScreen(
                onVoltar: () => context.pop(),
                onEditar: () => context.push(rotaFormulario(provaId)),
                onAbrirGabarito: () => context.push(rotaGabarito(provaId)),
                onCorrigir: () => context.push(rotaScanQr(provaId)),
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
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => QrCodeScannerViewModel(
                ProvaRepository(database),
                AlunoRepository(database),
                provaIdInicial: provaId,
                usarCamera: usarCamera,
              ),
              child: QrCodeScannerScreen(
                onVoltar: () => context.pop(),
                onContinuar: (textoQr) => context.push(rotaScanRespostas(provaId, textoQr)),
              ),
            );
          },
        ),
        GoRoute(
          path: '/scan_respostas',
          builder: (context, state) {
            final provaId = _idOpcional(state.uri.queryParameters[_argProvaId]);
            final textoQr = state.uri.queryParameters[_argQr];
            return ChangeNotifierProvider(
              create: (context) => ScanRespostasViewModel(
                ProvaRepository(context.read<AppDatabase>()),
                provaEscolhidaId: provaId,
                textoQr: textoQr,
                usarCamera: usarCamera,
                fotografar: usarCamera ? fotografarFolhaComCamera : null,
              ),
              child: ScanRespostasScreen(
                onVoltar: () => context.pop(),
                onFinalizar: (folha) => context.push(
                  rotaCorrecao(
                    provaId: folha.prova.provaId,
                    aluno: folha.dadosQr.aluno,
                    turma: folha.dadosQr.turma,
                    respostasLidas: folha.validacao.respostas,
                  ),
                ),
              ),
            );
          },
        ),
        ...rotasDeCorrecao(aoConcluir: (context) => context.go(rotaLista), backup: backup),
        GoRoute(
          path: rotaAlunos,
          builder: (context, state) {
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => AlunosViewModel(
                AlunoRepository(
                  database,
                  backup: BackupAlunosFirestore(context.read<IdInstalacao>()),
                ),
                turmaRepository: TurmaRepository(database),
              ),
              child: AlunosScreen(
                onVoltar: () => context.pop(),
                onAbrirTurmasDisciplinas: () => context.push(rotaTurmas),
              ),
            );
          },
        ),
        GoRoute(
          path: '/historico',
          builder: (context, state) {
            final database = context.read<AppDatabase>();
            final backupNuvem = BackupNuvemRepository(
              database,
              backup ?? BackupResultadosFirestore(context.read<IdInstalacao>()),
            );
            return ChangeNotifierProvider(
              create: (_) => HistoricoViewModel(
                repository: HistoricoRepository(database),
                enviarTudoNuvem: backupNuvem.enviarTudo,
                contaId: auth?.usuario?.uid,
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
        GoRoute(
          path: rotaTurmas,
          builder: (context, state) {
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => TurmasDisciplinasViewModel(
                TurmaRepository(database),
                DisciplinaRepository(database),
              ),
              child: TurmasDisciplinasScreen(onVoltar: () => context.pop()),
            );
          },
        ),
        GoRoute(
          path: '/banco-questoes',
          builder: (context, state) {
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => BancoQuestoesViewModel(
                BancoQuestaoRepository(database),
                DisciplinaRepository(database),
              ),
              child: BancoQuestoesScreen(
                onVoltar: () => context.pop(),
                onNovaQuestao: () => context.push(rotaFormularioBancoQuestao(null)),
                onEditarQuestao: (id) => context.push(rotaFormularioBancoQuestao(id)),
              ),
            );
          },
        ),
        GoRoute(
          path: '/banco-questoes/form',
          builder: (context, state) {
            final id = _idOpcional(state.uri.queryParameters['id']);
            final database = context.read<AppDatabase>();
            return ChangeNotifierProvider(
              create: (_) => BancoQuestaoFormViewModel(
                BancoQuestaoRepository(database),
                DisciplinaRepository(database),
                id,
              ),
              child: BancoQuestaoFormScreen(
                onVoltar: () => context.pop(),
                onConcluido: () => context.pop(),
                onAbrirTurmasDisciplinas: () => context.push(rotaTurmas),
              ),
            );
          },
        ),
      ],
    );