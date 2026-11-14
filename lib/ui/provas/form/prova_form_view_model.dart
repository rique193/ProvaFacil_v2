import 'package:flutter/foundation.dart';

import '../../../data/repository/prova_repository.dart';
import '../../../domain/model/questao_input.dart';
import '../../../util/mensagem_erro.dart';
import 'prova_form_ui_state.dart';

const _erroPadrao = 'Não foi possível carregar ou salvar a prova.';

/// ViewModel da tela de conteúdo da prova: título, disciplina, descrição, enunciados e texto
/// das alternativas. Não define qual alternativa é a correta — isso é feito na tela de
/// Gabarito (`GabaritoViewModel`).
class ProvaFormViewModel extends ChangeNotifier {
  ProvaFormViewModel(this._repository, int? provaId)
    : _uiState = ProvaFormUiState(provaId: provaId) {
    if (provaId != null) _carregarProva(provaId);
  }

  final ProvaRepository _repository;
  ProvaFormUiState _uiState;
  bool _descartado = false;

  ProvaFormUiState get uiState => _uiState;

  Future<void> _carregarProva(int provaId) async {
    _atualizar((s) => s.copyWith(carregando: true));
    try {
      final provaComQuestoes = await _repository.observarProva(provaId).first;
      if (_descartado) return;
      if (provaComQuestoes == null) {
        _atualizar((s) => s.copyWith(carregando: false, erro: 'Prova não encontrada.'));
        return;
      }
      final questoes = [...provaComQuestoes.questoes]
        ..sort((a, b) {
          final porOrdem = a.questao.ordem.compareTo(b.questao.ordem);
          return porOrdem != 0 ? porOrdem : a.questao.id.compareTo(b.questao.id);
        });
      _atualizar(
        (s) => s.copyWith(
          carregando: false,
          titulo: provaComQuestoes.prova.titulo,
          disciplina: provaComQuestoes.prova.disciplina,
          descricao: provaComQuestoes.prova.descricao,
          questoes: [
            for (final questaoComAlternativas in questoes)
              QuestaoFormState(
                id: questaoComAlternativas.questao.id,
                enunciado: questaoComAlternativas.questao.enunciado,
                alternativas: [
                  for (final alternativa in [...questaoComAlternativas.alternativas]
                    ..sort((a, b) => a.ordem.compareTo(b.ordem)))
                    AlternativaFormState(texto: alternativa.texto, id: alternativa.id),
                ],
              ),
          ],
        ),
      );
    } catch (e) {
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, erro: mensagemDoErro(e) ?? _erroPadrao));
    }
  }

  void atualizarTitulo(String valor) =>
      _atualizarFormulario((s) => s.copyWith(titulo: valor, erro: null));

  void atualizarDisciplina(String valor) =>
      _atualizarFormulario((s) => s.copyWith(disciplina: valor, erro: null));

  void atualizarDescricao(String valor) => _atualizarFormulario((s) => s.copyWith(descricao: valor));

  void adicionarQuestao() => _atualizarFormulario(
    (s) => s.copyWith(questoes: [...s.questoes, const QuestaoFormState()], erro: null),
  );

  void removerQuestao(int questaoIndice) => _atualizarFormulario(
    (s) => s.copyWith(questoes: [...s.questoes]..removeAt(questaoIndice)),
  );

  void atualizarEnunciado(int questaoIndice, String valor) =>
      _atualizarQuestao(questaoIndice, (q) => q.copyWith(enunciado: valor));

  void atualizarTextoAlternativa(int questaoIndice, int alternativaIndice, String valor) =>
      _atualizarQuestao(
        questaoIndice,
        (q) => q.copyWith(
          alternativas: [...q.alternativas]
            ..[alternativaIndice] = q.alternativas[alternativaIndice].copyWith(texto: valor),
        ),
      );

  Future<void> salvar() async {
    final estadoAtual = _uiState;
    if (estadoAtual.carregando || estadoAtual.salvo) return;
    final erroValidacao = _validar(estadoAtual);
    if (erroValidacao != null) {
      _atualizar((s) => s.copyWith(erro: erroValidacao));
      return;
    }

    _atualizar((s) => s.copyWith(carregando: true, erro: null));
    try {
      final idSalvo = await _repository.salvarConteudoProva(
        provaId: estadoAtual.provaId,
        titulo: estadoAtual.titulo.trim(),
        disciplina: estadoAtual.disciplina.trim(),
        descricao: estadoAtual.descricao.trim(),
        questoes: [
          for (final questao in estadoAtual.questoes)
            QuestaoInput(
              id: questao.id,
              enunciado: questao.enunciado.trim(),
              alternativas: [
                for (final alternativa in questao.alternativas)
                  AlternativaInput(texto: alternativa.texto.trim(), id: alternativa.id),
              ],
            ),
        ],
      );
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, salvo: true, provaId: idSalvo));
    } catch (e) {
      if (_descartado) return;
      _atualizar((s) => s.copyWith(carregando: false, erro: mensagemDoErro(e) ?? _erroPadrao));
    }
  }

  void _atualizarQuestao(int questaoIndice, QuestaoFormState Function(QuestaoFormState) f) =>
      _atualizarFormulario(
        (s) => s.copyWith(
          questoes: [...s.questoes]..[questaoIndice] = f(s.questoes[questaoIndice]),
          erro: null,
        ),
      );

  void _atualizarFormulario(ProvaFormUiState Function(ProvaFormUiState) f) {
    if (_uiState.carregando || _uiState.salvo) return;
    _atualizar(f);
  }

  String? _validar(ProvaFormUiState estado) {
    if (estado.titulo.trim().isEmpty) return 'Informe o título da prova.';
    if (estado.disciplina.trim().isEmpty) return 'Informe a disciplina.';
    if (estado.questoes.isEmpty) return 'Adicione ao menos uma questão.';

    for (final (indice, questao) in estado.questoes.indexed) {
      final numero = indice + 1;
      if (questao.enunciado.trim().isEmpty) return 'Preencha o enunciado da questão $numero.';
      if (questao.alternativas.length != quantidadeAlternativas ||
          questao.alternativas.any((a) => a.texto.trim().isEmpty)) {
        return 'Preencha todas as alternativas da questão $numero.';
      }
    }
    return null;
  }

  void _atualizar(ProvaFormUiState Function(ProvaFormUiState) f) {
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}
