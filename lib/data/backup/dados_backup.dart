import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/correcao/corretor_prova.dart';

part 'dados_backup.freezed.dart';

/// Um resultado gravado, com a prova e o aluno, como sai do banco para o backup.
@freezed
abstract class LinhaResultadoBackup with _$LinhaResultadoBackup {
  const factory LinhaResultadoBackup({
    required int resultadoId,
    required int provaId,
    required String tituloProva,
    required String disciplina,
    required int alunoId,
    required String nomeAluno,
    required String turma,
    required String? matricula,
    required int totalQuestoes,
    required int acertos,
    required int erros,
    required int emBranco,
    required double nota,
    required double notaMaxima,
    required int corrigidoEm,
  }) = _LinhaResultadoBackup;
}

/// A resposta de uma questão dentro de um resultado gravado.
@freezed
abstract class LinhaRespostaBackup with _$LinhaRespostaBackup {
  const factory LinhaRespostaBackup({
    required int resultadoId,
    required int questaoId,
    required int numeroQuestao,
    required String letrasMarcadas,
    required String letraCorreta,
    required SituacaoQuestao situacao,
  }) = _LinhaRespostaBackup;
}

/// Resultado pronto para virar um documento da coleção "resultados", com as respostas em ordem.
@freezed
abstract class ResultadoParaBackup with _$ResultadoParaBackup {
  const factory ResultadoParaBackup({
    required LinhaResultadoBackup resultado,
    required List<LinhaRespostaBackup> respostas,
  }) = _ResultadoParaBackup;
}
