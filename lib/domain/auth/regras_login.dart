/// Tamanho mínimo de senha que o Firebase Authentication aceita.
const tamanhoMinimoSenha = 6;

/// Confere o formulário de cadastro antes de chamar o Firebase. Devolve a mensagem do primeiro
/// problema encontrado, ou `null` se estiver tudo certo.
String? validarCadastroProfessor({
  required String nome,
  required String email,
  required String senha,
  required String confirmacaoSenha,
}) {
  if (nome.trim().isEmpty) return 'Informe seu nome.';
  final erroEmail = _validarEmail(email);
  if (erroEmail != null) return erroEmail;
  if (senha.isEmpty) return 'Informe a senha.';
  if (senha.length < tamanhoMinimoSenha) {
    return 'A senha precisa ter pelo menos $tamanhoMinimoSenha caracteres.';
  }
  if (confirmacaoSenha.isEmpty) return 'Confirme a senha.';
  if (senha != confirmacaoSenha) return 'As senhas não conferem.';
  return null;
}

/// Confere o formulário de login antes de chamar o Firebase.
String? validarLogin({required String email, required String senha}) {
  if (email.trim().isEmpty) return 'Informe o e-mail.';
  if (senha.isEmpty) return 'Informe a senha.';
  return null;
}

/// Só o básico (algo antes e depois do @); o resto o Firebase confere (`invalid-email`).
String? _validarEmail(String email) {
  final limpo = email.trim();
  if (limpo.isEmpty) return 'Informe o e-mail.';
  final arroba = limpo.indexOf('@');
  if (arroba <= 0 || arroba == limpo.length - 1) return 'Informe um e-mail válido.';
  return null;
}
