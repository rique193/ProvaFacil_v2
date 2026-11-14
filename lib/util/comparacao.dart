/// Equivalente a `String.CASE_INSENSITIVE_ORDER` do Kotlin/Java: compara caractere a caractere,
/// primeiro em maiúsculas e depois em minúsculas, e desempata pelo tamanho.
int compararSemCaixa(String a, String b) {
  final tamanho = a.length < b.length ? a.length : b.length;
  for (var i = 0; i < tamanho; i++) {
    var c1 = a[i];
    var c2 = b[i];
    if (c1 == c2) continue;
    c1 = _maiuscula(c1);
    c2 = _maiuscula(c2);
    if (c1 == c2) continue;
    c1 = _minuscula(c1);
    c2 = _minuscula(c2);
    if (c1 != c2) return c1.codeUnitAt(0) - c2.codeUnitAt(0);
  }
  return a.length - b.length;
}

String _maiuscula(String c) {
  final convertido = c.toUpperCase();
  return convertido.length == 1 ? convertido : c;
}

String _minuscula(String c) {
  final convertido = c.toLowerCase();
  return convertido.length == 1 ? convertido : c;
}
