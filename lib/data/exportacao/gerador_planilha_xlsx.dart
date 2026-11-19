import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';

/// Formatos de célula disponíveis (cada um é um `xf` do styles.xml, na mesma ordem).
enum EstiloCelula {
  padrao(0),
  negrito(1),

  /// Número com 1 casa decimal (nota).
  nota(2),

  /// Número com 2 casas decimais (média).
  media(3),

  /// Fração de 0 a 1 exibida como porcentagem inteira (0,667 → 67%).
  percentual(4);

  const EstiloCelula(this.indice);

  final int indice;
}

sealed class Celula {
  const Celula();
}

final class Texto extends Celula {
  const Texto(this.valor, [this.estilo = EstiloCelula.padrao]);

  final String valor;
  final EstiloCelula estilo;
}

/// Gravado como número de verdade, para o Excel somar e ordenar.
final class Numero extends Celula {
  const Numero(this.valor, [this.estilo = EstiloCelula.padrao]);

  final double valor;
  final EstiloCelula estilo;
}

final class Vazia extends Celula {
  const Vazia();
}

/// Uma aba da planilha. [largurasColunas] em "caracteres", como o Excel mede.
class Aba {
  const Aba(this.nome, this.linhas, [this.largurasColunas = const []]);

  final String nome;
  final List<List<Celula>> linhas;
  final List<double> largurasColunas;
}

/// Gera um arquivo .xlsx (Office Open XML) com um zip dos XMLs mínimos do formato.
/// Textos vão como `inlineStr` (dispensa o sharedStrings.xml) e toda linha e célula leva a
/// referência `r` ("1", "A1"...), para o Excel abrir sem pedir reparo.
abstract final class GeradorPlanilhaXlsx {
  static const _nsMain = 'http://schemas.openxmlformats.org/spreadsheetml/2006/main';
  static const _nsRel = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships';
  static const _nsPkgRel = 'http://schemas.openxmlformats.org/package/2006/relationships';
  static const _cabecalhoXml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n';
  static final _caracteresProibidosNoNome = RegExp(r'[\[\]:*?/\\]');

  /// Devolve os bytes do arquivo com as [abas].
  static Uint8List escrever(List<Aba> abas) {
    if (abas.isEmpty) throw ArgumentError('A planilha precisa de pelo menos uma aba.');
    for (final aba in abas) {
      if (aba.nome.isEmpty ||
          aba.nome.length > 31 ||
          _caracteresProibidosNoNome.hasMatch(aba.nome)) {
        throw ArgumentError('Nome de aba inválido: ${aba.nome}');
      }
    }
    if (abas.map((aba) => aba.nome.toLowerCase()).toSet().length != abas.length) {
      throw ArgumentError('Nomes de aba repetidos.');
    }

    final zip = Archive()
      ..addFile(ArchiveFile.string('[Content_Types].xml', _tiposDeConteudo(abas.length)))
      ..addFile(ArchiveFile.string('_rels/.rels', _relacoesDoPacote()))
      ..addFile(ArchiveFile.string('xl/workbook.xml', _workbook(abas)))
      ..addFile(ArchiveFile.string('xl/_rels/workbook.xml.rels', _relacoesDoWorkbook(abas.length)))
      ..addFile(ArchiveFile.string('xl/styles.xml', _estilos()));
    for (final (indice, aba) in abas.indexed) {
      zip.addFile(ArchiveFile.string('xl/worksheets/sheet${indice + 1}.xml', _planilha(aba)));
    }
    return ZipEncoder().encodeBytes(zip);
  }

  /// Letra(s) da coluna a partir do índice 0: 0 → "A", 25 → "Z", 26 → "AA".
  static String referenciaColuna(int indice) {
    if (indice < 0) throw ArgumentError('Failed requirement.');
    final letras = StringBuffer();
    var resto = indice + 1;
    while (resto > 0) {
      final posicao = (resto - 1) % 26;
      letras.write(String.fromCharCode(65 + posicao));
      resto = (resto - 1) ~/ 26;
    }
    return letras.toString().split('').reversed.join();
  }

  /// Escapa o texto para XML e remove caracteres que o XML 1.0 não aceita (controle, exceto
  /// tab e quebras de linha), que deixariam o arquivo corrompido.
  static String escaparXml(String texto) {
    final resultado = StringBuffer();
    for (final codigo in texto.runes) {
      switch (codigo) {
        case 0x26: // &
          resultado.write('&amp;');
        case 0x3C: // <
          resultado.write('&lt;');
        case 0x3E: // >
          resultado.write('&gt;');
        case 0x22: // "
          resultado.write('&quot;');
        case 0x27: // '
          resultado.write('&apos;');
        case 0x9 || 0xA || 0xD:
        case >= 0x20 && <= 0xD7FF:
        case >= 0xE000 && <= 0xFFFD:
        case >= 0x10000 && <= 0x10FFFF:
          resultado.writeCharCode(codigo);
        default:
          break; // caractere proibido no XML 1.0: descartado
      }
    }
    return resultado.toString();
  }

  /// Número com ponto decimal, independente do idioma do aparelho ("7.5", nunca "7,5").
  @visibleForTesting
  static String numeroXml(double valor) =>
      valor == valor.floorToDouble() && valor.abs() < 1e15 ? valor.toInt().toString() : valor.toString();

  static String _tiposDeConteudo(int quantidadeAbas) {
    final xml = StringBuffer(_cabecalhoXml)
      ..write('<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">')
      ..write(
        '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>',
      )
      ..write('<Default Extension="xml" ContentType="application/xml"/>')
      ..write(
        '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>',
      )
      ..write(
        '<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>',
      );
    for (var n = 1; n <= quantidadeAbas; n++) {
      xml.write(
        '<Override PartName="/xl/worksheets/sheet$n.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>',
      );
    }
    return (xml..write('</Types>')).toString();
  }

  static String _relacoesDoPacote() =>
      '$_cabecalhoXml'
      '<Relationships xmlns="$_nsPkgRel">'
      '<Relationship Id="rId1" Type="$_nsRel/officeDocument" Target="xl/workbook.xml"/>'
      '</Relationships>';

  static String _workbook(List<Aba> abas) {
    final xml = StringBuffer(_cabecalhoXml)
      ..write('<workbook xmlns="$_nsMain" xmlns:r="$_nsRel"><sheets>');
    for (final (indice, aba) in abas.indexed) {
      final n = indice + 1;
      xml.write('<sheet name="${escaparXml(aba.nome)}" sheetId="$n" r:id="rId$n"/>');
    }
    return (xml..write('</sheets></workbook>')).toString();
  }

  static String _relacoesDoWorkbook(int quantidadeAbas) {
    final xml = StringBuffer(_cabecalhoXml)..write('<Relationships xmlns="$_nsPkgRel">');
    for (var n = 1; n <= quantidadeAbas; n++) {
      xml.write('<Relationship Id="rId$n" Type="$_nsRel/worksheet" Target="worksheets/sheet$n.xml"/>');
    }
    xml
      ..write(
        '<Relationship Id="rId${quantidadeAbas + 1}" Type="$_nsRel/styles" Target="styles.xml"/>',
      )
      ..write('</Relationships>');
    return xml.toString();
  }

  /// Os `xf` de `cellXfs` seguem a ordem de [EstiloCelula].
  static String _estilos() =>
      '$_cabecalhoXml'
      '<styleSheet xmlns="$_nsMain">'
      '<numFmts count="2">'
      '<numFmt numFmtId="164" formatCode="0.0"/>'
      '<numFmt numFmtId="165" formatCode="0.00"/>'
      '</numFmts>'
      '<fonts count="2">'
      '<font><sz val="11"/><name val="Calibri"/></font>'
      '<font><b/><sz val="11"/><name val="Calibri"/></font>'
      '</fonts>'
      '<fills count="2"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill></fills>'
      '<borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders>'
      '<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>'
      '<cellXfs count="5">'
      '<xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>'
      '<xf numFmtId="0" fontId="1" fillId="0" borderId="0" xfId="0" applyFont="1"/>'
      '<xf numFmtId="164" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>'
      '<xf numFmtId="165" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>'
      '<xf numFmtId="9" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>'
      '</cellXfs>'
      '<cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>'
      '</styleSheet>';

  static String _planilha(Aba aba) {
    final xml = StringBuffer(_cabecalhoXml)..write('<worksheet xmlns="$_nsMain">');
    if (aba.largurasColunas.isNotEmpty) {
      xml.write('<cols>');
      for (final (indice, largura) in aba.largurasColunas.indexed) {
        final n = indice + 1;
        xml.write('<col min="$n" max="$n" width="${numeroXml(largura)}" customWidth="1"/>');
      }
      xml.write('</cols>');
    }
    xml.write('<sheetData>');
    for (final (indiceLinha, celulas) in aba.linhas.indexed) {
      final linha = indiceLinha + 1;
      xml.write('<row r="$linha">');
      for (final (indiceColuna, celula) in celulas.indexed) {
        final referencia = '${referenciaColuna(indiceColuna)}$linha';
        switch (celula) {
          case Texto():
            xml.write(
              '<c r="$referencia" t="inlineStr"${_atributoEstilo(celula.estilo)}>'
              '<is><t xml:space="preserve">${escaparXml(celula.valor)}</t></is></c>',
            );
          case Numero():
            if (celula.valor.isFinite) {
              xml.write(
                '<c r="$referencia"${_atributoEstilo(celula.estilo)}><v>${numeroXml(celula.valor)}</v></c>',
              );
            }
          case Vazia():
            break;
        }
      }
      xml.write('</row>');
    }
    return (xml..write('</sheetData></worksheet>')).toString();
  }

  static String _atributoEstilo(EstiloCelula estilo) =>
      estilo == EstiloCelula.padrao ? '' : ' s="${estilo.indice}"';
}
