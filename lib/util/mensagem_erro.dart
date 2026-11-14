/// Equivalente ao `e.message` do Kotlin: a mensagem das validações (`ArgumentError`) e dos
/// estados inválidos (`StateError`); `null` para os demais erros.
String? mensagemDoErro(Object erro) => switch (erro) {
  ArgumentError(:final String message) => message,
  StateError(:final message) => message,
  _ => null,
};
