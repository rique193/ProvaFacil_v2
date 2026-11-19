import 'dart:developer';

import 'package:drift/drift.dart';

import '../../domain/aluno/validador_aluno.dart';
import '../backup/backup_alunos.dart';
import '../local/app_database.dart';
import '../local/dao/aluno_dao.dart';
import 'regras_cadastro_aluno.dart';

/// Alunos da tela de Alunos. Usa a mesma tabela da correção: um aluno cadastrado aqui é encontrado
/// pela correção (por nome + turma), e um aluno criado pela correção pode ser completado aqui com
/// matrícula e e-mail.
///
/// Depois de cada cadastro, edição ou exclusão gravada no banco, o backup é avisado (ver [BackupAlunos]).
class AlunoRepository {
  AlunoRepository(this._database, {BackupAlunos backup = BackupAlunos.desativado})
      : _backup = backup,
        _dao = _database.alunoDao;

  static const _tag = 'AlunoRepository';

  final AppDatabase _database;
  final AlunoDao _dao;
  final BackupAlunos _backup;

  /// Todos os alunos, ordenados por turma e nome.
  Stream<List<AlunoEntity>> observarAlunos() => _dao.observarAlunos();

  /// O aluno com esse nome e turma (ignorando maiúsculas), a mesma busca que a correção faz.
  Future<AlunoEntity?> buscarPorNomeETurma(String nome, String turma) =>
      _dao.buscarPorNomeETurma(nome, turma);

  /// Cadastra um aluno, ou completa com matrícula e e-mail um aluno de mesmo nome e turma criado
  /// pela correção. A turma é salva no formato "Turma X" (`FormatoTurma`). Retorna o aluno salvo.
  ///
  /// Lança [ArgumentError] com a mensagem para o professor, se os dados forem inválidos, a
  /// matrícula já for de outro aluno ou o aluno já estiver cadastrado.
  Future<AlunoEntity> cadastrarAluno({
    required String nome,
    required String turma,
    String? matricula,
    String? email,
  }) async {
    final salvo = await _database.transaction(() async {
      _exigirValido(nome, turma, matricula, email);

      final dados = normalizarDadosAluno(nome, turma, matricula, email);
      final dadosMatricula = dados.matricula;
      final decisao = decidirCadastroAluno(
        nome: dados.nome,
        turma: dados.turma,
        matricula: dados.matricula,
        email: dados.email,
        mesmoNomeETurma: await _dao.buscarPorNomeETurma(dados.nome, dados.turma),
        mesmaMatricula: dadosMatricula == null
            ? null
            : await _dao.buscarPorMatricula(dadosMatricula),
      );
      final int alunoId;
      switch (decisao) {
        case Inserir():
          alunoId = await _dao.inserirAluno(
            AlunosCompanion.insert(
              nome: dados.nome,
              turma: Value(dados.turma),
              matricula: Value(dados.matricula),
              email: Value(dados.email),
            ),
          );
        case Completar(:final aluno):
          await _dao.completarAluno(aluno.id, dados.matricula, dados.email ?? aluno.email);
          alunoId = aluno.id;
        case Recusar(:final mensagem):
          throw ArgumentError(mensagem);
      }
      return _buscarSalvo(alunoId);
    });
    await _enviarParaBackup(salvo);
    return salvo;
  }

  /// Grava os dados do formulário no aluno [alunoId] (matrícula ou e-mail em branco são apagados).
  /// Os resultados continuam ligados pelo id, então não mudam. Retorna o aluno salvo.
  ///
  /// Lança [ArgumentError] com a mensagem para o professor, se os dados forem inválidos, outro
  /// aluno já tiver a matrícula ou o mesmo nome e turma, ou o aluno não existir mais.
  Future<AlunoEntity> editarAluno({
    required int alunoId,
    required String nome,
    required String turma,
    String? matricula,
    String? email,
  }) async {
    final salvo = await _database.transaction(() async {
      _exigirValido(nome, turma, matricula, email);
      if (await _dao.buscarPorId(alunoId) == null) throw ArgumentError('Aluno não encontrado.');

      final dados = normalizarDadosAluno(nome, turma, matricula, email);
      final dadosMatricula = dados.matricula;
      final recusa = validarEdicaoAluno(
        alunoId: alunoId,
        nome: dados.nome,
        turma: dados.turma,
        mesmoNomeETurma: await _dao.buscarPorNomeETurma(dados.nome, dados.turma),
        mesmaMatricula: dadosMatricula == null
            ? null
            : await _dao.buscarPorMatricula(dadosMatricula),
      );
      if (recusa != null) throw ArgumentError(recusa);

      await _dao.atualizarAluno(alunoId, dados.nome, dados.turma, dados.matricula, dados.email);
      return _buscarSalvo(alunoId);
    });
    await _enviarParaBackup(salvo);
    return salvo;
  }

  /// Quantos resultados de correção serão apagados junto com o aluno.
  Future<int> contarResultadosDoAluno(int alunoId) => _dao.contarResultadosDoAluno(alunoId);

  /// Exclui o aluno; o banco apaga em cascata os resultados e as respostas dele. Depois pede ao
  /// backup a remoção dos documentos do aluno e dos resultados.
  Future<void> excluirAluno(int alunoId) async {
    // As provas são lidas antes: depois da exclusão os resultados já não existem.
    final provaIds = await _database.transaction(() async {
      final provas = await _dao.listarProvasDoAluno(alunoId);
      await _dao.deletarAluno(alunoId);
      return provas;
    });
    try {
      await _backup.removerAluno(alunoId, provaIds);
    } catch (e, pilha) {
      log(
        'Falha ao remover o aluno $alunoId do backup; a exclusão local foi mantida.',
        name: _tag,
        error: e,
        stackTrace: pilha,
      );
    }
  }

  void _exigirValido(String nome, String turma, String? matricula, String? email) {
    final erro = ValidadorAluno.validar(nome, turma, matricula, email);
    if (erro != null) throw ArgumentError(erro);
  }

  Future<AlunoEntity> _buscarSalvo(int alunoId) async {
    final aluno = await _dao.buscarPorId(alunoId);
    if (aluno == null) throw StateError('Aluno $alunoId não encontrado depois de salvar.');
    return aluno;
  }

  Future<void> _enviarParaBackup(AlunoEntity aluno) async {
    try {
      await _backup.salvarAluno(aluno);
    } catch (e, pilha) {
      log(
        'Falha no backup do aluno ${aluno.id}; o cadastro local foi mantido.',
        name: _tag,
        error: e,
        stackTrace: pilha,
      );
    }
  }
}
