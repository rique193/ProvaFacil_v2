/// Posições fixas da folha de respostas (em pontos de PDF, página A4 em pé, origem no canto
/// superior esquerdo). O gerador do PDF desenha a folha com estas medidas e o leitor da câmera
/// procura as bolinhas nos mesmos lugares, por isso os dois sempre usam esta classe.
///
/// A folha tem um quadrado preto em cada canto: o leitor acha os quatro na foto e, a partir
/// deles, corrige a perspectiva e localiza cada bolinha.
abstract final class LayoutFolhaRespostas {
  static const larguraPagina = 595.2755905511812;
  static const alturaPagina = 841.8897637795275;

  /// Lado dos quadrados pretos de alinhamento.
  static const ladoMarcador = 24.0;

  /// Distância dos quadrados até a borda do papel.
  static const margemMarcador = 36.0;

  /// Quantas questões cabem na folha lida pela câmera (3 colunas de 20).
  static const questoesPorColuna = 20;
  static const colunas = 3;
  static const maxQuestoes = questoesPorColuna * colunas;

  /// Bolinhas: diâmetro, distância entre centros na linha e entre linhas.
  static const diametroBolinha = 17.0;
  static const raioBolinha = diametroBolinha / 2;
  static const passoAlternativa = 23.0;
  static const passoLinha = 23.0;

  /// Altura do centro da primeira linha de bolinhas.
  static const yPrimeiraLinha = 272.0;

  /// Onde começa cada coluna de questões (o número da questão fica antes das bolinhas).
  static const xPrimeiraColuna = 66.0;
  static const passoColuna = 165.0;
  static const larguraNumero = 26.0;
  static const espacoNumero = 8.0;

  /// Canto superior esquerdo de cada quadrado, na ordem: superior esquerdo, superior direito,
  /// inferior esquerdo, inferior direito.
  static const cantosMarcadores = <(double, double)>[
    (margemMarcador, margemMarcador),
    (larguraPagina - margemMarcador - ladoMarcador, margemMarcador),
    (margemMarcador, alturaPagina - margemMarcador - ladoMarcador),
    (larguraPagina - margemMarcador - ladoMarcador, alturaPagina - margemMarcador - ladoMarcador),
  ];

  /// Centro de cada quadrado, na mesma ordem de [cantosMarcadores].
  static List<(double, double)> get centrosMarcadores => [
    for (final (x, y) in cantosMarcadores) (x + ladoMarcador / 2, y + ladoMarcador / 2),
  ];

  /// Canto esquerdo da coluna e centro vertical da linha da questão [numero] (a partir de 1).
  static (double, double) origemLinha(int numero) {
    final indice = numero - 1;
    final coluna = indice ~/ questoesPorColuna;
    final linha = indice % questoesPorColuna;
    return (xPrimeiraColuna + coluna * passoColuna, yPrimeiraLinha + linha * passoLinha);
  }

  /// Centro da bolinha da alternativa [alternativa] (0 = A) da questão [numero].
  static (double, double) centroBolinha(int numero, int alternativa) {
    final (x, y) = origemLinha(numero);
    return (x + larguraNumero + espacoNumero + raioBolinha + alternativa * passoAlternativa, y);
  }

  /// Pontos de papel em branco entre as bolinhas da questão, usados como referência de "branco"
  /// para descontar a iluminação da foto.
  static List<(double, double)> pontosDePapel(int numero, int alternativas) {
    final (_, y) = origemLinha(numero);
    final pontos = <(double, double)>[];
    for (var i = 0; i < alternativas - 1; i++) {
      final (x, _) = centroBolinha(numero, i);
      pontos.add((x + passoAlternativa / 2, y));
    }
    // Entre esta linha e a de baixo, embaixo de cada bolinha.
    for (var i = 0; i < alternativas; i++) {
      final (x, _) = centroBolinha(numero, i);
      pontos.add((x, y + passoLinha / 2));
    }
    return pontos;
  }
}
