import 'package:freezed_annotation/freezed_annotation.dart';

part 'planilha_relatorio.freezed.dart';

/// Resultado de um aluno como foi gravado na correção, para a aba "Notas".
@freezed
abstract class ResultadoExportacao with _$ResultadoExportacao {
  const factory ResultadoExportacao({
    required String nome,
    required String? matricula,
    required String turma,
    required int acertos,
    required int erros,
    required int emBranco,
    required double nota,
  }) = _ResultadoExportacao;
}
