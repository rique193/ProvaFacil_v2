/// Formato padrão de turma do projeto: "Turma X", o mesmo que o scanner grava no QR Code
/// (ex.: "Turma A"). A correção procura o aluno por nome + turma, então o cadastro de alunos
/// precisa salvar a turma exatamente nesse formato para os dois lados se encontrarem.
abstract final class FormatoTurma {
  static const prefixo = 'Turma';

  /// "turma" no começo do texto (uma ou mais vezes), seguido de espaço ou do fim do texto.
  static final _prefixoDigitado = RegExp(r'^(turma(\s+|$))+', caseSensitive: false);

  static final _espacos = RegExp(r'\s+');

  /// Converte o que o usuário digitou para o formato "Turma X", sem duplicar o prefixo e com o
  /// identificador em maiúsculas: "A", "turma a" e "Turma A" → "Turma A"; "3b" → "Turma 3B".
  /// Retorna "" se não sobrar identificador (texto vazio ou só "Turma").
  static String normalizar(String texto) {
    final identificador = FormatoTurma.identificador(texto);
    return identificador.isEmpty ? '' : '$prefixo $identificador';
  }

  /// Só o identificador da turma, sem o prefixo e em maiúsculas: "turma 3b" → "3B".
  static String identificador(String texto) =>
      texto.trim().replaceAll(_espacos, ' ').replaceAll(_prefixoDigitado, '').toUpperCase();
}
