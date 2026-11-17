import 'package:freezed_annotation/freezed_annotation.dart';

import '../scanner/qr_code_prova.dart';
import 'corretor_prova.dart';
import 'validador_correcao.dart';

part 'fluxo_correcao.freezed.dart';

@freezed
abstract class QuestaoParaCorrecao with _$QuestaoParaCorrecao {
  const factory QuestaoParaCorrecao({
    required int questaoId,
    required int numero,
    required List<String> letras,
    required String? letraCorreta,
  }) = _QuestaoParaCorrecao;
}

@freezed
abstract class ProvaParaCorrecao with _$ProvaParaCorrecao {
  const ProvaParaCorrecao._();
  const factory ProvaParaCorrecao({
    required int provaId,
    required String titulo,
    required List<QuestaoParaCorrecao> questoes,
  }) = _ProvaParaCorrecao;
  List<GabaritoQuestao> gabarito() => questoes
      .map(
        (q) => GabaritoQuestao(
          questaoId: q.questaoId,
          numero: q.numero,
          letraCorreta: q.letraCorreta,
        ),
      )
      .toList();
  List<EstruturaQuestao> estrutura() => questoes
      .map((q) => EstruturaQuestao(numero: q.numero, letras: q.letras))
      .toList();
}

sealed class ConferenciaFolha {
  const ConferenciaFolha();
}

@freezed
abstract class Pronta extends ConferenciaFolha with _$Pronta {
  const Pronta._();
  const factory Pronta({
    required DadosQrCode dadosQr,
    required ProvaParaCorrecao prova,
    required ValidacaoLeitura validacao,
  }) = _Pronta;
}

@freezed
abstract class Bloqueada extends ConferenciaFolha with _$Bloqueada {
  const Bloqueada._();
  const factory Bloqueada({
    required MotivoBloqueio motivo,
    required String mensagem,
    DadosQrCode? dadosQr,
  }) = _Bloqueada;
}

enum MotivoBloqueio {
  qrInvalido,
  provaNaoEncontrada,
  provaDiferente,
  provaSemQuestoes,
  provaSemGabarito,
  gabaritoIncompleto,
  nenhumaRespostaLida,
}

abstract final class FluxoCorrecao {
  static ConferenciaFolha conferirFolha({
    required String? textoQr,
    required Map<int, Set<String>> respostasLidas,
    required int? provaEscolhidaId,
    required ProvaParaCorrecao? Function(int) buscarProva,
  }) {
    final DadosQrCode dadosQr;
    switch (QrCodeProva.ler(textoQr)) {
      case Invalido(:final mensagem):
        return Bloqueada(motivo: MotivoBloqueio.qrInvalido, mensagem: mensagem);
      case Valido(:final dados):
        dadosQr = dados;
    }
    Bloqueada bloquear(MotivoBloqueio motivo, String mensagem) =>
        Bloqueada(motivo: motivo, mensagem: mensagem, dadosQr: dadosQr);
    final diferente = ValidadorCorrecao.verificarProvaDaFolha(
      provaDoQrId: dadosQr.provaId,
      provaEscolhidaId: provaEscolhidaId,
    );
    if (diferente != null)
      return bloquear(MotivoBloqueio.provaDiferente, diferente);
    final prova = buscarProva(dadosQr.provaId);
    if (prova == null)
      return bloquear(
        MotivoBloqueio.provaNaoEncontrada,
        'A prova deste QR Code não está cadastrada neste aparelho.',
      );
    switch (ValidadorCorrecao.verificarGabarito(prova.gabarito())) {
      case ProvaSemQuestoes(:final mensagem):
        return bloquear(MotivoBloqueio.provaSemQuestoes, mensagem);
      case ProvaSemGabarito(:final mensagem):
        return bloquear(MotivoBloqueio.provaSemGabarito, mensagem);
      case GabaritoIncompleto(:final mensagem):
        return bloquear(MotivoBloqueio.gabaritoIncompleto, mensagem);
      case null:
        break;
    }
    final validacao = ValidadorCorrecao.validarLeitura(
      respostasLidas,
      prova.estrutura(),
    );
    if (validacao.detectadas == 0)
      return bloquear(
        MotivoBloqueio.nenhumaRespostaLida,
        'Nenhuma marcação foi detectada na folha. Verifique o enquadramento e a iluminação e leia de novo.',
      );
    return Pronta(dadosQr: dadosQr, prova: prova, validacao: validacao);
  }

  static CorrecaoProva corrigir(
    ProvaParaCorrecao prova,
    Map<int, Set<String>> respostasLidas, {
    double notaMaxima = CorretorProva.notaMaximaPadrao,
  }) {
    final validacao = ValidadorCorrecao.validarLeitura(
      respostasLidas,
      prova.estrutura(),
    );
    return CorretorProva.corrigir(
      prova.gabarito(),
      validacao.respostas,
      notaMaxima: notaMaxima,
    );
  }
}
