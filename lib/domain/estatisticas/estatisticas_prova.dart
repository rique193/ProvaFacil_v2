import 'package:freezed_annotation/freezed_annotation.dart';

import '../correcao/corretor_prova.dart';

part 'estatisticas_prova.freezed.dart';

/// Uma questão da prova como está cadastrada agora: [ordem] define o número exibido.
@freezed
abstract class QuestaoDaProva with _$QuestaoDaProva {
  const factory QuestaoDaProva({
    required int questaoId,
    required int ordem,

    /// Quantidade de alternativas cadastradas; define as letras exibidas (A, B, C...).
    required int totalAlternativas,
  }) = _QuestaoDaProva;
}

/// Uma resposta gravada na correção de um aluno, com o horário dessa correção.
@freezed
abstract class RespostaRegistrada with _$RespostaRegistrada {
  const factory RespostaRegistrada({
    required int questaoId,

    /// Letras marcadas, ex.: "B". Vazio = em branco; "BD" = marcação múltipla.
    required String letrasMarcadas,

    /// Letra correta no gabarito no momento da correção.
    required String letraCorreta,
    required SituacaoQuestao situacao,
    required int corrigidoEm,
  }) = _RespostaRegistrada;
}

/// Estatísticas de uma questão a partir das respostas gravadas.
@freezed
abstract class EstatisticaQuestao with _$EstatisticaQuestao {
  const factory EstatisticaQuestao({
    required int questaoId,
    required int numero,
    required int totalRespostas,
    required int acertos,

    /// Acertos / respostas (0 a 1); `null` quando a questão não tem respostas registradas.
    required double? percentualAcerto,

    /// Gabarito da correção mais recente; `null` sem respostas.
    required String? letraDoGabarito,

    /// Quantos marcaram só aquela letra, em ordem alfabética, incluindo letras com 0.
    required Map<String, int> distribuicao,
    required int emBranco,

    /// Marcaram mais de uma alternativa; não entram em nenhuma letra da [distribuicao].
    required int marcacaoMultipla,
    required String? alternativaMaisMarcada,
    required bool divergeDoGabarito,

    /// As respostas foram corrigidas com gabaritos diferentes (gabarito editado entre correções).
    required bool gabaritoAlterado,
  }) = _EstatisticaQuestao;
}

/// Cálculo das estatísticas por questão de uma prova, a partir das respostas já gravadas pela
/// correção (nada é recorrigido aqui).
abstract final class EstatisticasProva {
  /// As questões saem na ordem atual da prova e numeradas a partir de 1; as respostas são ligadas
  /// à questão pelo `questaoId`.
  ///
  /// - Acerto usa a `situacao` gravada: cada aluno é avaliado pelo gabarito da sua correção.
  /// - A `letraDoGabarito` é a da correção mais recente.
  /// - A mais marcada considera só marcações únicas; no empate, vence a letra alfabeticamente menor.
  static List<EstatisticaQuestao> calcular(
      List<QuestaoDaProva> questoes,
      List<RespostaRegistrada> respostas,
      ) {
    final respostasPorQuestao = <int, List<RespostaRegistrada>>{};
    for (final resposta in respostas) {
      (respostasPorQuestao[resposta.questaoId] ??= []).add(resposta);
    }
    final ordenadas = [...questoes]
      ..sort((a, b) {
        final porOrdem = a.ordem.compareTo(b.ordem);
        return porOrdem != 0 ? porOrdem : a.questaoId.compareTo(b.questaoId);
      });
    return [
      for (final (indice, questao) in ordenadas.indexed)
        _calcularQuestao(questao, indice + 1, respostasPorQuestao[questao.questaoId] ?? const []),
    ];
  }

  static EstatisticaQuestao _calcularQuestao(
      QuestaoDaProva questao,
      int numero,
      List<RespostaRegistrada> respostas,
      ) {
    final marcacoes = [for (final r in respostas) r.letrasMarcadas.toUpperCase()];
    final unicas = [
      for (final marcacao in marcacoes)
        if (marcacao.length == 1) marcacao,
    ];
    final contagemUnicas = <String, int>{};
    for (final letra in unicas) {
      contagemUnicas[letra] = (contagemUnicas[letra] ?? 0) + 1;
    }

    final gabaritos = [
      for (final r in respostas)
        if (r.letraCorreta.isNotEmpty) r.letraCorreta[0].toUpperCase(),
    ];

    RespostaRegistrada? maisRecente;
    for (final resposta in respostas) {
      if (maisRecente == null || resposta.corrigidoEm > maisRecente.corrigidoEm) {
        maisRecente = resposta;
      }
    }
    final letraCorretaRecente = maisRecente?.letraCorreta ?? '';
    final letraDoGabarito = letraCorretaRecente.isEmpty
        ? null
        : letraCorretaRecente[0].toUpperCase();

    // Letras cadastradas, mais qualquer letra gravada fora delas (ex.: alternativa removida depois).
    final letras = <String>{
      for (var i = 0; i < questao.totalAlternativas; i++) String.fromCharCode(65 + i),
      ...unicas,
      ?letraDoGabarito,
    }.toList()..sort();
    final distribuicao = {for (final letra in letras) letra: contagemUnicas[letra] ?? 0};

    String? maisMarcada;
    if (contagemUnicas.isNotEmpty) {
      final maior = contagemUnicas.values.reduce((a, b) => a > b ? a : b);
      maisMarcada = ([
        for (final entrada in contagemUnicas.entries)
          if (entrada.value == maior) entrada.key,
      ]..sort()).first;
    }

    final acertos = respostas.where((r) => r.situacao == SituacaoQuestao.acerto).length;
    return EstatisticaQuestao(
      questaoId: questao.questaoId,
      numero: numero,
      totalRespostas: respostas.length,
      acertos: acertos,
      percentualAcerto: respostas.isEmpty ? null : acertos / respostas.length,
      letraDoGabarito: letraDoGabarito,
      distribuicao: distribuicao,
      emBranco: marcacoes.where((m) => m.isEmpty).length,
      marcacaoMultipla: marcacoes.where((m) => m.length > 1).length,
      alternativaMaisMarcada: maisMarcada,
      divergeDoGabarito:
      maisMarcada != null && letraDoGabarito != null && maisMarcada != letraDoGabarito,
      gabaritoAlterado: gabaritos.toSet().length > 1,
    );
  }
}
