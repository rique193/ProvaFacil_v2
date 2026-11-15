import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/historico/resumo_notas.dart';

void main() {
  test('sem notas tudo é zero', () {
    expect(ResumoNotas.de([]), const ResumoNotas(media: 0, maiorNota: 0, menorNota: 0));
  });

  test('calcula média, maior e menor', () {
    final resumo = ResumoNotas.de([10, 5, 7.5]);
    expect(resumo.media, closeTo(7.5, 1e-9));
    expect(resumo.maiorNota, 10);
    expect(resumo.menorNota, 5);
  });
}