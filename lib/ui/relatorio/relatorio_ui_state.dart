import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/prova/status_prova.dart';

part 'relatorio_ui_state.freezed.dart';

/// Colunas pelas quais a tabela de notas pode ser ordenada.
enum ColunaOrdenacao { aluno, nota }

/// Direção da ordenação atual, com [invertida] para alternar ao clicar de novo na mesma coluna.
enum DirecaoOrdenacao {
  ascendente,
  descendente;

  DirecaoOrdenacao invertida() => this == ascendente ? descendente : ascendente;
}

/// Uma linha da tabela, com os acertos e a nota gravados na correção.
@freezed
abstract class LinhaRelatorioUiState with _$LinhaRelatorioUiState {
  const factory LinhaRelatorioUiState({
    required int alunoId,
    required String nome,

    /// `null` para alunos criados pela correção, que só têm nome e turma.
    required String? matricula,
    required int acertos,
    required double nota,
  }) = _LinhaRelatorioUiState;
}

/// Estado da tela de Relatório de Notas.
@freezed
abstract class RelatorioNotasUiState with _$RelatorioNotasUiState {
  const factory RelatorioNotasUiState({
    @Default(true) bool carregando,
    @Default('') String tituloProva,
    @Default(<LinhaRelatorioUiState>[]) List<LinhaRelatorioUiState> linhas,
    @Default(ColunaOrdenacao.aluno) ColunaOrdenacao colunaOrdenacao,
    @Default(DirecaoOrdenacao.ascendente) DirecaoOrdenacao direcaoOrdenacao,
    @Default(0.0) double mediaDaTurma,
    @Default(0.0) double maiorNota,
    @Default(0.0) double menorNota,
    @Default(StatusProva.pendente) StatusProva status,
    @Default(0) int totalAlunosTurma,
    @Default(0) int totalCorrigidos,

    /// Nomes dos alunos da turma da prova que ainda não foram corrigidos.
    @Default(<String>[]) List<String> alunosPendentes,
    @Default(false) bool exportando,

    /// Resultado da última exportação, para o snackbar; volta a `null` depois de exibido.
    String? mensagem,
  }) = _RelatorioNotasUiState;
}

extension RelatorioNotasUiStateX on RelatorioNotasUiState {
  bool get podeExportar => !carregando && !exportando && linhas.isNotEmpty;
}
