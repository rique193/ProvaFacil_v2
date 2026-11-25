import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/prova/status_prova.dart';

part 'progresso_prova.freezed.dart';

/// Quantos alunos já foram corrigidos numa prova e quantos alunos a turma dela tem.
@freezed
abstract class ProgressoProva with _$ProgressoProva {
  const ProgressoProva._();

  const factory ProgressoProva({
    required int provaId,

    /// Alunos cadastrados na `provas.turma` (0 se a prova não tem turma).
    required int totalAlunosTurma,

    /// Resultados salvos da prova.
    required int totalCorrigidos,
  }) = _ProgressoProva;

  StatusProva get status => StatusProva.calcular(
    totalAlunosTurma: totalAlunosTurma,
    totalCorrigidos: totalCorrigidos,
  );

  /// "X de Y corrigidos". Sem alunos na turma, só o total corrigido.
  String get textoProgresso => totalAlunosTurma == 0
      ? '$totalCorrigidos corrigido${totalCorrigidos == 1 ? '' : 's'}'
      : '$totalCorrigidos de $totalAlunosTurma corrigidos';
}
