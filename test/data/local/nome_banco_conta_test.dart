import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/nome_banco_conta.dart';

void main() {
  test('dois uids geram nomes de banco diferentes e nenhum é o banco antigo', () {
    final a = nomeBancoDaConta('uidA');
    final b = nomeBancoDaConta('uidB');

    expect(a, 'provafacil_uidA');
    expect(b, 'provafacil_uidB');
    expect(a, isNot(b));
    expect(a, isNot('provafacil'));
  });

  test('o mesmo uid sempre gera o mesmo nome', () {
    expect(nomeBancoDaConta('abc123'), nomeBancoDaConta('abc123'));
  });

  test('caracteres perigosos viram "_" e não formam caminho', () {
    expect(nomeBancoDaConta('../x/y.z'), 'provafacil____x_y_z');
    expect(nomeBancoDaConta('a/b'), isNot(contains('/')));
  });

  test('uid vazio é recusado', () {
    expect(() => nomeBancoDaConta(' '), throwsArgumentError);
  });
}
