import '../../ui/relatorio/relatorio_ui_state.dart';
import '../../util/comparacao.dart';

/// Ordena as linhas do relatório. Por aluno: nome sem diferenciar maiúsculas. Por nota: notas
/// iguais ficam em ordem alfabética nas duas direções. O id do aluno desempata nomes repetidos
/// (mesmo nome em turmas diferentes), para a ordem nunca "pular" entre recomposições.
List<LinhaRelatorioUiState> ordenarLinhas(
  List<LinhaRelatorioUiState> linhas,
  ColunaOrdenacao coluna,
  DirecaoOrdenacao direcao,
) {
  int porNome(LinhaRelatorioUiState a, LinhaRelatorioUiState b) {
    final porTexto = compararSemCaixa(a.nome, b.nome);
    return porTexto != 0 ? porTexto : a.alunoId.compareTo(b.alunoId);
  }

  final ascendente = direcao == DirecaoOrdenacao.ascendente;
  final int Function(LinhaRelatorioUiState, LinhaRelatorioUiState) comparador = switch (coluna) {
    ColunaOrdenacao.aluno => ascendente ? porNome : (a, b) => porNome(b, a),
    ColunaOrdenacao.nota => (a, b) {
      final porNota = ascendente ? a.nota.compareTo(b.nota) : b.nota.compareTo(a.nota);
      return porNota != 0 ? porNota : porNome(a, b);
    },
  };
  return [...linhas]..sort(comparador);
}
