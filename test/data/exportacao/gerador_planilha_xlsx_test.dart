import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/exportacao/gerador_planilha_xlsx.dart';
import 'package:xml/xml.dart';

import 'leitor_xlsx.dart';

void main() {
  LeitorXlsx gerar(List<Aba> abas) => LeitorXlsx(GeradorPlanilhaXlsx.escrever(abas));

  const abaSimples = Aba('Notas', [
    [Texto('Aluno'), Numero(7.5, EstiloCelula.nota)],
  ]);

  group('casos do GeradorPlanilhaXlsxTest.kt', () {
    test('zipTemTodasAsEntradasObrigatorias', () {
      final xlsx = gerar([abaSimples, const Aba('Estatísticas', [])]);
      expect(xlsx.entradas.keys.toSet(), {
        '[Content_Types].xml',
        '_rels/.rels',
        'xl/workbook.xml',
        'xl/_rels/workbook.xml.rels',
        'xl/styles.xml',
        'xl/worksheets/sheet1.xml',
        'xl/worksheets/sheet2.xml',
      });
      expect(xlsx.entradas['[Content_Types].xml'], contains('/xl/worksheets/sheet2.xml'));
      expect(xlsx.entradas['xl/workbook.xml'], contains('name="Estatísticas"'));
    });

    test('todosOsXmlsSaoBemFormados', () {
      final xlsx = gerar([
        abaSimples,
        const Aba('Outra', [
          [Texto('<&>')],
        ]),
      ]);
      for (final caminho in xlsx.entradas.keys) {
        xlsx.xml(caminho);
      }
    });

    test('numerosSaemComoNumeroComOEstiloCerto', () {
      final xlsx = gerar([
        Aba('Notas', [
          [
            const Numero(7.5, EstiloCelula.nota),
            const Numero(3.0),
            Numero(2.0 / 3, EstiloCelula.percentual),
            const Numero(4.4433, EstiloCelula.media),
          ],
        ]),
      ]);
      final nota = xlsx.celula(1, 'A1');
      expect(nota.getAttribute('t'), isNull);
      expect(nota.getAttribute('s'), '2');
      expect(nota.innerText, '7.5');

      final inteiro = xlsx.celula(1, 'B1');
      expect(inteiro.getAttribute('t'), isNull);
      expect(inteiro.getAttribute('s'), isNull);
      expect(inteiro.innerText, '3');

      expect(xlsx.celula(1, 'C1').getAttribute('s'), '4');
      expect(double.parse(xlsx.celula(1, 'C1').innerText), closeTo(2.0 / 3, 1e-12));
      expect(xlsx.celula(1, 'D1').getAttribute('s'), '3');

      final estilos = xlsx.entradas['xl/styles.xml']!;
      expect(estilos, contains('formatCode="0.0"'));
      expect(estilos, contains('numFmtId="9"')); // 0%
    });

    test('textoComCaracteresEspeciaisEAcentosVoltaIgual', () {
      const original = 'Ação & <Ñandú> "aspas" \'apóstrofo\' — São João';
      final xlsx = gerar([
        const Aba('Notas', [
          [Texto(original)],
        ]),
      ]);
      final bruto = xlsx.entradas['xl/worksheets/sheet1.xml']!;
      expect(bruto, allOf(contains('&amp;'), contains('&lt;'), contains('&gt;')));
      expect(bruto, allOf(contains('&quot;'), contains('&apos;')));
      expect(bruto, contains('Ação')); // UTF-8, sem virar entidade
      expect(xlsx.celula(1, 'A1').getAttribute('t'), 'inlineStr');
      expect(xlsx.valores(1)['A1'], original);
    });

    test('caracteresDeControleSaoRemovidos', () {
      final xlsx = gerar([
        const Aba('Notas', [
          [Texto('Ana\u0001 Sou\u0008za\tB')],
        ]),
      ]);
      expect(xlsx.valores(1)['A1'], 'Ana Souza\tB');
    });

    test('todaLinhaETodaCelulaTemAReferenciaCerta', () {
      final linhas = <List<Celula>>[
        [const Texto('A'), const Vazia(), const Numero(1.0)],
        [],
        [for (var i = 0; i < 30; i++) Numero(i.toDouble())],
        [const Vazia(), const Texto('B')],
      ];
      final xlsx = gerar([Aba('Notas', linhas)]);

      expect(xlsx.linhas(1).map((linha) => linha.getAttribute('r')), ['1', '2', '3', '4']);
      for (final linha in xlsx.linhas(1)) {
        final numeroDaLinha = linha.getAttribute('r')!;
        for (final celula in linha.findElements('c')) {
          final referencia = celula.getAttribute('r')!;
          expect(
            referencia.endsWith(numeroDaLinha),
            isTrue,
            reason: 'Célula $referencia fora da linha $numeroDaLinha',
          );
        }
      }
      final esperadas = [
        'A1',
        'C1',
        for (var i = 0; i < 30; i++) '${GeradorPlanilhaXlsx.referenciaColuna(i)}3',
        'B4',
      ];
      expect(xlsx.celulas(1).map((celula) => celula.getAttribute('r')), esperadas);
      expect(esperadas[esperadas.length - 2], 'AD3');
    });

    test('referenciaDeColuna', () {
      expect(GeradorPlanilhaXlsx.referenciaColuna(0), 'A');
      expect(GeradorPlanilhaXlsx.referenciaColuna(25), 'Z');
      expect(GeradorPlanilhaXlsx.referenciaColuna(26), 'AA');
      expect(GeradorPlanilhaXlsx.referenciaColuna(51), 'AZ');
      expect(GeradorPlanilhaXlsx.referenciaColuna(701), 'ZZ');
      expect(GeradorPlanilhaXlsx.referenciaColuna(702), 'AAA');
    });

    test('nomeDeAbaInvalidoERecusado', () {
      expect(() => gerar([const Aba('Notas/2026', [])]), throwsArgumentError);
    });
  });

  group('validações e funções auxiliares', () {
    test('exige ao menos uma aba', () {
      expect(
        () => GeradorPlanilhaXlsx.escrever([]),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            'A planilha precisa de pelo menos uma aba.',
          ),
        ),
      );
    });

    test('recusa nome de aba vazio, com mais de 31 caracteres ou com caracteres proibidos', () {
      for (final nome in ['', 'A' * 32, 'a[b', 'a]b', 'a:b', 'a*b', 'a?b', 'a/b', r'a\b']) {
        expect(() => GeradorPlanilhaXlsx.escrever([Aba(nome, const [])]), throwsArgumentError, reason: nome);
      }
      expect(
        () => GeradorPlanilhaXlsx.escrever([Aba('Nome:', const [])]),
        throwsA(
          isA<ArgumentError>().having((e) => e.message, 'message', 'Nome de aba inválido: Nome:'),
        ),
      );
    });

    test('aceita nome de aba de 1 e de 31 caracteres', () {
      gerar([const Aba('A', []), Aba('B' * 31, const [])]);
    });

    test('recusa nomes repetidos ignorando maiúsculas', () {
      expect(
        () => GeradorPlanilhaXlsx.escrever([const Aba('Notas', []), const Aba('NOTAS', [])]),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', 'Nomes de aba repetidos.')),
      );
    });

    test('referenciaColuna recusa índice negativo', () {
      expect(() => GeradorPlanilhaXlsx.referenciaColuna(-1), throwsArgumentError);
    });

    test('escaparXml escapa os cinco caracteres especiais', () {
      expect(GeradorPlanilhaXlsx.escaparXml('&<>"\''), '&amp;&lt;&gt;&quot;&apos;');
    });

    test('escaparXml mantém tab e quebras de linha e descarta o resto do controle', () {
      expect(GeradorPlanilhaXlsx.escaparXml('a\tb\nc\rd'), 'a\tb\nc\rd');
      expect(GeradorPlanilhaXlsx.escaparXml('a\u0000b\u000Bc\u000Cd\u001Fe\u007Ff'), 'abcde\u007Ff');
    });

    test('escaparXml descarta os não-caracteres e mantém pares substitutos (emoji)', () {
      expect(GeradorPlanilhaXlsx.escaparXml('a￾b￿c'), 'abc');
      expect(GeradorPlanilhaXlsx.escaparXml('Oi 😀!'), 'Oi 😀!');
    });

    test('numeroXml: inteiro abaixo de 1e15 sai sem casas, o resto sai com toString', () {
      expect(GeradorPlanilhaXlsx.numeroXml(3.0), '3');
      expect(GeradorPlanilhaXlsx.numeroXml(-3.0), '-3');
      expect(GeradorPlanilhaXlsx.numeroXml(0.0), '0');
      expect(GeradorPlanilhaXlsx.numeroXml(7.5), '7.5');
      expect(GeradorPlanilhaXlsx.numeroXml(2.0 / 3), (2.0 / 3).toString());
      expect(GeradorPlanilhaXlsx.numeroXml(999999999999999.0), '999999999999999');
      expect(GeradorPlanilhaXlsx.numeroXml(1e15), 1e15.toString());
    });

    test('número não finito não gera célula', () {
      final xlsx = gerar([
        const Aba('Notas', [
          [Numero(double.nan), Numero(double.infinity), Numero(1.0)],
        ]),
      ]);
      expect(xlsx.celulas(1).map((c) => c.getAttribute('r')), ['C1']);
    });

    test('larguras de coluna geram <cols> e sem larguras não geram', () {
      final com = gerar([
        const Aba('Notas', [], [32.0, 9.5]),
      ]);
      expect(
        com.entradas['xl/worksheets/sheet1.xml'],
        contains('<cols><col min="1" max="1" width="32" customWidth="1"/>'
            '<col min="2" max="2" width="9.5" customWidth="1"/></cols>'),
      );
      expect(gerar([abaSimples]).entradas['xl/worksheets/sheet1.xml'], isNot(contains('<cols>')));
    });
  });

  group('os XMLs são idênticos aos do Kotlin, caractere por caractere', () {
    const cabecalho = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n';
    const nsMain = 'http://schemas.openxmlformats.org/spreadsheetml/2006/main';
    const nsRel = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships';
    const nsPkgRel = 'http://schemas.openxmlformats.org/package/2006/relationships';

    final xlsx = gerar([
      const Aba('Notas', [
        [Texto('Aluno', EstiloCelula.negrito), Numero(7.5, EstiloCelula.nota), Vazia(), Numero(3.0)],
        [],
      ], [32.0, 16.0]),
      const Aba('Estatísticas & Co', []),
    ]);

    test('[Content_Types].xml', () {
      expect(
        xlsx.entradas['[Content_Types].xml'],
        '$cabecalho'
        '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
        '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
        '<Default Extension="xml" ContentType="application/xml"/>'
        '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>'
        '<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>'
        '<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
        '<Override PartName="/xl/worksheets/sheet2.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
        '</Types>',
      );
    });

    test('_rels/.rels', () {
      expect(
        xlsx.entradas['_rels/.rels'],
        '$cabecalho'
        '<Relationships xmlns="$nsPkgRel">'
        '<Relationship Id="rId1" Type="$nsRel/officeDocument" Target="xl/workbook.xml"/>'
        '</Relationships>',
      );
    });

    test('xl/workbook.xml', () {
      expect(
        xlsx.entradas['xl/workbook.xml'],
        '$cabecalho'
        '<workbook xmlns="$nsMain" xmlns:r="$nsRel"><sheets>'
        '<sheet name="Notas" sheetId="1" r:id="rId1"/>'
        '<sheet name="Estatísticas &amp; Co" sheetId="2" r:id="rId2"/>'
        '</sheets></workbook>',
      );
    });

    test('xl/_rels/workbook.xml.rels', () {
      expect(
        xlsx.entradas['xl/_rels/workbook.xml.rels'],
        '$cabecalho'
        '<Relationships xmlns="$nsPkgRel">'
        '<Relationship Id="rId1" Type="$nsRel/worksheet" Target="worksheets/sheet1.xml"/>'
        '<Relationship Id="rId2" Type="$nsRel/worksheet" Target="worksheets/sheet2.xml"/>'
        '<Relationship Id="rId3" Type="$nsRel/styles" Target="styles.xml"/>'
        '</Relationships>',
      );
    });

    test('xl/styles.xml', () {
      expect(
        xlsx.entradas['xl/styles.xml'],
        '$cabecalho'
        '<styleSheet xmlns="$nsMain">'
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
        '</styleSheet>',
      );
    });

    test('xl/worksheets/sheetN.xml', () {
      expect(
        xlsx.entradas['xl/worksheets/sheet1.xml'],
        '$cabecalho'
        '<worksheet xmlns="$nsMain">'
        '<cols><col min="1" max="1" width="32" customWidth="1"/><col min="2" max="2" width="16" customWidth="1"/></cols>'
        '<sheetData>'
        '<row r="1">'
        '<c r="A1" t="inlineStr" s="1"><is><t xml:space="preserve">Aluno</t></is></c>'
        '<c r="B1" s="2"><v>7.5</v></c>'
        '<c r="D1"><v>3</v></c>'
        '</row>'
        '<row r="2"></row>'
        '</sheetData></worksheet>',
      );
      expect(
        xlsx.entradas['xl/worksheets/sheet2.xml'],
        '$cabecalho<worksheet xmlns="$nsMain"><sheetData></sheetData></worksheet>',
      );
    });
  });
}
