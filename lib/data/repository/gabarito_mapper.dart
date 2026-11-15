import '../../domain/correcao/corretor_prova.dart';
import '../../domain/correcao/fluxo_correcao.dart';
import '../local/app_database.dart';
import '../local/relation/prova_com_questoes.dart';
import '../local/relation/questao_com_alternativas.dart';

/// Converte as questões salvas no formato que o `CorretorProva` entende. A letra de cada
/// alternativa vem da sua posição (A, B, C...), igual à tela de Gabarito.
extension GabaritoMapperQuestoes on List<QuestaoComAlternativas> {
  List<GabaritoQuestao> paraGabarito() => [
    for (final (indice, questaoComAlternativas) in _ordenadas().indexed)
      GabaritoQuestao(
        questaoId: questaoComAlternativas.questao.id,
        numero: indice + 1,
        letraCorreta: _letraCorreta(_alternativasOrdenadas(questaoComAlternativas)),
      ),
  ];

  /// Converte as questões salvas no formato usado pelo fluxo de correção (letras A, B, C... pela posição).
  ProvaParaCorrecao paraCorrecao(int provaId, [String titulo = '']) => ProvaParaCorrecao(
    provaId: provaId,
    titulo: titulo,
    questoes: [
      for (final (indice, questaoComAlternativas) in _ordenadas().indexed)
        _questaoParaCorrecao(questaoComAlternativas, indice + 1),
    ],
  );

  List<QuestaoComAlternativas> _ordenadas() => [...this]
    ..sort((a, b) {
      final porOrdem = a.questao.ordem.compareTo(b.questao.ordem);
      return porOrdem != 0 ? porOrdem : a.questao.id.compareTo(b.questao.id);
    });
}

extension GabaritoMapperProva on ProvaComQuestoes {
  /// A prova inteira (com as questões na ordem da prova) no formato do fluxo de correção.
  ProvaParaCorrecao paraCorrecao() => questoes.paraCorrecao(prova.id, prova.titulo);
}

QuestaoParaCorrecao _questaoParaCorrecao(
  QuestaoComAlternativas questaoComAlternativas,
  int numero,
) {
  final alternativas = _alternativasOrdenadas(questaoComAlternativas);
  return QuestaoParaCorrecao(
    questaoId: questaoComAlternativas.questao.id,
    numero: numero,
    letras: [for (var i = 0; i < alternativas.length; i++) _letra(i)],
    letraCorreta: _letraCorreta(alternativas),
  );
}

List<AlternativaEntity> _alternativasOrdenadas(QuestaoComAlternativas questaoComAlternativas) =>
    [...questaoComAlternativas.alternativas]..sort((a, b) {
      final porOrdem = a.ordem.compareTo(b.ordem);
      return porOrdem != 0 ? porOrdem : a.id.compareTo(b.id);
    });

/// A correta é a única marcada; zero ou mais de uma deixa a questão sem gabarito.
String? _letraCorreta(List<AlternativaEntity> alternativas) {
  final corretas = alternativas.where((a) => a.correta).toList();
  return corretas.length == 1 ? _letra(alternativas.indexOf(corretas.single)) : null;
}

String _letra(int indice) => String.fromCharCode(65 + indice);
