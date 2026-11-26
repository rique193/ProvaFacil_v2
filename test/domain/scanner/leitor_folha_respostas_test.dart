import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:provafacil/domain/scanner/layout_folha_respostas.dart';
import 'package:provafacil/domain/scanner/leitor_folha_respostas.dart';

const _letras = ['A', 'B', 'C', 'D', 'E'];

/// Cor da folha impressa no ponto (x, y) da página, em pontos: 0 = preto, 255 = branco.
/// [marcadas]: questão → alternativas pintadas pelo aluno.
int _corDaPagina(double x, double y, int totalQuestoes, Map<int, Set<int>> marcadas) {
  for (final (mx, my) in LayoutFolhaRespostas.cantosMarcadores) {
    if (x >= mx && x <= mx + LayoutFolhaRespostas.ladoMarcador && y >= my && y <= my + LayoutFolhaRespostas.ladoMarcador) return 15;
  }
  // Um "QR Code" (xadrez preto e branco) no lugar de onde fica o de verdade.
  if (x > 370 && x < 530 && y > 70 && y < 230) {
    return ((x ~/ 5) + (y ~/ 5)).isEven ? 20 : 250;
  }
  for (var n = 1; n <= totalQuestoes; n++) {
    for (var i = 0; i < 5; i++) {
      final (cx, cy) = LayoutFolhaRespostas.centroBolinha(n, i);
      final d = math.sqrt((x - cx) * (x - cx) + (y - cy) * (y - cy));
      if (d > LayoutFolhaRespostas.raioBolinha + 1) continue;
      if (marcadas[n]?.contains(i) ?? false) {
        if (d <= LayoutFolhaRespostas.raioBolinha - 1) return 40;
      }
      if ((d - LayoutFolhaRespostas.raioBolinha).abs() < 0.5) return 30; // contorno
      // A letra cinza dentro da bolinha vazia.
      if ((x - cx).abs() < 2 && (y - cy).abs() < 3) return 170;
    }
  }
  return 245;
}

/// "Foto" da folha: página girada, com perspectiva, sobre uma mesa escura e com luz desigual.
img.Image _fotografar(
  int totalQuestoes,
  Map<int, Set<int>> marcadas, {
  double angulo = 0.06,
  double inclinacao = 0.00012,
}) {
  const largura = 1200;
  const altura = 1600;
  final foto = img.Image(width: largura, height: altura);
  const escala = 1.75;
  final cosA = math.cos(angulo);
  final sinA = math.sin(angulo);
  for (var v = 0; v < altura; v++) {
    for (var u = 0; u < largura; u++) {
      // Inverso de: rotação + escala + deslocamento, com uma leve perspectiva vertical.
      final w = 1 + inclinacao * (v - altura / 2);
      final ux = (u - 80) * w;
      final vy = (v - 60) * w;
      final px = (cosA * ux + sinA * vy) / escala;
      final py = (-sinA * ux + cosA * vy) / escala;
      int cor;
      if (px < 0 || py < 0 || px > LayoutFolhaRespostas.larguraPagina ||
          py > LayoutFolhaRespostas.alturaPagina) {
        cor = 70; // a mesa
      } else {
        cor = _corDaPagina(px, py, totalQuestoes, marcadas);
        // Sombra: o lado direito da folha fica mais escuro.
        cor = (cor * (1 - 0.3 * u / largura)).round();
      }
      foto.setPixelRgb(u, v, cor, cor, cor);
    }
  }
  return foto;
}

List<List<String>> _prova(int questoes) => [for (var i = 0; i < questoes; i++) _letras];

void main() {
  test('lê as bolinhas pintadas, com a folha girada, inclinada e com sombra', () {
    final marcadas = {1: {0}, 2: {3}, 3: {1}, 5: {4}, 8: {2}, 21: {0}, 40: {3}, 45: {1}};
    final foto = _fotografar(45, marcadas);

    final leitura = LeitorFolhaRespostas.lerImagem(foto, letrasPorQuestao: _prova(45));

    expect(leitura, isA<FolhaLida>());
    final respostas = (leitura as FolhaLida).respostas;
    expect(respostas, {
      for (final MapEntry(:key, :value) in marcadas.entries) key: {for (final i in value) _letras[i]},
    });
  });

  test('marcação dupla volta com as duas letras', () {
    final foto = _fotografar(10, {1: {0, 2}, 2: {1}});

    final leitura = LeitorFolhaRespostas.lerImagem(foto, letrasPorQuestao: _prova(10));

    expect((leitura as FolhaLida).respostas, {
      1: {'A', 'C'},
      2: {'B'},
    });
  });

  test('folha em branco não tem marcações', () {
    final leitura = LeitorFolhaRespostas.lerImagem(
      _fotografar(10, const {}),
      letrasPorQuestao: _prova(10),
    );

    expect((leitura as FolhaLida).respostas, isEmpty);
  });

  test('foto sem a folha avisa que não achou os quadrados', () {
    final vazia = img.Image(width: 800, height: 1000);
    img.fill(vazia, color: img.ColorRgb8(200, 200, 200));

    final leitura = LeitorFolhaRespostas.lerImagem(vazia, letrasPorQuestao: _prova(10));

    expect(leitura, isA<FalhaLeituraFolha>());
    expect((leitura as FalhaLeituraFolha).mensagem, contains('quadrados pretos'));
  });

  test('prova com mais questões do que cabem na folha é recusada', () {
    final leitura = LeitorFolhaRespostas.ler(
      img.encodePng(img.Image(width: 10, height: 10)),
      letrasPorQuestao: _prova(LayoutFolhaRespostas.maxQuestoes + 1),
    );

    expect(leitura, isA<FalhaLeituraFolha>());
  });

  test('as bolinhas cabem dentro dos quadrados e não encostam no QR Code', () {
      final (xUltima, yUltima) = LayoutFolhaRespostas.centroBolinha(LayoutFolhaRespostas.maxQuestoes, 4);
    expect(xUltima + LayoutFolhaRespostas.raioBolinha, lessThan(LayoutFolhaRespostas.larguraPagina - LayoutFolhaRespostas.margemMarcador));
    expect(yUltima + LayoutFolhaRespostas.raioBolinha, lessThan(LayoutFolhaRespostas.alturaPagina - LayoutFolhaRespostas.margemMarcador - LayoutFolhaRespostas.ladoMarcador));
    final (_, yPrimeira) = LayoutFolhaRespostas.centroBolinha(1, 0);
    expect(yPrimeira - LayoutFolhaRespostas.raioBolinha, greaterThan(240));
  });
}
