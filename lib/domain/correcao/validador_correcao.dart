import 'package:freezed_annotation/freezed_annotation.dart';

import 'corretor_prova.dart';

part 'validador_correcao.freezed.dart';

@freezed
abstract class EstruturaQuestao with _$EstruturaQuestao {
  const factory EstruturaQuestao({
    required int numero,
    required List<String> letras,
  }) = _EstruturaQuestao;
}

@freezed
abstract class ValidacaoLeitura with _$ValidacaoLeitura {
  const ValidacaoLeitura._();
  const factory ValidacaoLeitura({
    required Map<int, Set<String>> respostas,
    required int totalQuestoes,
    required List<int> emBranco,
    required List<int> marcacaoMultipla,
    required List<int> foraDaProva,
    required Map<int, Set<String>> letrasInvalidas,
  }) = _ValidacaoLeitura;
  int get detectadas => totalQuestoes - emBranco.length;
  bool get completa => emBranco.isEmpty;
  bool get temAvisos => avisos.isNotEmpty;
  List<String> get avisos => [
    if (emBranco.isNotEmpty)
      '${emBranco.length} questão(ões) sem resposta: ${emBranco.join(', ')}. Contarão como em branco.',
    if (marcacaoMultipla.isNotEmpty)
      'Mais de uma alternativa marcada na(s) questão(ões) ${marcacaoMultipla.join(', ')}: serão anuladas.',
    if (letrasInvalidas.isNotEmpty)
      'Marcações fora das alternativas da questão foram descartadas: ${letrasInvalidas.entries.map((e) => 'Q${e.key} (${(e.value.toList()..sort()).join()})').join('; ')}.',
    if (foraDaProva.isNotEmpty)
      'A folha tem marcações em questões que não existem nesta prova (${foraDaProva.join(', ')}); foram ignoradas.',
  ];
}

sealed class ProblemaGabarito {
  const ProblemaGabarito();
  String get mensagem;
}

@freezed
abstract class ProvaSemQuestoes extends ProblemaGabarito
    with _$ProvaSemQuestoes {
  const ProvaSemQuestoes._();
  const factory ProvaSemQuestoes() = _ProvaSemQuestoes;
  @override
  String get mensagem =>
      'Esta prova não tem questões cadastradas. Cadastre as questões antes de corrigir.';
}

@freezed
abstract class ProvaSemGabarito extends ProblemaGabarito
    with _$ProvaSemGabarito {
  const ProvaSemGabarito._();
  const factory ProvaSemGabarito() = _ProvaSemGabarito;
  @override
  String get mensagem =>
      'Esta prova ainda não tem gabarito. Defina as respostas corretas na tela de Gabarito antes de corrigir.';
}

@freezed
abstract class GabaritoIncompleto extends ProblemaGabarito
    with _$GabaritoIncompleto {
  const GabaritoIncompleto._();
  const factory GabaritoIncompleto(List<int> questoes) = _GabaritoIncompleto;
  @override
  String get mensagem =>
      'O gabarito está incompleto. Defina a resposta correta da(s) questão(ões) ${questoes.join(', ')} na tela de Gabarito antes de corrigir.';
}

abstract final class ValidadorCorrecao {
  static ValidacaoLeitura validarLeitura(
    Map<int, Set<String>> respostasLidas,
    List<EstruturaQuestao> estrutura,
  ) {
    final respostas = <int, Set<String>>{};
    final letrasInvalidas = <int, Set<String>>{};
    final ordenadas = [...estrutura]
      ..sort((a, b) => a.numero.compareTo(b.numero));
    for (final q in ordenadas) {
      final lidas = (respostasLidas[q.numero] ?? <String>{})
          .map((l) => l.toUpperCase())
          .toSet();
      final validas = q.letras.map((l) => l.toUpperCase()).toSet();
      final aceitas = lidas.intersection(validas);
      final descartadas = lidas.difference(aceitas);
      if (aceitas.isNotEmpty) respostas[q.numero] = aceitas;
      if (descartadas.isNotEmpty) letrasInvalidas[q.numero] = descartadas;
    }
    final numeros = ordenadas.map((q) => q.numero).toList();
    return ValidacaoLeitura(
      respostas: respostas,
      totalQuestoes: estrutura.length,
      emBranco: numeros.where((n) => respostas[n]?.isEmpty ?? true).toList(),
      marcacaoMultipla: numeros
          .where((n) => (respostas[n]?.length ?? 0) > 1)
          .toList(),
      foraDaProva:
          respostasLidas.entries
              .where((e) => !numeros.contains(e.key) && e.value.isNotEmpty)
              .map((e) => e.key)
              .toList()
            ..sort(),
      letrasInvalidas: letrasInvalidas,
    );
  }

  static ProblemaGabarito? verificarGabarito(List<GabaritoQuestao> gabarito) {
    if (gabarito.isEmpty) return const ProvaSemQuestoes();
    final semResposta =
        gabarito
            .where((q) => q.letraCorreta == null)
            .map((q) => q.numero)
            .toList()
          ..sort();
    if (semResposta.isEmpty) return null;
    if (semResposta.length == gabarito.length) return const ProvaSemGabarito();
    return GabaritoIncompleto(semResposta);
  }

  static String? verificarProvaDaFolha({
    required int provaDoQrId,
    required int? provaEscolhidaId,
  }) => provaEscolhidaId != null && provaEscolhidaId != provaDoQrId
      ? 'Esta folha é de outra prova (id $provaDoQrId). Verifique se escolheu a prova certa para corrigir.'
      : null;
}
