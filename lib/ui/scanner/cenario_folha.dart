import 'dart:math';

import '../../domain/correcao/fluxo_correcao.dart';
import '../../domain/scanner/simulador_folha_respostas.dart';

/// Situações de folha que o scanner simulado consegue "ler", para demonstrar e testar o fluxo
/// (inclusive os casos de erro) sem câmera.
///
/// As marcações são geradas a partir do gabarito da prova cadastrada e do nome do aluno
/// identificado no QR Code: o mesmo aluno sempre "preenche" a mesma folha, mas alunos
/// diferentes acertam e erram questões diferentes.
enum CenarioFolha {
  folhaDoAluno('Folha do aluno'),
  marcacaoDupla('Com marcação dupla'),
  folhaIncompleta('Metade em branco'),
  folhaEmBranco('Folha em branco');

  const CenarioFolha(this.descricao);

  final String descricao;

  /// Chance de o aluno simulado acertar cada questão.
  static const chanceDeAcerto = 0.75;

  /// Chance de deixar a questão em branco (o resto vira uma alternativa errada).
  static const chanceEmBranco = 0.08;

  /// Marcações que o scanner detectaria na folha de [nomeAluno] para a [prova], neste cenário.
  Map<int, Set<String>> lerFolha(ProvaParaCorrecao? prova, String nomeAluno) {
    if (prova == null) return const {};
    final marcacoes = marcacoesDoAluno(prova, nomeAluno);
    return switch (this) {
      folhaDoAluno => SimuladorFolhaRespostas.lerFolha(marcacoes),
      marcacaoDupla => SimuladorFolhaRespostas.lerFolhaComMultiplas([
        for (final (indice, letra) in marcacoes.indexed)
          // Nas duas primeiras questões o aluno "esqueceu de apagar" outra bolinha.
          if (indice < 2 && prova.questoes[indice].letras.length > 1)
            _marcacaoDupla(prova.questoes[indice].letras, letra)
          else
            {?letra},
      ]),
      folhaIncompleta => SimuladorFolhaRespostas.lerFolha([
        for (final (indice, letra) in marcacoes.indexed)
          indice < marcacoes.length ~/ 2 ? letra : null,
      ]),
      folhaEmBranco => const {},
    };
  }

  /// Uma marcação por questão (na ordem da prova), `null` quando o aluno deixou em branco.
  static List<String?> marcacoesDoAluno(ProvaParaCorrecao prova, String nomeAluno) {
    final sorteio = Random(_semente(nomeAluno));
    return [
      for (final questao in prova.questoes) _marcar(questao, sorteio),
    ];
  }

  static String? _marcar(QuestaoParaCorrecao questao, Random sorteio) {
    final letras = questao.letras;
    if (letras.isEmpty) return null;
    final correta = questao.letraCorreta;
    final dado = sorteio.nextDouble();
    if (correta != null && dado < chanceDeAcerto) return correta;
    if (dado >= 1 - chanceEmBranco) return null;
    final erradas = [for (final l in letras) if (l != correta) l];
    if (erradas.isEmpty) return correta;
    return erradas[sorteio.nextInt(erradas.length)];
  }

  /// Semente estável (não depende do `hashCode`, que pode mudar entre execuções).
  static int _semente(String nomeAluno) {
    var semente = 7;
    for (final unidade in nomeAluno.trim().toLowerCase().codeUnits) {
      semente = (semente * 31 + unidade) & 0x7fffffff;
    }
    return semente;
  }

  /// A letra que o aluno marcou (ou a primeira, se deixou em branco) mais a vizinha.
  static Set<String> _marcacaoDupla(List<String> letras, String? letra) {
    final marcada = letra ?? letras.first;
    final indice = letras.indexOf(marcada);
    return {marcada, letras[(indice + 1) % letras.length]};
  }
}
