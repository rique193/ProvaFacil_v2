import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/scanner/simulador_folha_respostas.dart';

void main() {
  test('lerFolha numera a partir de 1, ignora brancos e põe em maiúscula', () {
    expect(SimuladorFolhaRespostas.lerFolha(['a', null, 'C', ' ']), {
      1: {'A'},
      3: {'C'},
    });
  });

  test('lerFolhaComMultiplas mantém marcação dupla e descarta questões vazias', () {
    expect(
      SimuladorFolhaRespostas.lerFolhaComMultiplas([
        {'a', 'B'},
        {},
        {'e'},
      ]),
      {
        1: {'A', 'B'},
        3: {'E'},
      },
    );
  });
}
