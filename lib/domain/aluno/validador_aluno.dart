import 'formato_turma.dart';

/// Validações do cadastro manual de aluno que não dependem do banco. Nome e turma são
/// obrigatórios; matrícula e e-mail são opcionais, mas o e-mail precisa ter formato válido quando
/// preenchido. A matrícula única é conferida no banco, pelo `AlunoRepository`.
abstract final class ValidadorAluno {
  static final _formatoEmail = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}$',
  );

  /// Mensagem do primeiro problema encontrado, ou `null` se os dados estão válidos.
  static String? validar(String nome, String turma, String? matricula, String? email) {
    if (nome.trim().isEmpty) return 'Informe o nome do aluno.';
    if (FormatoTurma.identificador(turma).isEmpty) return 'Informe a turma.';
    if (email != null && email.trim().isNotEmpty && !emailValido(email.trim())) {
      return 'E-mail inválido.';
    }
    return null;
  }

  static bool emailValido(String email) => _formatoEmail.hasMatch(email);
}
