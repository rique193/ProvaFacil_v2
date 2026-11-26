import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/prova/embaralhador.dart';

void main() {
  test('mesma semente produz a mesma ordem sem modificar a origem', () {
    const origem = [1, 2, 3, 4, 5, 6, 7, 8];
    final primeira = Embaralhador.embaralhar(origem, Random(42));
    final segunda = Embaralhador.embaralhar(origem, Random(42));
    expect(primeira, segunda);
    expect(primeira, isNot(orderedEquals(origem)));
    expect(origem, [1, 2, 3, 4, 5, 6, 7, 8]);
    expect(identical(primeira, origem), isFalse);
  });

  test('preserva todos os itens inclusive os repetidos', () {
    final origem = ['a', 'b', 'a', 'c'];
    expect(Embaralhador.embaralhar(origem, Random(1)), unorderedEquals(origem));
  });

  test('aceita listas vazias e com um item e devolve uma cópia', () {
    for (final origem in <List<int>>[
      [],
      [7],
    ]) {
      final copia = Embaralhador.embaralhar(origem, Random(3));
      expect(copia, origem);
      expect(identical(copia, origem), isFalse);
    }
  });
}
