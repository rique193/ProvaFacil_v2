import '../../util/comparacao.dart';
import '../../ui/relatorio/relatorio_ui_state.dart';

/// Ordena as linhas do relatório com base na coluna e direção escolhidas,
/// mantendo as regras de desempate por nome e ID do aluno do Kotlin.
List<LinhaRelatorioUiState> ordenarLinhas(
    List<LinhaRelatorioUiState> linhas,
    ColunaOrdenacao coluna,
    DirecaoOrdenacao direcao,
    ) {
  final lista = List<LinhaRelatorioUiState>.from(linhas);
  lista.sort((a, b) {
    int resultado = 0;
    switch (coluna) {
      case ColunaOrdenacao.aluno:
        resultado = compararSemCaixa(a.nome, b.nome);
        if (resultado == 0) {
          resultado = a.alunoId.compareTo(b.alunoId);
        }
        break;
      case ColunaOrdenacao.nota:
        resultado = a.nota.compareTo(b.nota);
        if (resultado == 0) {
          resultado = compararSemCaixa(a.nome, b.nome);
        }
        break;
    }
    return direcao == DirecaoOrdenacao.ascendente ? resultado : -resultado;
  });
  return lista;
}