import 'package:freezed_annotation/freezed_annotation.dart';

part 'questao_input.freezed.dart';

/// Dados de uma questão vindos do formulário de conteúdo da prova (enunciado + texto das
/// alternativas). Não carrega qual alternativa é a correta: isso é definido depois, na tela
/// de Gabarito (ver `ProvaRepository.salvarGabarito`).
@freezed
abstract class QuestaoInput with _$QuestaoInput {
  const factory QuestaoInput({
    required String enunciado,
    required List<AlternativaInput> alternativas,
    int? id,
  }) = _QuestaoInput;
}

@freezed
abstract class AlternativaInput with _$AlternativaInput {
  const factory AlternativaInput({required String texto, int? id}) = _AlternativaInput;
}
