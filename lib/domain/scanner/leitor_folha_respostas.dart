import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

import 'layout_folha_respostas.dart';

sealed class ResultadoLeituraFolha {
  const ResultadoLeituraFolha();
}

/// A folha foi encontrada na foto. [respostas]: número da questão (a partir de 1) → letras
/// marcadas (o mesmo formato do simulador). Questões em branco não aparecem.
class FolhaLida extends ResultadoLeituraFolha {
  const FolhaLida(this.respostas, {this.escuridao = const {}});
  final Map<int, Set<String>> respostas;

  /// Quanto cada bolinha estava pintada (0 = branca, 1 = preta), para depuração.
  final Map<int, List<double>> escuridao;
}

class FalhaLeituraFolha extends ResultadoLeituraFolha {
  const FalhaLeituraFolha(this.mensagem);
  final String mensagem;
}

/// Parâmetros da leitura, num formato que pode ser enviado para outro isolate.
typedef PedidoLeituraFolha = ({Uint8List foto, List<List<String>> letrasPorQuestao});

/// Lê as marcações de uma foto da folha de respostas desenhada com [LayoutFolhaRespostas].
///
/// 1. acha os quatro quadrados pretos dos cantos;
/// 2. calcula a perspectiva (homografia) da página para a foto;
/// 3. mede o quanto cada bolinha está pintada, comparando com o papel em volta.
abstract final class LeitorFolhaRespostas {
  /// Maior lado da imagem processada, em pixels. Fotos maiores são reduzidas (mais rápido).
  static const ladoMaximo = 1600;

  /// Uma bolinha conta como marcada a partir desta escuridão...
  static const escuridaoMinima = 0.33;

  /// ... e se for pelo menos esta fração da bolinha mais escura da questão.
  static const fracaoDaMaisEscura = 0.6;

  /// Para chamar com `compute`.
  static ResultadoLeituraFolha lerPedido(PedidoLeituraFolha pedido) =>
      ler(pedido.foto, letrasPorQuestao: pedido.letrasPorQuestao);

  static ResultadoLeituraFolha ler(Uint8List foto, {required List<List<String>> letrasPorQuestao}) {
    if (letrasPorQuestao.length > LayoutFolhaRespostas.maxQuestoes) {
      return const FalhaLeituraFolha(
        'A leitura pela câmera aceita provas de até ${LayoutFolhaRespostas.maxQuestoes} questões.',
      );
    }
    final decodificada = img.decodeImage(foto);
    if (decodificada == null) {
      return const FalhaLeituraFolha('Não foi possível abrir a foto. Tente de novo.');
    }
    return lerImagem(decodificada, letrasPorQuestao: letrasPorQuestao);
  }

  static ResultadoLeituraFolha lerImagem(
    img.Image imagem, {
    required List<List<String>> letrasPorQuestao,
  }) {
    var trabalho = img.bakeOrientation(imagem);
    final maior = math.max(trabalho.width, trabalho.height);
    if (maior > ladoMaximo) {
      trabalho = trabalho.width >= trabalho.height
          ? img.copyResize(trabalho, width: ladoMaximo, interpolation: img.Interpolation.average)
          : img.copyResize(trabalho, height: ladoMaximo, interpolation: img.Interpolation.average);
    }
    final cinza = _Cinza.de(trabalho);

    final marcadores = _acharMarcadores(cinza);
    if (marcadores == null) {
      return const FalhaLeituraFolha(
        'Não encontrei os 4 quadrados pretos dos cantos da folha. Fotografe a folha inteira, de '
        'cima, com boa luz e sem cortar os cantos.',
      );
    }

    final homografia = _Homografia.dePontos(LayoutFolhaRespostas.centrosMarcadores, marcadores);
    if (homografia == null) {
      return const FalhaLeituraFolha(
        'A folha está muito inclinada na foto. Tente de novo, de cima.',
      );
    }

    final respostas = <int, Set<String>>{};
    final escuridao = <int, List<double>>{};
    for (final (indice, letras) in letrasPorQuestao.indexed) {
      final numero = indice + 1;
      final branco = _mediaEmPontos(
        cinza,
        homografia,
        LayoutFolhaRespostas.pontosDePapel(numero, letras.length),
        raio: 1.5,
      );
      if (branco <= 0) continue;
      final valores = [
        for (var i = 0; i < letras.length; i++)
          (1 -
                  _mediaEmPontos(cinza, homografia, [
                        LayoutFolhaRespostas.centroBolinha(numero, i),
                      ], raio: LayoutFolhaRespostas.raioBolinha * 0.6) /
                      branco)
              .clamp(0.0, 1.0),
      ];
      escuridao[numero] = valores;
      final maisEscura = valores.fold<double>(0, math.max);
      if (maisEscura < escuridaoMinima) continue;
      final marcadas = {
        for (var i = 0; i < valores.length; i++)
          if (valores[i] >= escuridaoMinima && valores[i] >= maisEscura * fracaoDaMaisEscura)
            letras[i],
      };
      if (marcadas.isNotEmpty) respostas[numero] = marcadas;
    }
    return FolhaLida(respostas, escuridao: escuridao);
  }

  /// Média do cinza em discos de [raio] (em pontos da página) em volta de cada ponto.
  static double _mediaEmPontos(
    _Cinza cinza,
    _Homografia h,
    List<(double, double)> pontos, {
    required double raio,
  }) {
    var soma = 0.0;
    var quantidade = 0;
    const passos = 4;
    for (final (px, py) in pontos) {
      for (var i = -passos; i <= passos; i++) {
        for (var j = -passos; j <= passos; j++) {
          final dx = raio * i / passos;
          final dy = raio * j / passos;
          if (dx * dx + dy * dy > raio * raio) continue;
          final (x, y) = h.aplicar(px + dx, py + dy);
          final valor = cinza.amostra(x, y);
          if (valor == null) continue;
          soma += valor;
          quantidade++;
        }
      }
    }
    return quantidade == 0 ? -1 : soma / quantidade;
  }

  /// Centros (em pixels) dos quatro quadrados: superior esquerdo, superior direito, inferior
  /// esquerdo, inferior direito. Nulo se algum não for encontrado.
  static List<(double, double)>? _acharMarcadores(_Cinza cinza) {
    final candidatos = _candidatos(cinza);
    if (candidatos.length < 4) return null;
    final w = cinza.largura.toDouble();
    final h = cinza.altura.toDouble();
    final cantos = [(0.0, 0.0), (w, 0.0), (0.0, h), (w, h)];
    final escolhidos = <_Componente>[];
    for (final (cx, cy) in cantos) {
      _Componente? melhor;
      var menorDistancia = double.infinity;
      for (final c in candidatos) {
        if (escolhidos.contains(c)) continue;
        final d = math.sqrt(math.pow(c.cx - cx, 2) + math.pow(c.cy - cy, 2));
        if (d < menorDistancia) {
          menorDistancia = d;
          melhor = c;
        }
      }
      if (melhor == null) return null;
      escolhidos.add(melhor);
    }
    // Os quatro devem ter tamanhos parecidos (a perspectiva muda um pouco o tamanho).
    final areas = escolhidos.map((c) => c.area).toList()..sort();
    if (areas.last > areas.first * 4) return null;
    final (tl, tr, bl, br) = (escolhidos[0], escolhidos[1], escolhidos[2], escolhidos[3]);
    // Cada um tem de ficar do lado certo (esquerda/direita, cima/baixo).
    if (tl.cx >= tr.cx || bl.cx >= br.cx || tl.cy >= bl.cy || tr.cy >= br.cy) return null;
    // A folha precisa ocupar uma parte razoável da foto.
    final larguraFolha = math.min(tr.cx - tl.cx, br.cx - bl.cx);
    final alturaFolha = math.min(bl.cy - tl.cy, br.cy - tr.cy);
    if (larguraFolha < w * 0.25 || alturaFolha < h * 0.25) return null;
    return [for (final c in escolhidos) (c.cx, c.cy)];
  }

  /// Manchas escuras com forma de quadrado cheio, do tamanho esperado para os marcadores.
  static List<_Componente> _candidatos(_Cinza cinza) {
    final w = cinza.largura;
    final h = cinza.altura;
    final escuro = cinza.binarizar();
    final visitado = Uint8List(w * h);
    final pilha = <int>[];
    final areaImagem = w * h;
    final candidatos = <_Componente>[];

    for (var inicio = 0; inicio < w * h; inicio++) {
      if (escuro[inicio] == 0 || visitado[inicio] == 1) continue;
      var area = 0;
      var minX = w, maxX = 0, minY = h, maxY = 0;
      var somaX = 0.0, somaY = 0.0;
      var tocaBorda = false;
      pilha
        ..clear()
        ..add(inicio);
      visitado[inicio] = 1;
      while (pilha.isNotEmpty) {
        final p = pilha.removeLast();
        final x = p % w;
        final y = p ~/ w;
        area++;
        somaX += x;
        somaY += y;
        if (x < minX) minX = x;
        if (x > maxX) maxX = x;
        if (y < minY) minY = y;
        if (y > maxY) maxY = y;
        if (x == 0 || y == 0 || x == w - 1 || y == h - 1) tocaBorda = true;
        if (x > 0) _empilhar(p - 1, escuro, visitado, pilha);
        if (x < w - 1) _empilhar(p + 1, escuro, visitado, pilha);
        if (y > 0) _empilhar(p - w, escuro, visitado, pilha);
        if (y < h - 1) _empilhar(p + w, escuro, visitado, pilha);
      }
      if (tocaBorda) continue;
      final largura = maxX - minX + 1;
      final altura = maxY - minY + 1;
      if (largura < 6 || altura < 6) continue;
      final proporcao = largura / altura;
      if (proporcao < 0.6 || proporcao > 1.67) continue;
      if (area < areaImagem * 0.00004 || area > areaImagem * 0.02) continue;
      final preenchimento = area / (largura * altura);
      if (preenchimento < 0.6) continue;
      candidatos.add(_Componente(area: area, cx: somaX / area, cy: somaY / area));
    }
    return candidatos;
  }

  static void _empilhar(int p, Uint8List escuro, Uint8List visitado, List<int> pilha) {
    if (escuro[p] == 1 && visitado[p] == 0) {
      visitado[p] = 1;
      pilha.add(p);
    }
  }
}

class _Componente {
  _Componente({required this.area, required this.cx, required this.cy});
  final int area;
  final double cx;
  final double cy;
}

/// Imagem em tons de cinza (0 = preto, 255 = branco).
class _Cinza {
  _Cinza(this.largura, this.altura, this.valores);

  factory _Cinza.de(img.Image imagem) {
    final w = imagem.width;
    final h = imagem.height;
    final valores = Uint8List(w * h);
    for (final p in imagem) {
      valores[p.y * w + p.x] = p.luminance.round().clamp(0, 255);
    }
    return _Cinza(w, h, valores);
  }

  final int largura;
  final int altura;
  final Uint8List valores;

  /// Valor interpolado em (x, y); nulo fora da imagem.
  double? amostra(double x, double y) {
    if (x < 0 || y < 0 || x > largura - 1 || y > altura - 1) return null;
    final x0 = x.floor();
    final y0 = y.floor();
    final x1 = math.min(x0 + 1, largura - 1);
    final y1 = math.min(y0 + 1, altura - 1);
    final fx = x - x0;
    final fy = y - y0;
    final a = valores[y0 * largura + x0];
    final b = valores[y0 * largura + x1];
    final c = valores[y1 * largura + x0];
    final d = valores[y1 * largura + x1];
    return a * (1 - fx) * (1 - fy) + b * fx * (1 - fy) + c * (1 - fx) * fy + d * fx * fy;
  }

  /// 1 onde o pixel é bem mais escuro que a vizinhança (limiar adaptativo com imagem integral),
  /// o que funciona mesmo com sombra ou luz desigual na foto.
  Uint8List binarizar() {
    final w = largura;
    final h = altura;
    final integral = Float64List((w + 1) * (h + 1));
    for (var y = 0; y < h; y++) {
      var somaLinha = 0.0;
      for (var x = 0; x < w; x++) {
        somaLinha += valores[y * w + x];
        integral[(y + 1) * (w + 1) + (x + 1)] = integral[y * (w + 1) + (x + 1)] + somaLinha;
      }
    }
    final raio = math.max(15, math.max(w, h) ~/ 12);
    final escuro = Uint8List(w * h);
    for (var y = 0; y < h; y++) {
      final y0 = math.max(0, y - raio);
      final y1 = math.min(h - 1, y + raio);
      for (var x = 0; x < w; x++) {
        final x0 = math.max(0, x - raio);
        final x1 = math.min(w - 1, x + raio);
        final area = (x1 - x0 + 1) * (y1 - y0 + 1);
        final soma =
            integral[(y1 + 1) * (w + 1) + (x1 + 1)] -
            integral[y0 * (w + 1) + (x1 + 1)] -
            integral[(y1 + 1) * (w + 1) + x0] +
            integral[y0 * (w + 1) + x0];
        final media = soma / area;
        if (valores[y * w + x] < media * 0.65) escuro[y * w + x] = 1;
      }
    }
    return escuro;
  }
}

/// Transformação de perspectiva da página (pontos) para a foto (pixels).
class _Homografia {
  _Homografia(this._h);
  final List<double> _h;

  (double, double) aplicar(double x, double y) {
    final w = _h[6] * x + _h[7] * y + 1;
    return ((_h[0] * x + _h[1] * y + _h[2]) / w, (_h[3] * x + _h[4] * y + _h[5]) / w);
  }

  static _Homografia? dePontos(List<(double, double)> origem, List<(double, double)> destino) {
    final a = List.generate(8, (_) => List<double>.filled(9, 0));
    for (var i = 0; i < 4; i++) {
      final (x, y) = origem[i];
      final (u, v) = destino[i];
      a[2 * i] = [x, y, 1, 0, 0, 0, -u * x, -u * y, u];
      a[2 * i + 1] = [0, 0, 0, x, y, 1, -v * x, -v * y, v];
    }
    // Eliminação de Gauss com pivotamento parcial.
    for (var col = 0; col < 8; col++) {
      var pivo = col;
      for (var lin = col + 1; lin < 8; lin++) {
        if (a[lin][col].abs() > a[pivo][col].abs()) pivo = lin;
      }
      if (a[pivo][col].abs() < 1e-12) return null;
      final troca = a[col];
      a[col] = a[pivo];
      a[pivo] = troca;
      for (var lin = 0; lin < 8; lin++) {
        if (lin == col) continue;
        final fator = a[lin][col] / a[col][col];
        if (fator == 0) continue;
        for (var k = col; k < 9; k++) {
          a[lin][k] -= fator * a[col][k];
        }
      }
    }
    return _Homografia([for (var i = 0; i < 8; i++) a[i][8] / a[i][i]]);
  }
}
