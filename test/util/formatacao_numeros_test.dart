import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/util/formatacao_numeros.dart';

void main() {
  test('nota com 1 casa e vírgula', () {
    expect(formatarNota(8.5), '8,5');
    expect(formatarNota(10), '10,0');
    expect(formatarNota(0), '0,0');
  });

  test('nota arredonda HALF_UP: 7,35 vira 7,4 (toStringAsFixed daria 7,3)', () {
    expect(formatarNota(7.35), '7,4');
  });

  test('média com 2 casas e vírgula', () {
    expect(formatarMedia(7.25), '7,25');
    expect(formatarMedia(7.255), '7,26');
    expect(formatarMedia(0), '0,00');
  });
}