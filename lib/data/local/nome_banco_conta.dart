/// Nome do arquivo do banco local de uma conta: um banco por professor, `provafacil_<uid>`.
/// O banco antigo (`provafacil`, de antes do login separar os dados) não é aberto nem apagado.
///
/// Caracteres fora de letras, números, `-` e `_` viram `_`, para o uid nunca formar um caminho.
String nomeBancoDaConta(String uid) {
  if (uid.trim().isEmpty) throw ArgumentError('Uid vazio: a conta precisa de um banco próprio.');
  return 'provafacil_${uid.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_')}';
}
