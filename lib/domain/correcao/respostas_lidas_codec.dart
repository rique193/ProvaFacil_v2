abstract final class RespostasLidasCodec {
  static String codificar(Map<int, Set<String>> respostas) {
    final respondidas =
        respostas.entries
            .where((e) => e.value.isNotEmpty)
            .map((e) => e.key)
            .toList()
          ..sort();
    if (respondidas.isEmpty) return '';
    return [
      for (var numero = 1; numero <= respondidas.last; numero++)
        ((respostas[numero] ?? <String>{}).map((l) => l.toUpperCase()).toList()
              ..sort())
            .join(),
    ].join(',');
  }

  static Map<int, Set<String>> decodificar(String? texto) {
    if (texto == null || texto.trim().isEmpty) return {};
    final respostas = <int, Set<String>>{};
    for (final (indice, trecho) in texto.split(',').indexed) {
      final letras = RegExp(
        r'\p{L}',
        unicode: true,
      ).allMatches(trecho).map((m) => m.group(0)!.toUpperCase()).toSet();
      if (letras.isNotEmpty) respostas[indice + 1] = letras;
    }
    return respostas;
  }
}
