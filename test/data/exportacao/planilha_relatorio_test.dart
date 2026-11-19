import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/exportacao/gerador_planilha_xlsx.dart';
import 'package:provafacil/data/exportacao/planilha_relatorio.dart';
import 'package:provafacil/domain/estatisticas/estatisticas_prova.dart';

import 'leitor_xlsx.dart';

ResultadoExportacao resultado(String nome, String? matricula, int acertos, double nota) =>
    ResultadoExportacao(
      nome: nome,
      matricula: matricula,
      turma: 'Turma A',
      acertos: acertos,
      erros: 3 - acertos,
      emBranco: 0,
      nota: nota,
    );

EstatisticaQuestao questao(
  int numero,
  double? percentual,
  Map<String, int> distribuicao, {
  bool diverge = false,
}) => EstatisticaQuestao(
  questaoId: numero,
  numero: numero,
  totalRespostas: distribuicao.values.fold(0, (soma, quantidade) => soma + quantidade),
  acertos: distribuicao['A'] ?? 0,
  percentualAcerto: percentual,
  letraDoGabarito: percentual == null ? null : 'A',
  distribuicao: distribuicao,
  emBranco: 0,
  marcacaoMultipla: percentual == null ? 0 : 1,
  alternativaMaisMarcada: diverge ? 'B' : null,
  divergeDoGabarito: diverge,
  gabaritoAlterado: false,
);

void main() {
  final dados = DadosRelatorioExportacao(
    tituloProva: 'Prova 1 & Revisão',
    disciplina: 'Matemática',
    turmas: 'Turma A',
    resultados: [
      resultado('caio Dias', '2023003', 1, 3.33),
      resultado('Ana Souza', null, 3, 10.0),
      resultado('Bruno Lima', '2023002', 0, 0.0),
    ],
    estatisticas: [
      questao(1, 2 / 3, {'A': 2, 'B': 1, 'C': 0}, diverge: true),
      questao(2, null, {'A': 0, 'B': 0, 'C': 0}),
    ],
  );

  LeitorXlsx exportar(DadosRelatorioExportacao dados) {
    final xlsx = LeitorXlsx(
      GeradorPlanilhaXlsx.escrever(PlanilhaRelatorio.montar(dados, '28/10/2026')),
    );
    for (final caminho in xlsx.entradas.keys) {
      xlsx.xml(caminho);
    }
    return xlsx;
  }

  test('abaNotasComCabecalhoAlunosEmOrdemEResumo', () {
    final notas = exportar(dados).valores(1);
    expect(notas['A1'], 'Prova 1 & Revisão');
    expect(notas['B2'], 'Matemática');
    expect(notas['B3'], 'Turma A');
    expect(notas['B4'], '28/10/2026');
    expect(
      ['A6', 'B6', 'C6', 'D6', 'E6', 'F6', 'G6'].map((c) => notas[c]),
      ['Aluno', 'Matrícula', 'Turma', 'Acertos', 'Erros', 'Em branco', 'Nota'],
    );

    expect(['A7', 'A8', 'A9'].map((c) => notas[c]), ['Ana Souza', 'Bruno Lima', 'caio Dias']);
    expect(['D7', 'D8', 'D9'].map((c) => notas[c]), ['3', '0', '1']);
    expect(['E7', 'E8', 'E9'].map((c) => notas[c]), ['0', '3', '2']);
    expect(notas['G9'], '3.33');

    expect(notas['A11'], 'Média');
    expect(double.parse(notas['G11']!), closeTo(13.33 / 3, 1e-9));
    expect(notas['G12'], '10');
    expect(notas['G13'], '0');
  });

  test('alunoSemMatricula', () {
    expect(exportar(dados).valores(1)['B7'], PlanilhaRelatorio.semMatricula);
  });

  test('notaSaiComoNumeroDeUmaCasa', () {
    final nota = exportar(dados).celula(1, 'G7');
    expect(nota.getAttribute('t'), isNull);
    expect(nota.getAttribute('s'), EstiloCelula.nota.indice.toString());
  });

  test('provaSemResultados', () {
    final xlsx = exportar(dados.copyWith(resultados: [], estatisticas: []));
    final notas = xlsx.valores(1);
    expect(notas['A6'], PlanilhaRelatorio.semResultados);
    expect(notas.containsValue('Aluno'), isFalse);
    expect(notas.containsValue('Média'), isFalse);
    expect(xlsx.valores(2)['A3'], 'Questão');
  });

  test('abaEstatisticas', () {
    final xlsx = exportar(dados);
    final estatisticas = xlsx.valores(2);
    expect(
      ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'].map((c) => estatisticas['${c}3']),
      [
        'Questão',
        'Gabarito',
        '% de acerto',
        'A',
        'B',
        'C',
        'Em branco',
        'Marcação múltipla',
        'Mais marcada',
        'Divergente',
      ],
    );
    expect(estatisticas['A4'], '1');
    expect(estatisticas['B4'], 'A');
    expect(xlsx.celula(2, 'C4').getAttribute('s'), EstiloCelula.percentual.indice.toString());
    expect(estatisticas['C4'], (2.0 / 3).toString()); // sem resíduo de float
    expect(['D4', 'E4', 'F4'].map((c) => estatisticas[c]), ['2', '1', '0']);
    expect(estatisticas['H4'], '1');
    expect(estatisticas['I4'], 'B');
    expect(estatisticas['J4'], 'Sim');
  });

  test('questaoSemRespostas', () {
    final estatisticas = exportar(dados).valores(2);
    expect(estatisticas['A5'], '2');
    expect(estatisticas['C5'], PlanilhaRelatorio.semRespostas);
    expect(['B5', 'D5', 'J5'].every((c) => !estatisticas.containsKey(c)), isTrue);
  });

  group('constantes, abas e larguras', () {
    test('nomes das abas e textos fixos', () {
      expect(PlanilhaRelatorio.abaNotas, 'Notas');
      expect(PlanilhaRelatorio.abaEstatisticas, 'Estatísticas');
      expect(PlanilhaRelatorio.semMatricula, 'Sem matrícula');
      expect(PlanilhaRelatorio.semRespostas, 'Sem respostas');
      expect(PlanilhaRelatorio.semResultados, 'Nenhum resultado salvo para esta prova.');
    });

    test('monta as abas Notas e Estatísticas, nessa ordem', () {
      final abas = PlanilhaRelatorio.montar(dados, '28/10/2026');
      expect(abas.map((aba) => aba.nome), ['Notas', 'Estatísticas']);
    });

    test('larguras: Notas fixas; Estatísticas com 6 por letra', () {
      final abas = PlanilhaRelatorio.montar(dados, '28/10/2026');
      expect(abas[0].largurasColunas, [32, 16, 12, 9, 9, 10, 8]);
      expect(abas[1].largurasColunas, [9, 10, 12, 6, 6, 6, 10, 18, 13, 11]);
    });

    test('Média, Maior nota e Menor nota têm 5 células vazias antes do valor', () {
      final xlsx = exportar(dados);
      final notas = xlsx.valores(1);
      expect(['A11', 'A12', 'A13'].map((c) => notas[c]), ['Média', 'Maior nota', 'Menor nota']);
      for (final linha in [11, 12, 13]) {
        expect(['B', 'C', 'D', 'E', 'F'].every((c) => !notas.containsKey('$c$linha')), isTrue);
      }
      expect(xlsx.celula(1, 'G11').getAttribute('s'), EstiloCelula.media.indice.toString());
      expect(xlsx.celula(1, 'G12').getAttribute('s'), EstiloCelula.nota.indice.toString());
      expect(xlsx.celula(1, 'G13').getAttribute('s'), EstiloCelula.nota.indice.toString());
    });

    test('cabeçalhos e título saem em negrito', () {
      final xlsx = exportar(dados);
      final negrito = EstiloCelula.negrito.indice.toString();
      for (final ref in ['A1', 'A2', 'A3', 'A4', 'A6', 'G6', 'A11']) {
        expect(xlsx.celula(1, ref).getAttribute('s'), negrito, reason: ref);
      }
      expect(xlsx.celula(2, 'A1').getAttribute('s'), negrito);
      expect(xlsx.celula(2, 'A3').getAttribute('s'), negrito);
    });

    test('a lista recebida não é reordenada', () {
      final antes = dados.resultados.map((r) => r.nome).toList();
      PlanilhaRelatorio.montar(dados, '28/10/2026');
      expect(dados.resultados.map((r) => r.nome), antes);
    });
  });
}
