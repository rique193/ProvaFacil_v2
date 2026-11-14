import 'package:freezed_annotation/freezed_annotation.dart';

part 'historico_relacoes.freezed.dart';

/// Resumo de uma prova que tem pelo menos um resultado salvo, para a tela de Histórico. Os valores
/// são agregados dos resultados gravados (nada é recalculado a partir do gabarito).
@freezed
abstract class ProvaCorrigida with _$ProvaCorrigida {
  const factory ProvaCorrigida({
    required int provaId,
    required String titulo,
    required String disciplina,
    required int totalCorrigidos,
    required double media,

    /// `corrigidoEm` do resultado mais recente da prova.
    required int ultimaCorrecaoEm,

    /// Turmas dos alunos corrigidos, separadas por vírgula pelo `GROUP_CONCAT` (pode ser nulo).
    required String? turmas,
  }) = _ProvaCorrigida;
}

/// Nota de um aluno numa prova, como foi gravada na correção.
@freezed
abstract class NotaAluno with _$NotaAluno {
  const factory NotaAluno({
    required int alunoId,
    required String nome,
    required String? matricula,
    required int acertos,
    required double nota,
  }) = _NotaAluno;
}
