import 'package:freezed_annotation/freezed_annotation.dart';

import 'validador_correcao.dart';

part 'corretor_prova.freezed.dart';

@freezed
abstract class GabaritoQuestao with _$GabaritoQuestao {
  const factory GabaritoQuestao({
    required int questaoId,
    required int numero,
    required String? letraCorreta,
  }) = _GabaritoQuestao;
}

enum SituacaoQuestao {
  acerto('ACERTO'),
  erro('ERRO'),
  emBranco('EM_BRANCO'),
  marcacaoMultipla('MARCACAO_MULTIPLA');

  const SituacaoQuestao(this.nome);
  final String nome;
  static SituacaoQuestao deNome(String nome) => values.firstWhere(
    (s) => s.nome == nome,
    orElse: () => throw ArgumentError('Situação desconhecida: $nome'),
  );
}

@freezed
abstract class QuestaoCorrigida with _$QuestaoCorrigida {
  const QuestaoCorrigida._();
  const factory QuestaoCorrigida({
    required int questaoId,
    required int numero,
    required Set<String> letrasMarcadas,
    required String letraCorreta,
    required SituacaoQuestao situacao,
  }) = _QuestaoCorrigida;
  bool get acertou => situacao == SituacaoQuestao.acerto;
}

@freezed
abstract class CorrecaoProva with _$CorrecaoProva {
  const CorrecaoProva._();
  const factory CorrecaoProva({
    required List<QuestaoCorrigida> questoes,
    required double nota,
    required double notaMaxima,
  }) = _CorrecaoProva;
  int get totalQuestoes => questoes.length;
  int get acertos => questoes.where((q) => q.acertou).length;
  int get erros => questoes
      .where(
        (q) =>
            q.situacao == SituacaoQuestao.erro ||
            q.situacao == SituacaoQuestao.marcacaoMultipla,
      )
      .length;
  int get emBranco =>
      questoes.where((q) => q.situacao == SituacaoQuestao.emBranco).length;
}

class GabaritoIncompletoException implements Exception {
  GabaritoIncompletoException(List<int> questoes, [String? mensagem])
    : questoesSemGabarito = List.unmodifiable(questoes),
      mensagem = mensagem ?? GabaritoIncompleto(questoes).mensagem;
  final List<int> questoesSemGabarito;
  final String mensagem;
  @override
  String toString() => mensagem;
}

class ProvaSemGabaritoException extends GabaritoIncompletoException {
  ProvaSemGabaritoException(List<int> questoes)
    : super(questoes, const ProvaSemGabarito().mensagem);
}

abstract final class CorretorProva {
  static const notaMaximaPadrao = 10.0;

  static CorrecaoProva corrigir(
    List<GabaritoQuestao> gabarito,
    Map<int, Set<String>> respostasAluno, {
    double notaMaxima = notaMaximaPadrao,
  }) {
    if (notaMaxima <= 0 || !notaMaxima.isFinite) {
      throw ArgumentError('A nota máxima deve ser maior que zero.');
    }
    switch (ValidadorCorrecao.verificarGabarito(gabarito)) {
      case ProvaSemGabarito():
        throw ProvaSemGabaritoException(
          gabarito.map((q) => q.numero).toList()..sort(),
        );
      case GabaritoIncompleto(:final questoes):
        throw GabaritoIncompletoException(questoes);
      case ProvaSemQuestoes() || null:
        break;
    }
    final ordenadas = [...gabarito]
      ..sort((a, b) => a.numero.compareTo(b.numero));
    final questoes = ordenadas.map((q) {
      final marcadas = (respostasAluno[q.numero] ?? <String>{})
          .map((l) => l.toUpperCase())
          .toSet();
      final correta = q.letraCorreta!.toUpperCase();
      return QuestaoCorrigida(
        questaoId: q.questaoId,
        numero: q.numero,
        letrasMarcadas: marcadas,
        letraCorreta: correta,
        situacao: avaliar(marcadas, correta),
      );
    }).toList();
    return CorrecaoProva(
      questoes: questoes,
      nota: calcularNota(
        questoes.where((q) => q.acertou).length,
        questoes.length,
        notaMaxima: notaMaxima,
      ),
      notaMaxima: notaMaxima,
    );
  }

  static SituacaoQuestao avaliar(
    Set<String> letrasMarcadas,
    String letraCorreta,
  ) {
    if (letrasMarcadas.isEmpty) return SituacaoQuestao.emBranco;
    if (letrasMarcadas.length > 1) return SituacaoQuestao.marcacaoMultipla;
    return letrasMarcadas.first.toUpperCase() == letraCorreta.toUpperCase()
        ? SituacaoQuestao.acerto
        : SituacaoQuestao.erro;
  }

  static double calcularNota(
    int acertos,
    int totalQuestoes, {
    double notaMaxima = notaMaximaPadrao,
  }) {
    if (totalQuestoes <= 0) return 0;
    if (acertos < 0 || acertos > totalQuestoes) {
      throw ArgumentError(
        'Acertos ($acertos) fora do intervalo 0..$totalQuestoes.',
      );
    }
    final partes = notaMaxima.abs().toString().toLowerCase().split('e');
    final decimal = partes.first.split('.');
    final escala =
        (decimal.length == 2 ? decimal.last.length : 0) -
        (partes.length == 2 ? int.parse(partes.last) : 0);
    var numerador =
        BigInt.parse(decimal.join()) * BigInt.from(acertos) * BigInt.from(100);
    var denominador = BigInt.from(totalQuestoes);
    if (escala >= 0) {
      denominador *= BigInt.from(10).pow(escala);
    } else {
      numerador *= BigInt.from(10).pow(-escala);
    }
    var centavos = numerador ~/ denominador;
    if (numerador.remainder(denominador) * BigInt.two >= denominador)
      centavos += BigInt.one;
    final texto = centavos.toString().padLeft(3, '0');
    return double.parse(
      '${notaMaxima.isNegative ? '-' : ''}${texto.substring(0, texto.length - 2)}.${texto.substring(texto.length - 2)}',
    );
  }
}
