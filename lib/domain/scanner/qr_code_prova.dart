import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code_prova.freezed.dart';

@freezed
abstract class DadosQrCode with _$DadosQrCode {
  const factory DadosQrCode({
    required int provaId,
    required String aluno,
    @Default('') String turma,
  }) = _DadosQrCode;
}

sealed class LeituraQrCode {
  const LeituraQrCode();
}

@freezed
abstract class Valido extends LeituraQrCode with _$Valido {
  const Valido._();
  const factory Valido(DadosQrCode dados) = _Valido;
}

@freezed
abstract class Invalido extends LeituraQrCode with _$Invalido {
  const Invalido._();
  const factory Invalido(MotivoQrInvalido motivo) = _Invalido;
  String get mensagem => motivo.mensagem;
}

enum MotivoQrInvalido {
  vazio(
    'Nenhum QR Code foi lido. Aponte a câmera para o QR Code no cabeçalho da folha.',
  ),
  naoEDoProvafacil(
    'Este QR Code não é de uma folha de respostas do ProvaFácil.',
  ),
  versaoNaoSuportada(
    'Esta folha foi gerada por uma versão do ProvaFácil que este app não reconhece.',
  ),
  formatoInvalido(
    'O QR Code está incompleto ou danificado. Tente ler de novo.',
  ),
  provaInvalida('O QR Code não identifica uma prova válida.'),
  alunoAusente('O QR Code não traz o nome do aluno.');

  const MotivoQrInvalido(this.mensagem);
  final String mensagem;
}

abstract final class QrCodeProva {
  static const prefixo = 'PROVAFACIL';
  static const versao = '1';
  static String gerar(DadosQrCode dados) {
    if (dados.provaId <= 0)
      throw ArgumentError('O id da prova deve ser positivo.');
    if (dados.aluno.trim().isEmpty)
      throw ArgumentError('Informe o nome do aluno.');
    return [
      prefixo,
      versao,
      '${dados.provaId}',
      _limpar(dados.aluno),
      _limpar(dados.turma),
    ].join('|');
  }

  static LeituraQrCode ler(String? texto) {
    final conteudo = texto?.trim() ?? '';
    if (conteudo.isEmpty) return const Invalido(MotivoQrInvalido.vazio);
    final campos = conteudo.split('|');
    if (campos.first.trim() != prefixo)
      return const Invalido(MotivoQrInvalido.naoEDoProvafacil);
    if (campos.length < 2)
      return const Invalido(MotivoQrInvalido.formatoInvalido);
    if (campos[1].trim() != versao)
      return const Invalido(MotivoQrInvalido.versaoNaoSuportada);
    if (campos.length != 5)
      return const Invalido(MotivoQrInvalido.formatoInvalido);
    final provaId = int.tryParse(campos[2].trim());
    if (provaId == null || provaId <= 0)
      return const Invalido(MotivoQrInvalido.provaInvalida);
    final aluno = _limpar(campos[3]);
    if (aluno.isEmpty) return const Invalido(MotivoQrInvalido.alunoAusente);
    return Valido(
      DadosQrCode(provaId: provaId, aluno: aluno, turma: _limpar(campos[4])),
    );
  }

  static String _limpar(String texto) =>
      texto.replaceAll('|', ' ').trim().replaceAll(RegExp(r'\s+'), ' ');
}
