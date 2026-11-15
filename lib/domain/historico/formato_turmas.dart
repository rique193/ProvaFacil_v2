import '../../util/comparacao.dart';

/// Recebe as turmas separadas por vírgula (do `GROUP_CONCAT`) e devolve uma lista limpa:
/// sem vazios, sem repetidas (ignorando maiúsculas, fica a primeira), em ordem alfabética.
String formatarTurmas(String? turmas) {
  if (turmas == null) return '';
  final vistas = <String>{};
  final unicas = <String>[];
  for (final parte in turmas.split(',')) {
    final turma = parte.trim();
    if (turma.isEmpty) continue;
    if (vistas.add(turma.toLowerCase())) unicas.add(turma);
  }
  unicas.sort(compararSemCaixa);
  return unicas.join(', ');
}