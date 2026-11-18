import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/aluno/formato_turma.dart';
import '../local/app_database.dart';

part 'regras_cadastro_aluno.freezed.dart';

/// O que fazer com um cadastro manual de aluno, dado o que já existe no banco.
@freezed
sealed class DecisaoCadastroAluno with _$DecisaoCadastroAluno {
  const factory DecisaoCadastroAluno.inserir() = Inserir;

  /// O aluno já existe sem matrícula (foi criado pela correção): só completa matrícula e e-mail.
  const factory DecisaoCadastroAluno.completar(AlunoEntity aluno) = Completar;

  const factory DecisaoCadastroAluno.recusar(String mensagem) = Recusar;
}

/// Decide o cadastro de um aluno (dados já normalizados) sem acessar o banco, para poder ser testado
/// em teste unitário. Nunca sobrescreve a matrícula de um aluno que já tem uma.
///
/// [mesmoNomeETurma] é o aluno já salvo com o mesmo nome e turma, se houver, e [mesmaMatricula] o
/// aluno já salvo com a mesma matrícula (ignorando maiúsculas), se houver.
DecisaoCadastroAluno decidirCadastroAluno({
  required String nome,
  required String turma,
  required String? matricula,
  required String? email,
  required AlunoEntity? mesmoNomeETurma,
  required AlunoEntity? mesmaMatricula,
}) {
  if (mesmaMatricula != null && mesmaMatricula.id != mesmoNomeETurma?.id) {
    return DecisaoCadastroAluno.recusar(_mensagemMatriculaRepetida(mesmaMatricula));
  }
  if (mesmoNomeETurma == null) return const DecisaoCadastroAluno.inserir();

  final matriculaExistente = mesmoNomeETurma.matricula;
  if (matriculaExistente != null &&
      matricula != null &&
      matriculaExistente.toLowerCase() != matricula.toLowerCase()) {
    return DecisaoCadastroAluno.recusar(
      '$nome já está cadastrado na $turma com outra matrícula ($matriculaExistente).',
    );
  }
  if (matriculaExistente != null || (matricula == null && email == null)) {
    return DecisaoCadastroAluno.recusar('$nome já está cadastrado na $turma.');
  }
  return DecisaoCadastroAluno.completar(mesmoNomeETurma);
}

/// Dados do aluno como são gravados: espaços normalizados, turma "Turma X", opcionais vazios como `null`.
@freezed
abstract class DadosAluno with _$DadosAluno {
  const factory DadosAluno({
    required String nome,
    required String turma,
    required String? matricula,
    required String? email,
  }) = _DadosAluno;
}

final _espacos = RegExp(r'\s+');

/// Normaliza o que foi digitado no formulário (cadastro e edição).
DadosAluno normalizarDadosAluno(String nome, String turma, String? matricula, String? email) =>
    DadosAluno(
      nome: nome.trim().replaceAll(_espacos, ' '),
      turma: FormatoTurma.normalizar(turma),
      matricula: _opcional(matricula),
      email: _opcional(email),
    );

String? _opcional(String? valor) {
  final limpo = valor?.trim();
  return limpo == null || limpo.isEmpty ? null : limpo;
}

/// Valida a edição do aluno [alunoId] (dados já normalizados) sem acessar o banco. Os alunos
/// encontrados com o mesmo nome + turma ou a mesma matrícula são ignorados quando são o próprio aluno.
/// Retorna a mensagem para o professor, ou `null` se a edição pode ser gravada.
String? validarEdicaoAluno({
  required int alunoId,
  required String nome,
  required String turma,
  required AlunoEntity? mesmoNomeETurma,
  required AlunoEntity? mesmaMatricula,
}) {
  if (mesmaMatricula != null && mesmaMatricula.id != alunoId) {
    return _mensagemMatriculaRepetida(mesmaMatricula);
  }
  if (mesmoNomeETurma != null && mesmoNomeETurma.id != alunoId) {
    return '$nome já está cadastrado na $turma.';
  }
  return null;
}

String _mensagemMatriculaRepetida(AlunoEntity aluno) =>
    'Já existe um aluno com a matrícula ${aluno.matricula}: ${aluno.nome} (${aluno.turma}).';
