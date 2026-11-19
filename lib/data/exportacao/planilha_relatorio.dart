import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/estatisticas/estatisticas_prova.dart';
import '../../domain/historico/resumo_notas.dart';
import '../../util/comparacao.dart';
import 'gerador_planilha_xlsx.dart';

part 'planilha_relatorio.freezed.dart';

/// Resultado de um aluno como foi gravado na correção, para a aba "Notas".
@freezed
abstract class ResultadoExportacao with _$ResultadoExportacao {
  const factory ResultadoExportacao({
    required String nome,
    required String? matricula,
    required String turma,
    required int acertos,
    required int erros,
    required int emBranco,
    required double nota,
  }) = _ResultadoExportacao;
}

/// Tudo o que vai para o arquivo exportado de uma prova.
@freezed
abstract class DadosRelatorioExportacao with _$DadosRelatorioExportacao {
  const factory DadosRelatorioExportacao({
    required String tituloProva,
    required String disciplina,

    /// Turmas já formatadas ("Turma A, Turma B"); vazio se não houver.
    required String turmas,
    required List<ResultadoExportacao> resultados,
    required List<EstatisticaQuestao> estatisticas,
  }) = _DadosRelatorioExportacao;
}

/// Monta as abas "Notas" e "Estatísticas" do relatório exportado, a partir de dados já carregados.
abstract final class PlanilhaRelatorio {
  static const abaNotas = 'Notas';
  static const abaEstatisticas = 'Estatísticas';
  static const semMatricula = 'Sem matrícula';
  static const semRespostas = 'Sem respostas';
  static const semResultados = 'Nenhum resultado salvo para esta prova.';

  /// [dataExportacao] é a data já formatada para exibição, ex.: "28/10/2026".
  static List<Aba> montar(DadosRelatorioExportacao dados, String dataExportacao) => [
    _abaNotas(dados, dataExportacao),
    _abaEstatisticas(dados),
  ];

  static Texto _texto(String valor) => Texto(valor);
  static Texto _negrito(String valor) => Texto(valor, EstiloCelula.negrito);
  static Numero _numero(int valor) => Numero(valor.toDouble());

  static Aba _abaNotas(DadosRelatorioExportacao dados, String dataExportacao) {
    final linhas = <List<Celula>>[
      [_negrito(dados.tituloProva)],
      [_negrito('Disciplina'), _texto(dados.disciplina)],
      [_negrito('Turmas'), _texto(dados.turmas)],
      [_negrito('Exportado em'), _texto(dataExportacao)],
      [],
    ];

    if (dados.resultados.isEmpty) {
      linhas.add([_texto(semResultados)]);
    } else {
      linhas.add([
        for (final titulo in ['Aluno', 'Matrícula', 'Turma', 'Acertos', 'Erros', 'Em branco', 'Nota'])
          _negrito(titulo),
      ]);
      final ordenados = [...dados.resultados];
      mergeSort(ordenados, compare: (a, b) => compararSemCaixa(a.nome, b.nome));
      for (final resultado in ordenados) {
        linhas.add([
          _texto(resultado.nome),
          _texto(resultado.matricula ?? semMatricula),
          _texto(resultado.turma),
          _numero(resultado.acertos),
          _numero(resultado.erros),
          _numero(resultado.emBranco),
          Numero(resultado.nota, EstiloCelula.nota),
        ]);
      }

      final resumo = ResumoNotas.de([for (final resultado in dados.resultados) resultado.nota]);
      const vazias = [Vazia(), Vazia(), Vazia(), Vazia(), Vazia()];
      linhas
        ..add([])
        ..add([_negrito('Média'), ...vazias, Numero(resumo.media, EstiloCelula.media)])
        ..add([_negrito('Maior nota'), ...vazias, Numero(resumo.maiorNota, EstiloCelula.nota)])
        ..add([_negrito('Menor nota'), ...vazias, Numero(resumo.menorNota, EstiloCelula.nota)]);
    }

    return Aba(abaNotas, linhas, const [32.0, 16.0, 12.0, 9.0, 9.0, 10.0, 8.0]);
  }

  static Aba _abaEstatisticas(DadosRelatorioExportacao dados) {
    final letras = {
      for (final questao in dados.estatisticas) ...questao.distribuicao.keys,
    }.toList()..sort();
    final linhas = <List<Celula>>[
      [_negrito(dados.tituloProva)],
      [],
      [
        for (final titulo in [
          'Questão',
          'Gabarito',
          '% de acerto',
          ...letras,
          'Em branco',
          'Marcação múltipla',
          'Mais marcada',
          'Divergente',
        ])
          _negrito(titulo),
      ],
    ];

    for (final questao in dados.estatisticas) {
      if (questao.totalRespostas == 0) {
        linhas.add([_numero(questao.numero), const Vazia(), _texto(semRespostas)]);
      } else {
        linhas.add([
          _numero(questao.numero),
          _texto(questao.letraDoGabarito ?? ''),
          // Calculado em double (e não pelo percentual da tela) para gravar 0,333... exato.
          Numero(questao.acertos / questao.totalRespostas, EstiloCelula.percentual),
          for (final letra in letras)
            if (questao.distribuicao[letra] case final quantidade?)
              _numero(quantidade)
            else
              const Vazia(),
          _numero(questao.emBranco),
          _numero(questao.marcacaoMultipla),
          _texto(questao.alternativaMaisMarcada ?? ''),
          _texto(questao.divergeDoGabarito ? 'Sim' : 'Não'),
        ]);
      }
    }

    final larguras = [9.0, 10.0, 12.0, for (final _ in letras) 6.0, 10.0, 18.0, 13.0, 11.0];
    return Aba(abaEstatisticas, linhas, larguras);
  }
}
