import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/scanner/qr_code_prova.dart';

MotivoQrInvalido? motivo(String? texto) => switch (QrCodeProva.ler(texto)) {
  Invalido(:final motivo) => motivo,
  Valido() => null,
};

void main() {
  test('gerarELer_idaEVolta', () {
    const dados = DadosQrCode(
      provaId: 3,
      aluno: 'Beatriz Nogueira Souza',
      turma: 'Turma A',
    );
    final texto = QrCodeProva.gerar(dados);
    expect(texto, 'PROVAFACIL|1|3|Beatriz Nogueira Souza|Turma A');
    expect(QrCodeProva.ler(texto), const Valido(dados));
  });
  test('separadorNoNomeNaoQuebraOQrCode', () {
    final leitura = QrCodeProva.ler(
      QrCodeProva.gerar(
        const DadosQrCode(provaId: 1, aluno: 'Ana | Maria', turma: 'A|B'),
      ),
    ) as Valido;
    expect(leitura.dados.aluno, 'Ana Maria');
    expect(leitura.dados.turma, 'A B');
  });
  test(
    'turmaVaziaEhAceita',
    () => expect(
      QrCodeProva.ler('PROVAFACIL|1|7|Caio Ferreira Lima|'),
      const Valido(DadosQrCode(provaId: 7, aluno: 'Caio Ferreira Lima')),
    ),
  );
  test(
    'espacosEmVoltaSaoIgnorados',
    () => expect(
      QrCodeProva.ler('  PROVAFACIL | 1 | 7 |  Caio   Lima | A  '),
      const Valido(DadosQrCode(provaId: 7, aluno: 'Caio Lima', turma: 'A')),
    ),
  );
  test('nadaLido_vazio', () {
    for (final texto in [null, '', '   ']) {
      expect(motivo(texto), MotivoQrInvalido.vazio);
    }
  });
  test('qrCodeDeOutroSistema', () {
    for (final texto in [
      'https://www.exemplo.com.br/cardapio',
      'OUTROAPP|1|3|Ana|A',
    ]) {
      expect(motivo(texto), MotivoQrInvalido.naoEDoProvafacil);
    }
  });
  test(
    'versaoDesconhecida',
    () => expect(
      motivo('PROVAFACIL|9|3|Ana|A'),
      MotivoQrInvalido.versaoNaoSuportada,
    ),
  );
  test('camposFaltandoOuSobrando', () {
    for (final texto in [
      'PROVAFACIL',
      'PROVAFACIL|1|3',
      'PROVAFACIL|1|3|Ana|A|extra',
    ]) {
      expect(motivo(texto), MotivoQrInvalido.formatoInvalido);
    }
  });
  test('idDaProvaInvalido', () {
    for (final texto in [
      'PROVAFACIL|1|abc|Ana|A',
      'PROVAFACIL|1|0|Ana|A',
      'PROVAFACIL|1|-5|Ana|A',
      'PROVAFACIL|1||Ana|A',
    ]) {
      expect(motivo(texto), MotivoQrInvalido.provaInvalida);
    }
  });
  test(
    'semNomeDoAluno',
    () => expect(motivo('PROVAFACIL|1|3|   |A'), MotivoQrInvalido.alunoAusente),
  );
  test(
    'mensagemDoInvalidoExplicaOMotivo',
    () => expect(
      (QrCodeProva.ler('qualquer coisa') as Invalido).mensagem,
      MotivoQrInvalido.naoEDoProvafacil.mensagem,
    ),
  );
  test(
    'naoGeraQrCodeSemProva',
    () => expect(
      () => QrCodeProva.gerar(const DadosQrCode(provaId: 0, aluno: 'Ana')),
      throwsArgumentError,
    ),
  );
  test(
    'naoGeraQrCodeSemAluno',
    () => expect(
      () => QrCodeProva.gerar(const DadosQrCode(provaId: 1, aluno: ' ')),
      throwsArgumentError,
    ),
  );
}
