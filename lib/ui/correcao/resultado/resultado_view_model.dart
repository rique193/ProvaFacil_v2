import 'package:flutter/foundation.dart';

import '../../../data/repository/resultado_repository.dart';
import '../../../util/mensagem_erro.dart';
import 'resultado_ui_state.dart';

class ResultadoViewModel extends ChangeNotifier {
  ResultadoViewModel(this._repository, this._resultadoId) {
    _carregar();
  }
  final ResultadoRepository _repository;
  final int _resultadoId;
  ResultadoUiState _uiState = const ResultadoUiState();
  ResultadoUiState get uiState => _uiState;
  bool _descartado = false;

  Future<void> _carregar() async {
    try {
      final detalhes = await _repository.observarResultado(_resultadoId).first;
      if (_descartado) return;
      if (detalhes == null) {
        _atualizar(
          (s) =>
              s.copyWith(carregando: false, erro: 'Resultado não encontrado.'),
        );
        return;
      }
      final questoesDaProva = {
        for (final q in await _repository.listarQuestoes(
          detalhes.resultado.provaId,
        ))
          q.questao.id: q,
      };
      if (_descartado) return;
      final respostas = [...detalhes.respostas]
        ..sort((a, b) => a.numeroQuestao.compareTo(b.numeroQuestao));
      final questoes = respostas.map((r) {
        final q = questoesDaProva[r.questaoId];
        final alternativas = [...?q?.alternativas]
          ..sort((a, b) => a.ordem.compareTo(b.ordem));
        return ResultadoQuestaoState(
          numero: r.numeroQuestao,
          enunciado: q?.questao.enunciado ?? '',
          alternativas: [
            for (final (i, a) in alternativas.indexed)
              AlternativaResultadoState(
                letra: String.fromCharCode(65 + i),
                texto: a.texto,
              ),
          ],
          letrasMarcadas: r.letrasMarcadas.split('').toSet(),
          letraCorreta: r.letraCorreta.isEmpty ? '?' : r.letraCorreta[0],
          situacao: r.situacao,
        );
      }).toList();
      final r = detalhes.resultado;
      _atualizar(
        (s) => s.copyWith(
          carregando: false,
          nomeAluno: detalhes.aluno.nome,
          turma: detalhes.aluno.turma,
          tituloProva: detalhes.prova.titulo,
          disciplina: detalhes.prova.disciplina,
          corrigidoEm: r.corrigidoEm,
          nota: r.nota,
          notaMaxima: r.notaMaxima,
          totalQuestoes: r.totalQuestoes,
          acertos: r.acertos,
          erros: r.erros,
          emBranco: r.emBranco,
          questoes: questoes,
        ),
      );
    } catch (e) {
      _atualizar(
        (s) => s.copyWith(
          carregando: false,
          erro: mensagemDoErro(e) ?? 'Resultado não encontrado.',
        ),
      );
    }
  }

  void selecionarFiltro(FiltroQuestoes filtro) =>
      _atualizar((s) => s.copyWith(filtro: filtro));
  void _atualizar(ResultadoUiState Function(ResultadoUiState) f) {
    if (_descartado) return;
    _uiState = f(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}
