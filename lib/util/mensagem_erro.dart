import 'dart:io';

import 'package:flutter/services.dart' show PlatformException;

/// Equivalente ao `e.message` do Kotlin: a mensagem das validações (`ArgumentError`), dos
/// estados inválidos (`StateError`) e dos erros de arquivo e de plataforma; `null` para os demais.
String? mensagemDoErro(Object erro) => switch (erro) {
  ArgumentError(:final String message) => message,
  StateError(:final message) => message,
  FileSystemException(:final message) => message,
  PlatformException(:final message?) => message,
  _ => null,
};
