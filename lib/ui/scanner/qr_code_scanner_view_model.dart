import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/local/app_database.dart';
import '../../data/local/relation/prova_com_questoes.dart';
import '../../data/repository/aluno_repository.dart';
import '../../data/repository/prova_repository.dart';
import '../../domain/scanner/qr_code_prova.dart';
import '../../util/mensagem_erro.dart';

/// Texto de um QR Code qualquer (não do ProvaFácil), usado para simular uma leitura inválida.
const qrCodeEstranho = 'https://www.exemplo.com.br/cardapio';

@immutable
class QrCodeScannerUiState {
  const QrCodeScannerUiState({
    this.carregando = true,
    this.provaId,
    this.provaTitulo,
    this.alunos = const [],
    this.alunoSelecionadoId,
    this.simularQrInvalido = false,
    this.erro,
  });

  final bool carregando;
  final int? provaId;
  final String? provaTitulo;
  final List<AlunoEntity> alunos;
  final int? alunoSelecionadoId;
  final bool simularQrInvalido;
  final String? erro;

  AlunoEntity? get alunoSelecionado =>
      alunos.where((a) => a.id == alunoSelecionadoId).firstOrNull;

  /// O texto que a câmera "leu" do QR Code impresso na folha.
  String get textoLido {
    if (simularQrInvalido) return qrCodeEstranho;
    final aluno = alunoSelecionado;
    final id = provaId;
    if (aluno == null || id == null) return '';
    return QrCodeProva.gerar(DadosQrCode(provaId: id, aluno: aluno.nome, turma: aluno.turma));
  }

  LeituraQrCode get leitura => QrCodeProva.ler(textoLido);

  QrCodeScannerUiState copyWith({
    bool? carregando,
    int? Function()? provaId,
    String? Function()? provaTitulo,
    List<AlunoEntity>? alunos,
    int? Function()? alunoSelecionadoId,
    bool? simularQrInvalido,
    String? Function()? erro,
  }) => QrCodeScannerUiState(
    carregando: carregando ?? this.carregando,
    provaId: provaId != null ? provaId() : this.provaId,
    provaTitulo: provaTitulo != null ? provaTitulo() : this.provaTitulo,
    alunos: alunos ?? this.alunos,
    alunoSelecionadoId: alunoSelecionadoId != null ? alunoSelecionadoId() : this.alunoSelecionadoId,
    simularQrInvalido: simularQrInvalido ?? this.simularQrInvalido,
    erro: erro != null ? erro() : this.erro,
  );
}

/// Tela "Ler QR Code" (simulada): identifica a prova e o aluno da folha. O QR Code é montado com a
/// prova escolhida na lista e um aluno cadastrado, e passa pela mesma validação que um QR Code de
/// verdade passaria ([QrCodeProva.ler]).
class QrCodeScannerViewModel extends ChangeNotifier {
  QrCodeScannerViewModel(
    ProvaRepository provaRepository,
    AlunoRepository alunoRepository, {
    int? provaIdInicial,
  }) : _uiState = QrCodeScannerUiState(provaId: provaIdInicial) {
    _assinatura =
        Rx.combineLatest2(
          provaRepository.observarProvas(),
          alunoRepository.observarAlunos(),
          (List<ProvaComQuestoes> provas, List<AlunoEntity> alunos) => (provas, alunos),
        ).listen(
          (dados) => _receber(dados.$1, dados.$2),
          onError: (Object erro) => _atualizar(
            (s) => s.copyWith(
              carregando: false,
              erro: () => mensagemDoErro(erro) ?? 'Não foi possível carregar as provas e os alunos.',
            ),
          ),
        );
  }

  late final StreamSubscription<void> _assinatura;
  QrCodeScannerUiState _uiState;
  QrCodeScannerUiState get uiState => _uiState;
  bool _descartado = false;

  void _receber(List<ProvaComQuestoes> provas, List<AlunoEntity> alunos) {
    _atualizar((estado) {
      // Sem prova escolhida na lista, a folha simulada é da primeira prova cadastrada.
      final provaId = estado.provaId ?? provas.firstOrNull?.prova.id;
      final prova = provas.where((p) => p.prova.id == provaId).firstOrNull;
      final selecionadoAindaExiste = alunos.any((a) => a.id == estado.alunoSelecionadoId);
      return estado.copyWith(
        carregando: false,
        provaId: () => provaId,
        provaTitulo: () => prova?.prova.titulo,
        alunos: alunos,
        alunoSelecionadoId: () =>
            selecionadoAindaExiste ? estado.alunoSelecionadoId : alunos.firstOrNull?.id,
        erro: () => null,
      );
    });
  }

  void selecionarAluno(int alunoId) =>
      _atualizar((s) => s.copyWith(alunoSelecionadoId: () => alunoId));

  void alternarQrInvalido(bool simular) =>
      _atualizar((s) => s.copyWith(simularQrInvalido: simular));

  void _atualizar(QrCodeScannerUiState Function(QrCodeScannerUiState) mudanca) {
    if (_descartado) return;
    _uiState = mudanca(_uiState);
    notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    _assinatura.cancel();
    super.dispose();
  }
}
