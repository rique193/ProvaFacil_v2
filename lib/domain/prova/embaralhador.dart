import 'dart:math';

/// Embaralha uma cópia, preservando a lista de origem.
abstract final class Embaralhador {
  static List<T> embaralhar<T>(List<T> itens, Random random) =>
      List<T>.of(itens)..shuffle(random);
}
