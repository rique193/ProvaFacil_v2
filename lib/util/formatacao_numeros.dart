/// Nota com 1 casa decimal e vírgula (8,5).
String formatarNota(double valor) => _formatarHalfUp(valor, 1);

/// Média com 2 casas decimais e vírgula (7,25).
String formatarMedia(double valor) => _formatarHalfUp(valor, 2);

/// Arredonda HALF_UP sobre os dígitos de `valor.toString()`, como o `String.format` do Java.
String _formatarHalfUp(double valor, int casas) {
  if (valor.isNaN) return 'NaN';
  if (valor.isInfinite) return valor.isNegative ? '-Infinity' : 'Infinity';

  final partes = valor.abs().toString().toLowerCase().split('e');
  final mantissa = partes[0];
  final expoente = partes.length > 1 ? int.parse(partes[1]) : 0;
  final ponto = mantissa.indexOf('.');
  final inteiros = ponto < 0 ? mantissa : mantissa.substring(0, ponto);
  final fracao = ponto < 0 ? '' : mantissa.substring(ponto + 1);

  // O número vale digitos / 10^escala.
  final digitos = BigInt.parse(inteiros + fracao);
  final escala = fracao.length - expoente;
  final deslocamento = escala - casas;

  final BigInt escalado;
  if (deslocamento <= 0) {
    escalado = digitos * BigInt.from(10).pow(-deslocamento);
  } else {
    final divisor = BigInt.from(10).pow(deslocamento);
    final quociente = digitos ~/ divisor;
    final resto = digitos % divisor;
    escalado = resto * BigInt.two >= divisor ? quociente + BigInt.one : quociente;
  }

  final texto = escalado.toString().padLeft(casas + 1, '0');
  final parteInteira = texto.substring(0, texto.length - casas);
  final parteDecimal = texto.substring(texto.length - casas);
  final sinal = valor < 0 ? '-' : '';
  return '$sinal$parteInteira,$parteDecimal';
}