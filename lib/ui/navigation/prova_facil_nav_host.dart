import 'package:go_router/go_router.dart';

import '../components/tela_provisoria.dart';

const _argProvaId = 'provaId';
const _argQr = 'qr';
const _argAluno = 'aluno';
const _argTurma = 'turma';
const _argRespostas = 'respostas';
const _argResultadoId = 'resultadoId';

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
          builder: (context, state) => const TelaProvisoria(nome: 'ProvaList'),
        ),
        GoRoute(
          path: '/provas/form',
          builder: (context, state) {
            final provaId = _idOpcional(state.uri.queryParameters[_argProvaId]);
            return TelaProvisoria(nome: 'ProvaForm', parametros: {_argProvaId: provaId});
          },
        ),
        GoRoute(
          path: '/provas/:$_argProvaId/gabarito',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters[_argProvaId]!);
            return TelaProvisoria(nome: 'Gabarito', parametros: {_argProvaId: provaId});
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
        GoRoute(
          path: '/correcao',
          builder: (context, state) {
            final parametros = state.uri.queryParameters;
            return TelaProvisoria(
              nome: 'Correcao',
              parametros: {
                _argProvaId: _idOpcional(parametros[_argProvaId]),
                _argAluno: parametros[_argAluno] ?? '',
                _argTurma: parametros[_argTurma] ?? '',
                _argRespostas: parametros[_argRespostas],
              },
            );
          },
        ),
        GoRoute(
          path: '/resultados/:$_argResultadoId',
          builder: (context, state) {
            final resultadoId = int.parse(state.pathParameters[_argResultadoId]!);
            return TelaProvisoria(nome: 'Resultado', parametros: {_argResultadoId: resultadoId});
          },
        ),
        GoRoute(
          path: rotaAlunos,
          builder: (context, state) => const TelaProvisoria(nome: 'Alunos'),
        ),
        GoRoute(
          path: rotaHistorico,
          builder: (context, state) => const TelaProvisoria(nome: 'Historico'),
        ),
        GoRoute(
          path: '/estatisticas/:$_argProvaId',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters[_argProvaId]!);
            return TelaProvisoria(nome: 'Estatisticas', parametros: {_argProvaId: provaId});
          },
        ),
        GoRoute(
          path: '/relatorio/:$_argProvaId',
          builder: (context, state) {
            final provaId = int.parse(state.pathParameters[_argProvaId]!);
            return TelaProvisoria(nome: 'RelatorioNotas', parametros: {_argProvaId: provaId});
          },
        ),
      ],
    );
