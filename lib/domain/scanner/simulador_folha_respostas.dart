/// Faz o papel do leitor óptico enquanto o app não usa a câmera de verdade: transforma as
/// marcações de uma folha (uma posição por questão, `null` = nada detectado) no mesmo formato que
/// um scanner real entregaria: número da questão (a partir de 1) → letras marcadas.
abstract final class SimuladorFolhaRespostas {
  static Map<int, Set<String>> lerFolha(List<String?> marcacoes) => {
    for (final (indice, letra) in marcacoes.indexed)
      if (letra != null && letra.trim().isNotEmpty) indice + 1: {letra.trim().toUpperCase()},
  };

  /// Versão que aceita várias letras por questão (para simular marcação dupla).
  static Map<int, Set<String>> lerFolhaComMultiplas(List<Set<String>> marcacoes) => {
    for (final (indice, letras) in marcacoes.indexed)
      if (_normalizar(letras) case final lidas when lidas.isNotEmpty) indice + 1: lidas,
  };

  static Set<String> _normalizar(Set<String> letras) => {
    for (final letra in letras)
      if (letra.trim().isNotEmpty) letra.trim().toUpperCase(),
  };
}
