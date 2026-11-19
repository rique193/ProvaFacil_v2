import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/correcao/respostas_lidas_codec.dart';

void main() {
  test('codec_idaEVolta', () {
    final respostas = {
      1: {'A'},
      2: {'C'},
      4: {'D', 'B'},
      5: {'E'},
    };
    final texto = RespostasLidasCodec.codificar(respostas);
    expect(texto, 'A,C,,BD,E');
    expect(RespostasLidasCodec.decodificar(texto), respostas);
  });
  test('codec_textoVazioOuNulo', () {
    expect(RespostasLidasCodec.decodificar(null), isEmpty);
    expect(RespostasLidasCodec.decodificar(''), isEmpty);
    expect(RespostasLidasCodec.codificar({}), '');
    expect(RespostasLidasCodec.codificar({3: {}}), '');
  });
  test(
    'codec_ignoraEspacosEMinusculas',
    () => expect(RespostasLidasCodec.decodificar(' a , , c '), {
      1: {'A'},
      3: {'C'},
    }),
  );
  test('em branco, múltipla e última questão respondida', () {
    expect(
      RespostasLidasCodec.codificar({
        2: {'d', 'b'},
        5: {},
      }),
      ',BD',
    );
    expect(RespostasLidasCodec.decodificar(',bD, ,12'), {
      2: {'B', 'D'},
    });
  });
}
