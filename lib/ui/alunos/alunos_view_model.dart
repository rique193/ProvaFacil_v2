import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/repository/turma_repository.dart';
import '../../data/local/app_database.dart';
import '../../data/repository/aluno_repository.dart';
import '../../util/mensagem_erro.dart';
import 'alunos_ui_state.dart';

/// ViewModel da tela de Alunos: observa os alunos salvos no banco e cadastra, edita e exclui pelo
/// [AlunoRepository], que aplica as regras de turma, matrícula e e-mail.
class AlunosViewModel extends ChangeNotifier {
  AlunosViewModel(this._repository, {TurmaRepository? turmaRepository}) {
    _assinatura = _repository.observarAlunos().listen(
          (alunos) => _atualizar((s) => s.copyWith(alunos: alunos, carregando: false)),
    );
    _assinaturaTurmas = turmaRepository?.observarTodas().listen(
          (turmas) => _atualizar((s) => s.copyWith(turmas: turmas)),
    );
  }

  final AlunoRepository _repository;
  late final StreamSubscription<List<AlunoEntity>> _assinatura;
  StreamSubscription<List<TurmaEntity>>? _assinaturaTurmas;
  bool _descartado = false;

  AlunosUiState _uiState = const AlunosUiState();
  AlunosUiState get uiState => _uiState;

  void atualizarBusca(String valor) => _atualizar((s) => s.copyWith(busca: valor));

  void abrirDialogoNovoAluno() =>
      _atualizar((s) => s.copyWith(mostrarDialogoAluno: true, formAluno: const AlunoFormState()));

  /// Abre o mesmo diálogo do cadastro, já preenchido com os dados do aluno.
  void abrirDialogoEditarAluno(AlunoEntity aluno) => _atualizar(
    (s) => s.copyWith(
      mostrarDialogoAluno: true,
      formAluno: AlunoFormState(
        alunoId: aluno.id,
        nome: aluno.nome,
        turma: aluno.turma,
        matricula: aluno.matricula ?? '',
        email: aluno.email ?? '',
      ),
    ),
  );

  void fecharDialogoAluno() => _atualizar((s) => s.copyWith(mostrarDialogoAluno: false));

  void atualizarNome(String valor) => _atualizarForm((f) => f.copyWith(nome: valor, erro: null));

  void atualizarMatricula(String valor) =>
      _atualizarForm((f) => f.copyWith(matricula: valor, erro: null));

  void atualizarTurma(String valor) => _atualizarForm((f) => f.copyWith(turma: valor, erro: null));

  void atualizarEmail(String valor) => _atualizarForm((f) => f.copyWith(email: valor, erro: null));

  /// Cadastra o aluno novo ou grava a edição, conforme o formulário.
  Future<void> confirmarAluno() async {
    final form = _uiState.formAluno;
    if (form.salvando) return;
    _atualizarForm((f) => f.copyWith(salvando: true, erro: null));

    try {
      final alunoId = form.alunoId;
      if (alunoId == null) {
        await _repository.cadastrarAluno(
          nome: form.nome,
          turma: form.turma,
          matricula: form.matricula,
          email: form.email,
        );
      } else {
        await _repository.editarAluno(
          alunoId: alunoId,
          nome: form.nome,
          turma: form.turma,
          matricula: form.matricula,
          email: form.email,
        );
      }
      _atualizar((s) => s.copyWith(mostrarDialogoAluno: false, formAluno: const AlunoFormState()));
    } on ArgumentError catch (e) {
      _atualizarForm(
        (f) => f.copyWith(
          salvando: false,
          erro: mensagemDoErro(e) ?? 'Não foi possível salvar o aluno.',
        ),
      );
    }
  }

  /// Pede confirmação, informando quantos resultados de correção serão apagados junto.
  Future<void> pedirExclusao() async {
    final estado = _uiState;
    final alunoId = estado.formAluno.alunoId;
    if (alunoId == null) return;
    // Nome salvo no banco, não o que pode ter sido alterado no formulário sem salvar.
    final nome =
        estado.alunos.where((aluno) => aluno.id == alunoId).firstOrNull?.nome ??
        estado.formAluno.nome.trim();
    final quantidade = await _repository.contarResultadosDoAluno(alunoId);
    _atualizar(
      (s) => s.copyWith(
        confirmacaoExclusao: ConfirmacaoExclusaoAluno(
          alunoId: alunoId,
          nome: nome,
          quantidadeResultados: quantidade,
        ),
      ),
    );
  }

  void cancelarExclusao() => _atualizar((s) => s.copyWith(confirmacaoExclusao: null));

  Future<void> confirmarExclusao() async {
    final confirmacao = _uiState.confirmacaoExclusao;
    if (confirmacao == null) return;
    _atualizar((s) => s.copyWith(confirmacaoExclusao: null));
    await _repository.excluirAluno(confirmacao.alunoId);
    _atualizar(
      (s) => s.copyWith(
        mostrarDialogoAluno: false,
        formAluno: const AlunoFormState(),
        mensagem: 'Aluno excluído',
      ),
    );
  }

  void mensagemExibida() => _atualizar((s) => s.copyWith(mensagem: null));

  void _atualizarForm(AlunoFormState Function(AlunoFormState) transformar) =>
      _atualizar((s) => s.copyWith(formAluno: transformar(s.formAluno)));

  void _atualizar(AlunosUiState Function(AlunosUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinatura.cancel();
    _assinaturaTurmas?.cancel();
    super.dispose();
  }
}
