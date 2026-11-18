import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/ui/alunos/alunos_ui_state.dart';

void main() {
  test('sem resultados', () {
    expect(mensagemConfirmacaoExclusao('Ana Souza', 0), 'Excluir Ana Souza?');
  });

  test('um resultado', () {
    expect(
      mensagemConfirmacaoExclusao('Ana Souza', 1),
      'Excluir Ana Souza? 1 resultado de correção também será apagado.',
    );
  });

  test('vários resultados', () {
    expect(
      mensagemConfirmacaoExclusao('Ana Souza', 2),
      'Excluir Ana Souza? 2 resultados de correção também serão apagados.',
    );
  });
}
