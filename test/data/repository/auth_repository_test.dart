import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/auth/servico_autenticacao.dart';
import 'package:provafacil/data/repository/auth_repository.dart';

import '../../ajudantes/autenticacao_falsa.dart';

void main() {
  group('mensagemErroAuth', () {
    test('e-mail inválido', () {
      expect(mensagemErroAuth('invalid-email'), 'E-mail inválido.');
    });

    test('e-mail já cadastrado', () {
      expect(mensagemErroAuth('email-already-in-use'), 'Este e-mail já está cadastrado.');
    });

    test('senha fraca', () {
      expect(mensagemErroAuth('weak-password'), 'Senha fraca: use pelo menos 6 caracteres.');
    });

    test('e-mail ou senha incorretos para todos os códigos de credencial', () {
      for (final codigo in [
        'invalid-credential',
        'wrong-password',
        'user-not-found',
        'INVALID_LOGIN_CREDENTIALS',
      ]) {
        expect(mensagemErroAuth(codigo), 'E-mail ou senha incorretos.', reason: codigo);
      }
    });

    test('sem internet', () {
      expect(
        mensagemErroAuth('network-request-failed'),
        'Sem conexão com a internet. Verifique e tente de novo.',
      );
    });

    test('código desconhecido cai na mensagem genérica', () {
      expect(mensagemErroAuth('internal-error'), 'Algo deu errado. Tente de novo em instantes.');
      expect(mensagemErroAuth(''), 'Algo deu errado. Tente de novo em instantes.');
    });
  });

  group('mensagemDaFalhaDeLogin', () {
    test('traduz o ErroAutenticacao pelo código', () {
      expect(
        mensagemDaFalhaDeLogin(const ErroAutenticacao('wrong-password')),
        'E-mail ou senha incorretos.',
      );
    });

    test('usa a mensagem de validação e, sem ela, a genérica', () {
      expect(mensagemDaFalhaDeLogin(ArgumentError('Falhou.')), 'Falhou.');
      expect(mensagemDaFalhaDeLogin(Exception()), 'Algo deu errado. Tente de novo em instantes.');
    });
  });

  group('UsuarioLogado.identificacao', () {
    test('mostra o nome quando existe', () {
      expect(professoraLogada.identificacao, 'Ana Lima');
    });

    test('sem nome, mostra o e-mail', () {
      expect(const UsuarioLogado(uid: 'x', nome: '  ', email: 'a@b.com').identificacao, 'a@b.com');
      expect(const UsuarioLogado(uid: 'x', email: 'a@b.com').identificacao, 'a@b.com');
    });
  });

  group('AuthRepository', () {
    late ServicoAutenticacaoFalso servico;
    late AuthRepository repository;
    late int avisos;

    setUp(() {
      avisos = 0;
      servico = ServicoAutenticacaoFalso();
      repository = AuthRepository(servico)..addListener(() => avisos++);
    });

    tearDown(() => repository.dispose());

    test('começa com o usuário que o serviço já tem', () {
      final logado = AuthRepository(ServicoAutenticacaoFalso(logado: professoraLogada));
      addTearDown(logado.dispose);
      expect(logado.logado, isTrue);
      expect(logado.usuario, professoraLogada);
      expect(repository.logado, isFalse);
    });

    test('cadastrar cria a conta, entra e guarda o nome', () async {
      await repository.cadastrar(nome: ' Bruno ', email: ' bruno@escola.com ', senha: '123456');

      expect(repository.logado, isTrue);
      expect(repository.usuario?.nome, 'Bruno');
      expect(repository.usuario?.email, 'bruno@escola.com');
      expect(avisos, 1);
    });

    test('entrar com a conta criada e sair', () async {
      servico.adicionarConta(email: 'ana@escola.com', senha: 'segredo1', nome: 'Ana');

      await repository.entrar(email: 'ana@escola.com', senha: 'segredo1');
      expect(repository.usuario?.identificacao, 'Ana');

      await repository.sair();
      expect(repository.logado, isFalse);
      expect(avisos, 2);
    });

    test('senha errada lança ErroAutenticacao e continua deslogado', () async {
      servico.adicionarConta(email: 'ana@escola.com', senha: 'segredo1');

      await expectLater(
        repository.entrar(email: 'ana@escola.com', senha: 'errada'),
        throwsA(isA<ErroAutenticacao>().having((e) => e.codigo, 'codigo', 'invalid-credential')),
      );
      expect(repository.logado, isFalse);
      expect(avisos, 0);
    });

    test('acompanha as mudanças que vêm do serviço', () async {
      servico.adicionarConta(email: 'ana@escola.com', senha: 'segredo1');
      await servico.entrar(email: 'ana@escola.com', senha: 'segredo1');
      expect(repository.logado, isTrue);

      await servico.sair();
      expect(repository.logado, isFalse);
      expect(avisos, 2);
    });
  });
}
