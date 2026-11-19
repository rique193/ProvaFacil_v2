import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/util/mensagem_erro.dart';

void main() {
  test('devolve a mensagem das validações e dos estados inválidos', () {
    expect(mensagemDoErro(ArgumentError('Informe o título da prova.')), 'Informe o título da prova.');
    expect(mensagemDoErro(StateError('Prova não encontrada.')), 'Prova não encontrada.');
  });

  test('devolve a mensagem dos erros de arquivo e de plataforma', () {
    expect(mensagemDoErro(const FileSystemException('Sem permissão', '/x')), 'Sem permissão');
    expect(mensagemDoErro(PlatformException(code: 'erro', message: 'Cancelado')), 'Cancelado');
  });

  test('devolve null quando não há mensagem', () {
    expect(mensagemDoErro(const FormatException()), isNull);
    expect(mensagemDoErro(PlatformException(code: 'erro')), isNull);
  });
}
