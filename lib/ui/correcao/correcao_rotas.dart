import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/local/app_database.dart';
import '../../data/repository/prova_repository.dart';
import '../../data/repository/resultado_repository.dart';
import '../../domain/correcao/respostas_lidas_codec.dart';
import 'corrigir/correcao_screen.dart';
import 'corrigir/correcao_view_model.dart';
import 'resultado/resultado_screen.dart';
import 'resultado/resultado_view_model.dart';

String rotaCorrecao({
  int? provaId,
  String aluno = '',
  String turma = '',
  Map<int, Set<String>> respostasLidas = const {},
}) {
  final respostas = RespostasLidasCodec.codificar(respostasLidas);
  final parametros = [
    'provaId=${provaId ?? -1}',
    if (aluno.trim().isNotEmpty) 'aluno=${Uri.encodeComponent(aluno)}',
    if (turma.trim().isNotEmpty) 'turma=${Uri.encodeComponent(turma)}',
    if (respostas.isNotEmpty) 'respostas=${Uri.encodeComponent(respostas)}',
  ];
  return '/correcao?${parametros.join('&')}';
}

String rotaResultado(int id) => '/resultados/$id';

List<RouteBase> rotasDeCorrecao({
  required void Function(BuildContext) aoConcluir,
}) => [
  GoRoute(
    path: '/correcao',
    builder: (context, state) {
      final parametros = state.uri.queryParameters;
      final id = int.tryParse(parametros['provaId'] ?? '');
      return ChangeNotifierProvider(
        create: (context) => CorrecaoViewModel(
          ProvaRepository(context.read<AppDatabase>()),
          ResultadoRepository(context.read<AppDatabase>()),
          provaIdInicial: id == -1 ? null : id,
          alunoInicial: parametros['aluno'] ?? '',
          turmaInicial: parametros['turma'] ?? '',
          respostasIniciais: RespostasLidasCodec.decodificar(
            parametros['respostas'],
          ),
        ),
        child: CorrecaoScreen(
          onVoltar: () => context.pop(),
          onCorrigido: (id) => context.pushReplacement(rotaResultado(id)),
        ),
      );
    },
  ),
  GoRoute(
    path: '/resultados/:resultadoId',
    builder: (context, state) {
      final id = int.parse(state.pathParameters['resultadoId']!);
      return ChangeNotifierProvider(
        create: (context) => ResultadoViewModel(
          ResultadoRepository(context.read<AppDatabase>()),
          id,
        ),
        child: ResultadoScreen(
          onVoltar: () => context.pop(),
          onConcluir: () => aoConcluir(context),
        ),
      );
    },
  ),
];
