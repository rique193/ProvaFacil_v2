import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_database.dart';

part 'resultado_com_detalhes.freezed.dart';

/// Um resultado com tudo o que a tela de resultado individual precisa: o aluno, a prova e a
/// resposta dada em cada questão.
@freezed
abstract class ResultadoComDetalhes with _$ResultadoComDetalhes {
  const factory ResultadoComDetalhes({
    required ResultadoEntity resultado,
    required AlunoEntity aluno,
    required ProvaEntity prova,
    required List<RespostaAlunoEntity> respostas,
  }) = _ResultadoComDetalhes;
}

/// Um resultado junto com o aluno (para listagens de resultados de uma prova).
@freezed
abstract class ResultadoComAluno with _$ResultadoComAluno {
  const factory ResultadoComAluno({
    required ResultadoEntity resultado,
    required AlunoEntity aluno,
  }) = _ResultadoComAluno;
}
