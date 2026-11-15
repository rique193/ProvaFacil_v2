import 'package:freezed_annotation/freezed_annotation.dart';

part 'resumo_notas.freezed.dart';

/// Média, maior e menor nota de uma lista de notas. Sem notas, tudo é 0.
@freezed
abstract class ResumoNotas with _$ResumoNotas {
  const ResumoNotas._();

  const factory ResumoNotas({
    required double media,
    required double maiorNota,
    required double menorNota,
  }) = _ResumoNotas;

  factory ResumoNotas.de(List<double> notas) {
    if (notas.isEmpty) return const ResumoNotas(media: 0, maiorNota: 0, menorNota: 0);
    final soma = notas.fold<double>(0, (total, nota) => total + nota);
    return ResumoNotas(
      media: soma / notas.length,
      maiorNota: notas.reduce((a, b) => a > b ? a : b),
      menorNota: notas.reduce((a, b) => a < b ? a : b),
    );
  }
}