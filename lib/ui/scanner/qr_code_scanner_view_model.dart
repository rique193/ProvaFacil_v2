import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/local/app_database.dart';
import '../../data/local/relation/prova_com_questoes.dart';
import '../../data/repository/aluno_repository.dart';
import '../../data/repository/prova_repository.dart';
import '../../domain/correcao/validador_correcao.dart';
import '../../domain/scanner/qr_code_prova.dart';
import '../../util/mensagem_erro.dart';

/// Texto de um QR Code qualquer (não do ProvaFácil), usado para simular uma leitura inválida.
const qrCodeEstranho = 'https://www.exemplo.com.br/cardapio';

@immutable
class QrCodeScannerUiState {
  const QrCodeScannerUiState({
    this.carregando = true,
    this.usarCamera = true,
    this.textoCamera,
    this.provaEscolhidaId,
    this.provaId,
    this.provaTitulo,
    this.titulosProvas = const {},
    this.alunos = const [],
    this.alunoSelecionadoId,
    this.simularQrInvalido = false,
    this.erro,
  });

  final bool carregando;

  /// `true`: o QR Code vem da câmera do celular. `false`: modo simulação (sem câmera).
  final bool usarCamera;

  /// Último texto lido pela câmera; nulo enquanto nenhum QR Code foi detectado.
  final String? textoCamera;

  /// Prova escolhida na lista antes de abrir o scanner (nula quando o scanner foi aberto direto).
  final int? provaEscolhidaId;

  /// Prova usada pela simulação: a escolhida ou, sem escolha, a primeira cadastrada.
  final int? provaId;
  final String? provaTitulo;

  /// Título de cada prova cadastrada, para mostrar a prova que veio no QR Code lido.
  final Map<int, String> titulosProvas;
  final List<AlunoEntity> alunos;
  final int? alunoSelecionadoId;
  final bool simularQrInvalido;
  final String? erro;

  AlunoEntity? get alunoSelecionado => alunos.where((a) => a.id == alunoSelecionadoId).firstOrNull;

  /// Ainda esperando a câmera encontrar um QR Code.
  bool get aguardandoCamera => usarCamera && textoCamera == null;

  /// O texto do QR Code impresso na folha: o que a câmera leu ou, no modo simulação, o montado
  /// com a prova e o aluno escolhidos.
  String get textoLido {
    if (usarCamera) return textoCamera ?? '';
    if (simularQrInvalido) return qrCodeEstranho;
    final aluno = alunoSelecionado;
    final id = provaId;
    if (aluno == null || id == null) return '';
    return QrCodeProva.gerar(DadosQrCode(provaId: id, aluno: aluno.nome, turma: aluno.turma));
  }

  LeituraQrCode get leitura => QrCodeProva.ler(textoLido);

  /// Mensagem quando o QR Code lido é de outra prova que não a escolhida na lista.
  String? get avisoProvaDiferente => switch (leitura) {
    Valido(:final dados) => ValidadorCorrecao.verificarProvaDaFolha(
      provaDoQrId: dados.provaId,
      provaEscolhidaId: provaEscolhidaId,
    ),
    Invalido() => null,
  };

  /// Só deixa seguir para as respostas com um QR Code válido e da prova certa.
  bool get podeContinuar => leitura is Valido && avisoProvaDiferente == null;

  /// Título da prova identificada no QR Code (nulo se ela não estiver cadastrada aqui).
  String? tituloDaProva(int provaId) {
    final titulo = titulosProvas[provaId]?.trim();
    return titulo == null || titulo.isEmpty ? null : titulo;
  }

  QrCodeScannerUiState copyWith({
    bool? carregando,
    bool? usarCamera,
    String? Function()? textoCamera,
    int? Function()? provaId,
    String? Function()? provaTitulo,
    Map<int, String>? titulosProvas,
    List<AlunoEntity>? alunos,
    int? Function()? alunoSelecionadoId,
    bool? simularQrInvalido,
    String? Function()? erro,
  }) => QrCodeScannerUiState(
    carregando: carregando ?? this.carregando,
    usarCamera: usarCamera ?? this.usarCamera,
    textoCamera: textoCamera != null ? textoCamera() : this.textoCamera,
    provaEscolhidaId: provaEscolhidaId,
    provaId: provaId != null ? provaId() : this.provaId,
    provaTitulo: provaTitulo != null ? provaTitulo() : this.provaTitulo,
    titulosProvas: titulosProvas ?? this.titulosProvas,
    alunos: alunos ?? this.alunos,
    alunoSelecionadoId: alunoSelecionadoId != null ? alunoSelecionadoId() : this.alunoSelecionadoId,
    simularQrInvalido: simularQrInvalido ?? this.simularQrInvalido,
    erro: erro != null ? erro() : this.erro,
  );
}

/// Tela "Ler QR Code": identifica a prova e o aluno da folha.
///
/// Com a câmera, o texto vem do QR Code impresso na folha de respostas. No modo simulação (para
/// emulador sem câmera e para os testes), o QR Code é montado com a prova escolhida na lista e um
/// aluno cadastrado. Nos dois casos ele passa pela mesma validação ([QrCodeProva.ler]).
class QrCodeScannerViewModel extends ChangeNotifier {
  QrCodeScannerViewModel(
    ProvaRepository provaRepository,
    AlunoRepository alunoRepository, {
    int? provaIdInicial,
    bool usarCamera = true,
  }) : _uiState = QrCodeScannerUiState(
         provaEscolhidaId: provaIdInicial,
         provaId: provaIdInicial,
         usarCamera: usarCamera,
       ) {
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
              erro: () =>
                  mensagemDoErro(erro) ?? 'Não foi possível carregar as provas e os alunos.',
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
        titulosProvas: {for (final p in provas) p.prova.id: p.prova.titulo},
        alunos: alunos,
        alunoSelecionadoId: () =>
            selecionadoAindaExiste ? estado.alunoSelecionadoId : alunos.firstOrNull?.id,
        erro: () => null,
      );
    });
  }

  /// Recebe o texto de um QR Code detectado pela câmera.
  ///
  /// Depois de um QR Code válido, as próximas detecções são ignoradas até o professor pedir para
  /// ler de novo; assim a câmera, que continua vendo a folha, não troca a leitura sozinha.
  void lerQrCodeDaCamera(String? texto) {
    final conteudo = texto?.trim() ?? '';
    if (conteudo.isEmpty || !_uiState.usarCamera) return;
    if (_uiState.textoCamera != null && _uiState.leitura is Valido) return;
    if (conteudo == _uiState.textoCamera) return;
    _atualizar((s) => s.copyWith(textoCamera: () => conteudo));
  }

  /// Descarta o QR Code lido para apontar a câmera para outra folha.
  void lerDeNovo() => _atualizar((s) => s.copyWith(textoCamera: () => null));

  /// Troca entre a câmera e o modo simulação.
  void alternarCamera(bool usarCamera) =>
      _atualizar((s) => s.copyWith(usarCamera: usarCamera, textoCamera: () => null));

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
