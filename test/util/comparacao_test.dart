import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/util/comparacao.dart';

void main() {
  test('ignora maiúsculas e minúsculas', () {
    expect(compararSemCaixa('ana', 'ANA'), 0);
    expect(compararSemCaixa('Ana', 'bruno'), lessThan(0));
    expect(compararSemCaixa('bruno', 'Ana'), greaterThan(0));
  });

  test('o texto mais curto vem antes quando é prefixo do outro', () {
    expect(compararSemCaixa('Ana', 'ana Clara'), lessThan(0));
    expect(compararSemCaixa('', 'a'), lessThan(0));
  });

  test('ordena uma lista como CASE_INSENSITIVE_ORDER', () {
    final nomes = ['carla', 'Bruno', 'ana', 'Álvaro', 'Ana Clara']..sort(compararSemCaixa);
    expect(nomes, ['ana', 'Ana Clara', 'Bruno', 'carla', 'Álvaro']);
  });
}
