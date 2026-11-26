import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/local/app_database.dart';
import '../../../data/local/relation/banco_questao_com_alternativas.dart';
import '../../../data/repository/banco_questao_repository.dart';
import '../../../data/repository/disciplina_repository.dart';
import '../../../data/repository/prova_repository.dart';
import '../../../data/repository/turma_repository.dart';
import '../../../util/mensagem_erro.dart';
import 'gerar_prova_ui_state.dart';

class GerarProvaViewModel extends ChangeNotifier {
  GerarProvaViewModel({
    required this._provas,
    required BancoQuestaoRepository bancoQuestoes,
    required DisciplinaRepository disciplinas,
    required TurmaRepository turmas,
    this._random,
  }) {
    _assinatura =
        Rx.combineLatest3(
          disciplinas.observarTodas(),
          turmas.observarTodas(),
          bancoQuestoes.observarQuestoes(),
          (
            List<DisciplinaEntity> disciplinas,
            List<TurmaEntity> turmas,
            List<BancoQuestaoComAlternativas> questoes,
          ) => (disciplinas, turmas, questoes),
        ).listen(
          (dados) => _receber(dados.$1, dados.$2, dados.$3),
          onError: (Object erro) => _atualizar(
            _uiState.copyWith(
              carregando: false,
              erro:
                  mensagemDoErro(erro) ??
                  'Não foi possível carregar os cadastros.',
            ),
          ),
        );
  }

  final ProvaRepository _provas;
  final Random? _random;
  late final StreamSubscription<void> _assinatura;
  GerarProvaUiState _uiState = const GerarProvaUiState();
  GerarProvaUiState get uiState => _uiState;
  bool _descartado = false;

  void _receber(
    List<DisciplinaEntity> disciplinas,
    List<TurmaEntity> turmas,
    List<BancoQuestaoComAlternativas> questoes,
  ) {
    final disciplina = disciplinas.any((d) => d.nome == _uiState.disciplina)
        ? _uiState.disciplina
        : null;
    final turma = turmas.any((t) => t.nome == _uiState.turma)
        ? _uiState.turma
        : null;
    final idsVisiveis = {
      for (final q in questoes)
        if (q.questao.disciplina == disciplina) q.questao.id,
    };
    _atualizar(
      _uiState.copyWith(
        carregando: false,
        disciplinas: disciplinas,
        turmas: turmas,
        bancoQuestoes: questoes,
        disciplina: disciplina,
        turma: turma,
        selecionadas: _uiState.selecionadas.intersection(idsVisiveis),
        erro: null,
      ),
    );
  }

  void atualizarTitulo(String valor) =>
      _editar(_uiState.copyWith(titulo: valor, erro: null));
  void atualizarDescricao(String valor) =>
      _editar(_uiState.copyWith(descricao: valor, erro: null));

  void selecionarDisciplina(String? nome) {
    if (nome == _uiState.disciplina) return;
    if (nome != null && !_uiState.disciplinas.any((d) => d.nome == nome)) {
      return;
    }
    _editar(_uiState.copyWith(disciplina: nome, selecionadas: {}, erro: null));
  }

  void selecionarTurma(String? nome) {
    if (nome != null && !_uiState.turmas.any((t) => t.nome == nome)) return;
    _editar(_uiState.copyWith(turma: nome, erro: null));
  }

  void selecionarQuestao(int id, bool marcada) {
    if (!_uiState.questoes.any((q) => q.questao.id == id)) return;
    final selecionadas = {..._uiState.selecionadas};
    if (marcada) {
      selecionadas.add(id);
    } else {
      selecionadas.remove(id);
    }
    _editar(_uiState.copyWith(selecionadas: selecionadas, erro: null));
  }

  void selecionarTodas(bool marcar) => _editar(
    _uiState.copyWith(
      selecionadas: marcar
          ? {for (final q in _uiState.questoes) q.questao.id}
          : {},
      erro: null,
    ),
  );

  void alternarEmbaralharQuestoes(bool valor) =>
      _editar(_uiState.copyWith(embaralharQuestoes: valor));
  void alternarEmbaralharAlternativas(bool valor) =>
      _editar(_uiState.copyWith(embaralharAlternativas: valor));

  Future<int?> gerar() async {
    if (_descartado || _uiState.travado) return null;
    final estado = _uiState;
    final erro = _validar(estado);
    if (erro != null) {
      _atualizar(estado.copyWith(erro: erro));
      return null;
    }
    _atualizar(estado.copyWith(gerando: true, erro: null));
    try {
      final id = await _provas.gerarProvaDoBanco(
        titulo: estado.titulo,
        disciplina: estado.disciplina!,
        turma: estado.turma!,
        descricao: estado.descricao,
        bancoQuestaoIds: [
          for (final q in estado.questoes)
            if (estado.selecionadas.contains(q.questao.id)) q.questao.id,
        ],
        embaralharQuestoes: estado.embaralharQuestoes,
        embaralharAlternativas: estado.embaralharAlternativas,
        random: _random,
      );
      if (_descartado) return null;
      _atualizar(_uiState.copyWith(gerando: false, provaIdGerada: id));
      return id;
    } catch (erro) {
      _atualizar(
        _uiState.copyWith(
          gerando: false,
          erro: mensagemDoErro(erro) ?? 'Não foi possível gerar a prova.',
        ),
      );
      return null;
    }
  }

  String? _validar(GerarProvaUiState estado) {
    if (estado.titulo.trim().isEmpty) return 'Informe o título da prova.';
    if (estado.disciplina == null) return 'Informe a disciplina.';
    if (estado.turma == null) return 'Informe a turma.';
    if (estado.selecionadas.isEmpty) {
      return 'Selecione ao menos uma questão do banco.';
    }
    return null;
  }

  void _editar(GerarProvaUiState estado) {
    if (_uiState.travado) return;
    _atualizar(estado);
  }

  void _atualizar(GerarProvaUiState estado) {
    if (_descartado) return;
    _uiState = estado;
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinatura.cancel();
    super.dispose();
  }
}
