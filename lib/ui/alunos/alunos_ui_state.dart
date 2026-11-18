import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local/app_database.dart';
import '../../domain/aluno/formato_turma.dart';
import '../../util/comparacao.dart';

part 'alunos_ui_state.freezed.dart';

/// Estado editável do formulário do diálogo de aluno: "Novo Aluno" ou "Editar aluno".
@freezed
abstract class AlunoFormState with _$AlunoFormState {
  const AlunoFormState._();

  const factory AlunoFormState({
    /// Aluno em edição; `null` quando é um cadastro novo.
    int? alunoId,
    @Default('') String nome,
    @Default('') String matricula,
    @Default('') String turma,
    @Default('') String email,
    String? erro,
    @Default(false) bool salvando,
  }) = _AlunoFormState;

  /// Como a turma digitada será salva (ex.: "a" → "Turma A"), para a dica do campo.
  String get turmaNormalizada => FormatoTurma.normalizar(turma);

  bool get editando => alunoId != null;
}

/// Pedido de confirmação antes de excluir um aluno.
@freezed
abstract class ConfirmacaoExclusaoAluno with _$ConfirmacaoExclusaoAluno {
  const ConfirmacaoExclusaoAluno._();

  const factory ConfirmacaoExclusaoAluno({
    required int alunoId,
    required String nome,
    required int quantidadeResultados,
  }) = _ConfirmacaoExclusaoAluno;

  String get mensagem => mensagemConfirmacaoExclusao(nome, quantidadeResultados);
}

/// Ex.: "Excluir Ana Souza? 2 resultados de correção também serão apagados."
String mensagemConfirmacaoExclusao(String nome, int quantidadeResultados) =>
    switch (quantidadeResultados) {
      0 => 'Excluir $nome?',
      1 => 'Excluir $nome? 1 resultado de correção também será apagado.',
      _ => 'Excluir $nome? $quantidadeResultados resultados de correção também serão apagados.',
    };

/// Estado da tela de Alunos. A lista vem do banco local (alunos cadastrados aqui e os criados
/// pela correção, que só têm nome e turma).
@freezed
abstract class AlunosUiState with _$AlunosUiState {
  const AlunosUiState._();

  const factory AlunosUiState({
    @Default([]) List<AlunoEntity> alunos,
    @Default(true) bool carregando,
    @Default('') String busca,
    @Default(false) bool mostrarDialogoAluno,
    @Default(AlunoFormState()) AlunoFormState formAluno,
    ConfirmacaoExclusaoAluno? confirmacaoExclusao,

    /// Aviso exibido num snackbar (ex.: "Aluno excluído").
    String? mensagem,
  }) = _AlunosUiState;

  /// Alunos que batem com a busca por nome ou matrícula (ignorando maiúsculas/minúsculas).
  List<AlunoEntity> get alunosFiltrados {
    final termo = busca.trim().toLowerCase();
    if (termo.isEmpty) return alunos;
    return alunos
        .where(
          (aluno) =>
              aluno.nome.toLowerCase().contains(termo) ||
              (aluno.matricula?.toLowerCase().contains(termo) ?? false),
        )
        .toList();
  }

  /// Alunos filtrados, agrupados pela turma já no formato "Turma X" (ordenados por nome dentro
  /// de cada turma). Alunos sem turma ficam no grupo "Sem turma".
  Map<String, List<AlunoEntity>> get alunosPorTurma {
    final ordenados = [...alunosFiltrados];
    mergeSort(ordenados, compare: (a, b) => compararSemCaixa(a.nome, b.nome));
    return SplayTreeMap.of(
      groupBy(ordenados, (aluno) => aluno.turma.trim().isEmpty ? 'Sem turma' : aluno.turma),
    );
  }
}
