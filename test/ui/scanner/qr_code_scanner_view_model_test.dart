import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/local/app_database.dart';
import 'package:provafacil/data/repository/aluno_repository.dart';
import 'package:provafacil/data/repository/prova_repository.dart';
import 'package:provafacil/domain/model/questao_input.dart';
import 'package:provafacil/domain/scanner/qr_code_prova.dart';
import 'package:provafacil/ui/scanner/qr_code_scanner_view_model.dart';

import '../../ajudantes/banco_em_memoria.dart';

Future<int> _cadastrarProva(AppDatabase db, String titulo) => ProvaRepository(db).salvarConteudoProva(
  provaId: null,
  titulo: titulo,
  disciplina: 'Matemática',
  descricao: '',
  questoes: const [
    QuestaoInput(
      enunciado: 'Quanto é 1 + 1?',
      alternativas: [
        AlternativaInput(texto: '1'),
        AlternativaInput(texto: '2'),
        AlternativaInput(texto: '3'),
        AlternativaInput(texto: '4'),
        AlternativaInput(texto: '5'),
      ],
    ),
  ],
);

String _qr(int provaId, String aluno) =>
    QrCodeProva.gerar(DadosQrCode(provaId: provaId, aluno: aluno, turma: 'A'));

void main() {
  late AppDatabase db;
  late int provaId;

  setUp(() async {
    db = criarBancoEmMemoria();
    provaId = await _cadastrarProva(db, 'Prova de Matemática');
  });

  tearDown(() => db.close());

  Future<QrCodeScannerViewModel> criarViewModel({int? provaIdInicial}) async {
    final vm = QrCodeScannerViewModel(
      ProvaRepository(db),
      AlunoRepository(db),
      provaIdInicial: provaIdInicial,
    );
    addTearDown(vm.dispose);
    for (var i = 0; vm.uiState.carregando && i < 400; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
    expect(vm.uiState.carregando, isFalse);
    return vm;
  }

  test('com a câmera, espera o QR Code e não deixa continuar antes da leitura', () async {
    final vm = await criarViewModel(provaIdInicial: provaId);

    expect(vm.uiState.usarCamera, isTrue);
    expect(vm.uiState.aguardandoCamera, isTrue);
    expect(vm.uiState.podeContinuar, isFalse);
  });

  test('usa o QR Code lido pela câmera, mesmo de aluno não cadastrado', () async {
    final vm = await criarViewModel(provaIdInicial: provaId);

    vm.lerQrCodeDaCamera(_qr(provaId, 'Bruno Lima'));

    expect(vm.uiState.aguardandoCamera, isFalse);
    expect(vm.uiState.textoLido, _qr(provaId, 'Bruno Lima'));
    expect((vm.uiState.leitura as Valido).dados.aluno, 'Bruno Lima');
    expect(vm.uiState.tituloDaProva(provaId), 'Prova de Matemática');
    expect(vm.uiState.podeContinuar, isTrue);
  });

  test('depois de um QR Code válido, ignora as próximas detecções até ler de novo', () async {
    final vm = await criarViewModel(provaIdInicial: provaId);

    vm.lerQrCodeDaCamera(_qr(provaId, 'Ana Souza'));
    vm.lerQrCodeDaCamera(_qr(provaId, 'Bruno Lima'));
    expect((vm.uiState.leitura as Valido).dados.aluno, 'Ana Souza');

    vm.lerDeNovo();
    expect(vm.uiState.aguardandoCamera, isTrue);
    vm.lerQrCodeDaCamera(_qr(provaId, 'Bruno Lima'));
    expect((vm.uiState.leitura as Valido).dados.aluno, 'Bruno Lima');
  });

  test('um QR Code que não é do ProvaFácil é recusado e a câmera continua lendo', () async {
    final vm = await criarViewModel(provaIdInicial: provaId);

    vm.lerQrCodeDaCamera(qrCodeEstranho);
    expect(vm.uiState.leitura, isA<Invalido>());
    expect(vm.uiState.podeContinuar, isFalse);

    vm.lerQrCodeDaCamera(_qr(provaId, 'Ana Souza'));
    expect(vm.uiState.podeContinuar, isTrue);
  });

  test('a folha de outra prova não deixa continuar', () async {
    final outraProvaId = await _cadastrarProva(db, 'Prova de História');
    final vm = await criarViewModel(provaIdInicial: provaId);

    vm.lerQrCodeDaCamera(_qr(outraProvaId, 'Ana Souza'));

    expect(vm.uiState.leitura, isA<Valido>());
    expect(vm.uiState.avisoProvaDiferente, contains('outra prova'));
    expect(vm.uiState.podeContinuar, isFalse);
  });

  test('sem prova escolhida, aceita a folha de qualquer prova', () async {
    final outraProvaId = await _cadastrarProva(db, 'Prova de História');
    final vm = await criarViewModel();

    vm.lerQrCodeDaCamera(_qr(outraProvaId, 'Ana Souza'));

    expect(vm.uiState.podeContinuar, isTrue);
    expect(vm.uiState.tituloDaProva(outraProvaId), 'Prova de História');
  });

  test('trocar para a simulação descarta a leitura da câmera', () async {
    final vm = await criarViewModel(provaIdInicial: provaId);
    vm.lerQrCodeDaCamera(_qr(provaId, 'Ana Souza'));

    vm.alternarCamera(false);
    expect(vm.uiState.usarCamera, isFalse);
    // Sem alunos cadastrados, a simulação não tem folha para montar.
    expect(vm.uiState.textoLido, isEmpty);

    vm.lerQrCodeDaCamera(_qr(provaId, 'Bruno Lima'));
    expect(vm.uiState.textoCamera, isNull);
  });
}
