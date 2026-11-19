import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

/// Lê de volta um .xlsx gerado, para os testes conferirem o conteúdo.
class LeitorXlsx {
  LeitorXlsx(Uint8List bytes)
    : entradas = {
        for (final arquivo in ZipDecoder().decodeBytes(bytes))
          if (arquivo.isFile) arquivo.name: utf8.decode(arquivo.content),
      };

  /// Caminho no zip → conteúdo em texto.
  final Map<String, String> entradas;

  /// Faz o parse (lança exceção se o XML estiver malformado).
  XmlDocument xml(String caminho) =>
      XmlDocument.parse(entradas[caminho] ?? (throw StateError('Falta $caminho')));

  List<XmlElement> celulas(int numeroAba) =>
      xml('xl/worksheets/sheet$numeroAba.xml').findAllElements('c').toList();

  List<XmlElement> linhas(int numeroAba) =>
      xml('xl/worksheets/sheet$numeroAba.xml').findAllElements('row').toList();

  /// Referência ("A1") → valor exibido: o texto, para `inlineStr`, ou o número em `<v>`.
  Map<String, String> valores(int numeroAba) => {
    for (final celula in celulas(numeroAba))
      celula.getAttribute('r')!: celula.findAllElements('t').isNotEmpty
          ? celula.findAllElements('t').first.innerText
          : celula.findAllElements('v').first.innerText,
  };

  XmlElement celula(int numeroAba, String referencia) =>
      celulas(numeroAba).singleWhere((celula) => celula.getAttribute('r') == referencia);
}
