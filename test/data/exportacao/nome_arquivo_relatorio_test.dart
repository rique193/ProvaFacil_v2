import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/exportacao/nome_arquivo_relatorio.dart';

void main() {
  final dia28 = DateTime.utc(2026, 10, 28, 15, 30).millisecondsSinceEpoch;

  String nome(String titulo) => nomeArquivoRelatorio(titulo, dia28, utc: true);

  test('removeAcentosECaracteresInvalidos', () {
    expect(nome('Cálculo I: Prova 2/B'), 'Calculo_I_Prova_2_B_28-10-2026.xlsx');
    expect(
      nome('Avaliação de Português — Ñandú'),
      'Avaliacao_de_Portugues_Nandu_28-10-2026.xlsx',
    );
    expect(nome('  Prova   <1>?  '), 'Prova_1_28-10-2026.xlsx');
  });

  test('tituloSemNadaAproveitavelViraRelatorio', () {
    expect(nome(''), 'relatorio_28-10-2026.xlsx');
    expect(nome('???///'), 'relatorio_28-10-2026.xlsx');
  });

  test('tituloLongoECortado', () {
    expect(nome('A' * 100), '${'A' * 60}_28-10-2026.xlsx');
  });

  test('usaADataNoFusoInformado', () {
    // O Kotlin comparava UTC com America/Sao_Paulo; aqui o fuso é UTC (utc: true) ou o do aparelho.
    final madrugadaUtc = DateTime.utc(2026, 10, 28, 1).millisecondsSinceEpoch;
    expect(nomeArquivoRelatorio('Prova', madrugadaUtc, utc: true), 'Prova_28-10-2026.xlsx');

    final local = DateTime.fromMillisecondsSinceEpoch(madrugadaUtc);
    final dia = local.day.toString().padLeft(2, '0');
    final mes = local.month.toString().padLeft(2, '0');
    expect(nomeArquivoRelatorio('Prova', madrugadaUtc), 'Prova_$dia-$mes-${local.year}.xlsx');
  });

  test('nomeSoTemCaracteresSeguros', () {
    expect(
      RegExp(r'^[A-Za-z0-9_-]+\.xlsx$').hasMatch(nome('Prova #3 (2º bimestre) * "final"')),
      isTrue,
    );
  });

  group('casos extras', () {
    test('o corte em 60 não deixa _ nem - sobrando no fim', () {
      expect(nome('${'A' * 59} B'), '${'A' * 59}_28-10-2026.xlsx');
      expect(nome('${'A' * 59}-B'), '${'A' * 59}_28-10-2026.xlsx');
    });

    test('junta separadores repetidos e limpa as bordas', () {
      expect(nome('--Prova__1--'), 'Prova_1_28-10-2026.xlsx');
      expect(nome('Prova - 1'), 'Prova_-_1_28-10-2026.xlsx');
    });

    test('o hífen no meio do título é mantido', () {
      expect(nome('Pré-teste'), 'Pre-teste_28-10-2026.xlsx');
    });

    test('dia e mês com dois dígitos', () {
      final primeiro = DateTime.utc(2026, 1, 5, 12).millisecondsSinceEpoch;
      expect(nomeArquivoRelatorio('Prova', primeiro, utc: true), 'Prova_05-01-2026.xlsx');
    });
  });
}
