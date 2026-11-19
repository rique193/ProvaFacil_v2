import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/exportacao/exportador_relatorio.dart';
import 'package:provafacil/data/exportacao/planilha_relatorio.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/aluno_repository.dart';
import 'package:provafacil/data/repository/resultado_repository.dart';

import '../../ajudantes/banco_em_memoria.dart';
import '../../ajudantes/correcao_simulada.dart';
import 'leitor_xlsx.dart';

/// Corrige alunos pelo fluxo real (`ResultadoRepository.corrigirESalvar`), exporta e confere o
/// conteúdo do .xlsx.
void main() {
  late AppDatabase db;

  setUp(() => db = criarBancoEmMemoria());
  tearDown(() => db.close());

  /// Prova de 2 questões (A a E) com gabarito A, B.
  Future<int> criarProva(String titulo) =>
      criarProvaComGabarito(db, gabarito: ['A', 'B'], titulo: titulo);

  Future<LeitorXlsx> exportar(int provaId, {int? exportadoEm}) async {
    final bytes = await ExportadorRelatorio(db).exportar(provaId, exportadoEm: exportadoEm);
    final xlsx = LeitorXlsx(bytes);
    for (final caminho in xlsx.entradas.keys) {
      xlsx.xml(caminho);
    }
    return xlsx;
  }

  test('exportaNotasEEstatisticasDosResultadosGravados', () async {
    await AlunoRepository(db).cadastrarAluno(nome: 'Bruno Lima', turma: 'A', matricula: '2023002');
    final provaId = await criarProva('Prova & Revisão <1>');
    final resultados = ResultadoRepository(db);
    await resultados.corrigirESalvar(
      provaId: provaId,
      nomeAluno: 'Caio Dias',
      turma: 'Turma B',
      respostasLidas: {
        1: {'B'},
        2: {'B', 'D'},
      },
    );
    await resultados.corrigirESalvar(
      provaId: provaId,
      nomeAluno: 'Ana Souza',
      turma: 'Turma A',
      respostasLidas: {
        1: {'A'},
        2: {'B'},
      },
    );
    await resultados.corrigirESalvar(
      provaId: provaId,
      nomeAluno: 'Bruno Lima',
      turma: 'Turma A',
      respostasLidas: {
        1: {'B'},
      },
    );

    final xlsx = await exportar(provaId);
    final notas = xlsx.valores(1);
    expect(notas['A1'], 'Prova & Revisão <1>');
    expect(notas['B2'], 'Matemática');
    expect(notas['B3'], 'Turma A, Turma B');

    // Ordem alfabética; Ana e Caio foram criados pela correção (sem matrícula).
    expect(['A7', 'A8', 'A9'].map((c) => notas[c]), ['Ana Souza', 'Bruno Lima', 'Caio Dias']);
    expect(['B7', 'B8', 'B9'].map((c) => notas[c]), ['Sem matrícula', '2023002', 'Sem matrícula']);
    expect(['C7', 'C8', 'C9'].map((c) => notas[c]), ['Turma A', 'Turma A', 'Turma B']);
    expect(['D7', 'D8', 'D9'].map((c) => notas[c]), ['2', '0', '0']); // acertos
    expect(['E7', 'E8', 'E9'].map((c) => notas[c]), ['0', '1', '2']); // erros (múltipla conta como erro)
    expect(['F7', 'F8', 'F9'].map((c) => notas[c]), ['0', '1', '0']); // em branco
    expect(['G7', 'G8', 'G9'].map((c) => notas[c]), ['10', '0', '0']);
    expect(xlsx.celula(1, 'G7').getAttribute('t'), isNull);

    expect(notas['A11'], 'Média');
    expect(double.parse(notas['G11']!), closeTo(10.0 / 3, 0.01));
    expect(notas['G12'], '10');
    expect(notas['G13'], '0');

    final estatisticas = xlsx.valores(2);
    // Questão 1: Ana A (acerto), Caio B, Bruno B → mais marcada B, divergente.
    expect(estatisticas['B4'], 'A');
    expect(estatisticas['C4'], (1.0 / 3).toString());
    expect(['D4', 'E4', 'F4', 'G4', 'H4'].map((c) => estatisticas[c]), ['1', '2', '0', '0', '0']);
    expect(estatisticas['K4'], 'B');
    expect(estatisticas['L4'], 'Sim');
    // Questão 2: Ana B (acerto), Caio BD (múltipla, fora das letras), Bruno em branco.
    expect(['D5', 'E5', 'F5', 'G5', 'H5'].map((c) => estatisticas[c]), ['0', '1', '0', '0', '0']);
    expect(['I5', 'J5'].map((c) => estatisticas[c]), ['1', '1']);
    expect(estatisticas['L5'], 'Não');
  });

  test('provaSemResultadosGeraArquivoValido', () async {
    final xlsx = await exportar(await criarProva('Prova vazia'));

    expect(xlsx.valores(1)['A6'], PlanilhaRelatorio.semResultados);
  });

  group('casos extras', () {
    test('a data de exportação sai como dd/MM/yyyy', () async {
      final provaId = await criarProva('Prova');
      final xlsx = await exportar(
        provaId,
        exportadoEm: DateTime(2026, 10, 28, 15, 30).millisecondsSinceEpoch,
      );

      expect(xlsx.valores(1)['B4'], '28/10/2026');
    });

    test('sem exportadoEm usa a data de hoje', () async {
      final xlsx = await exportar(await criarProva('Prova'));
      final hoje = DateTime.now();
      final esperada =
          '${hoje.day.toString().padLeft(2, '0')}/${hoje.month.toString().padLeft(2, '0')}/${hoje.year}';

      expect(xlsx.valores(1)['B4'], esperada);
    });

    test('prova que não existe gera arquivo com título e disciplina vazios', () async {
      final xlsx = await exportar(999);

      final notas = xlsx.valores(1);
      expect(notas['A1'], '');
      expect(notas['B2'], '');
      expect(notas['A6'], PlanilhaRelatorio.semResultados);
    });

    test('só exporta os resultados da prova pedida', () async {
      final primeira = await criarProva('Primeira');
      final segunda = await criarProva('Segunda');
      final resultados = ResultadoRepository(db);
      await resultados.corrigirESalvar(
        provaId: primeira,
        nomeAluno: 'Ana',
        turma: 'Turma A',
        respostasLidas: {1: {'A'}, 2: {'B'}},
      );
      await resultados.corrigirESalvar(
        provaId: segunda,
        nomeAluno: 'Bia',
        turma: 'Turma A',
        respostasLidas: {1: {'A'}, 2: {'B'}},
      );

      final notas = (await exportar(primeira)).valores(1);

      expect(notas['A1'], 'Primeira');
      expect(notas['A7'], 'Ana');
      expect(notas.containsKey('A8'), isFalse);
    });

    test('os bytes são um .xlsx (zip) com o workbook e a aba Notas', () async {
      final bytes = await ExportadorRelatorio(db).exportar(await criarProva('Prova'));

      expect(bytes.sublist(0, 2), [0x50, 0x4B]); // "PK"
      expect(LeitorXlsx(bytes).entradas.keys, contains('xl/workbook.xml'));
      expect(LeitorXlsx(bytes).valores(1), isNotEmpty);
    });
  });
}
