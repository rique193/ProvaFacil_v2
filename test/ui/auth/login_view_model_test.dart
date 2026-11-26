import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/repository/auth_repository.dart';
import 'package:provafacil/ui/auth/login/login_view_model.dart';

import '../../ajudantes/autenticacao_falsa.dart';

void main() {
  late ServicoAutenticacaoFalso servico;
  late AuthRepository auth;
  late LoginViewModel viewModel;

  setUp(() {
    servico = ServicoAutenticacaoFalso()
      ..adicionarConta(email: 'ana@escola.com', senha: 'segredo1', nome: 'Ana');
    auth = AuthRepository(servico);
    viewModel = LoginViewModel(auth);
  });

  tearDown(() {
    viewModel.dispose();
    auth.dispose();
  });

  void preencher({String email = 'ana@escola.com', String senha = 'segredo1'}) {
    viewModel
      ..atualizarEmail(email)
      ..atualizarSenha(senha);
  }

  test('entra com a conta criada', () async {
    preencher(email: ' ana@escola.com ');

    await viewModel.entrar();

    expect(auth.logado, isTrue);
    expect(auth.usuario?.identificacao, 'Ana');
    expect(viewModel.uiState.carregando, isFalse);
    expect(viewModel.uiState.erro, isNull);
  });

  test('campos vazios avisam sem chamar o Firebase', () async {
    await viewModel.entrar();
    expect(viewModel.uiState.erro, 'Informe o e-mail.');

    viewModel.atualizarEmail('ana@escola.com');
    await viewModel.entrar();
    expect(viewModel.uiState.erro, 'Informe a senha.');

    expect(servico.chamadasEntrar, 0);
  });

  test('senha errada mostra a mensagem e continua deslogado', () async {
    preencher(senha: 'errada');

    await viewModel.entrar();

    expect(viewModel.uiState.erro, 'E-mail ou senha incorretos.');
    expect(viewModel.uiState.carregando, isFalse);
    expect(auth.logado, isFalse);
  });

  test('sem internet mostra a mensagem própria', () async {
    preencher();
    servico.proximoErro = 'network-request-failed';

    await viewModel.entrar();

    expect(viewModel.uiState.erro, 'Sem conexão com a internet. Verifique e tente de novo.');
  });

  test('fica carregando enquanto o Firebase responde e não envia duas vezes', () async {
    preencher();
    servico.pausa = Completer<void>();

    final entrando = viewModel.entrar();
    expect(viewModel.uiState.carregando, isTrue);
    await viewModel.entrar();
    expect(servico.chamadasEntrar, 1);

    servico.pausa!.complete();
    await entrando;
    expect(viewModel.uiState.carregando, isFalse);
    expect(auth.logado, isTrue);
  });

  test('digitar de novo apaga o erro', () async {
    await viewModel.entrar();
    expect(viewModel.uiState.erro, isNotNull);

    viewModel.atualizarEmail('a');
    expect(viewModel.uiState.erro, isNull);
  });

  test('mostra e oculta a senha', () {
    expect(viewModel.uiState.senhaVisivel, isFalse);
    viewModel.alternarSenhaVisivel();
    expect(viewModel.uiState.senhaVisivel, isTrue);
    viewModel.alternarSenhaVisivel();
    expect(viewModel.uiState.senhaVisivel, isFalse);
  });

  test('a resposta que chega depois de sair da tela é ignorada', () async {
    preencher();
    servico.pausa = Completer<void>();
    final entrando = viewModel.entrar();

    final descartado = LoginViewModel(auth);
    viewModel.dispose();
    viewModel = descartado; // o tearDown descarta este
    servico.pausa!.complete();

    await expectLater(entrando, completes);
    expect(auth.logado, isTrue);
  });
}
