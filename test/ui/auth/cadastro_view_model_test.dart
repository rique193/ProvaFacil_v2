import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/repository/auth_repository.dart';
import 'package:provafacil/ui/auth/cadastro/cadastro_view_model.dart';

import '../../ajudantes/autenticacao_falsa.dart';

void main() {
  late ServicoAutenticacaoFalso servico;
  late AuthRepository auth;
  late CadastroViewModel viewModel;

  setUp(() {
    servico = ServicoAutenticacaoFalso();
    auth = AuthRepository(servico);
    viewModel = CadastroViewModel(auth);
  });

  tearDown(() {
    viewModel.dispose();
    auth.dispose();
  });

  void preencher({
    String nome = 'Bruno Costa',
    String email = 'bruno@escola.com',
    String senha = 'segredo1',
    String? confirmacao,
  }) {
    viewModel
      ..atualizarNome(nome)
      ..atualizarEmail(email)
      ..atualizarSenha(senha)
      ..atualizarConfirmacaoSenha(confirmacao ?? senha);
  }

  test('cria a conta, já entra e guarda o nome', () async {
    preencher(nome: ' Bruno Costa ');

    await viewModel.criarConta();

    expect(auth.logado, isTrue);
    expect(auth.usuario?.nome, 'Bruno Costa');
    expect(auth.usuario?.email, 'bruno@escola.com');
    expect(viewModel.uiState.carregando, isFalse);
    expect(viewModel.uiState.erro, isNull);
  });

  test('a conta criada serve para entrar depois', () async {
    preencher();
    await viewModel.criarConta();
    await auth.sair();

    await auth.entrar(email: 'bruno@escola.com', senha: 'segredo1');
    expect(auth.usuario?.identificacao, 'Bruno Costa');
  });

  group('valida antes de chamar o Firebase', () {
    Future<void> criarCom(String mensagem, void Function() preencherCampos) async {
      preencherCampos();
      await viewModel.criarConta();
      expect(viewModel.uiState.erro, mensagem);
      expect(servico.chamadasCadastrar, 0);
      expect(auth.logado, isFalse);
    }

    test('campos vazios', () => criarCom('Informe seu nome.', () {}));

    test('e-mail sem @', () => criarCom('Informe um e-mail válido.', () => preencher(email: 'bruno')));

    test(
      'senha com menos de 6 caracteres',
      () => criarCom('A senha precisa ter pelo menos 6 caracteres.', () => preencher(senha: '12345')),
    );

    test(
      'senhas diferentes',
      () => criarCom('As senhas não conferem.', () => preencher(confirmacao: 'outra123')),
    );
  });

  test('e-mail já cadastrado mostra a mensagem do Firebase', () async {
    servico.adicionarConta(email: 'bruno@escola.com', senha: 'qualquer');
    preencher();

    await viewModel.criarConta();

    expect(viewModel.uiState.erro, 'Este e-mail já está cadastrado.');
    expect(viewModel.uiState.carregando, isFalse);
    expect(auth.logado, isFalse);
  });

  test('e-mail que o Firebase recusa', () async {
    preencher(email: 'bruno@escola');
    servico.proximoErro = 'invalid-email';

    await viewModel.criarConta();

    expect(viewModel.uiState.erro, 'E-mail inválido.');
  });

  test('fica carregando enquanto o Firebase responde', () async {
    preencher();
    servico.pausa = Completer<void>();

    final criando = viewModel.criarConta();
    expect(viewModel.uiState.carregando, isTrue);
    await viewModel.criarConta();
    expect(servico.chamadasCadastrar, 1);

    servico.pausa!.complete();
    await criando;
    expect(viewModel.uiState.carregando, isFalse);
  });

  test('corrigir um campo apaga o erro', () async {
    preencher(confirmacao: 'outra123');
    await viewModel.criarConta();
    expect(viewModel.uiState.erro, isNotNull);

    viewModel.atualizarConfirmacaoSenha('segredo1');
    expect(viewModel.uiState.erro, isNull);
  });
}
