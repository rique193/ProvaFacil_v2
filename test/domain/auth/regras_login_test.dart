import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/domain/auth/regras_login.dart';

String? cadastro({
  String nome = 'Ana Lima',
  String email = 'ana@escola.com',
  String senha = 'segredo1',
  String? confirmacao,
}) => validarCadastroProfessor(
  nome: nome,
  email: email,
  senha: senha,
  confirmacaoSenha: confirmacao ?? senha,
);

void main() {
  group('validarCadastroProfessor', () {
    test('formulário completo passa', () {
      expect(cadastro(), isNull);
      expect(cadastro(senha: '123456'), isNull);
    });

    test('nome vazio', () {
      expect(cadastro(nome: ''), 'Informe seu nome.');
      expect(cadastro(nome: '   '), 'Informe seu nome.');
    });

    test('e-mail vazio', () {
      expect(cadastro(email: ' '), 'Informe o e-mail.');
    });

    test('e-mail sem @ ou sem algo antes ou depois dele', () {
      for (final email in ['anaescola.com', '@escola.com', 'ana@']) {
        expect(cadastro(email: email), 'Informe um e-mail válido.', reason: email);
      }
    });

    test('senha vazia', () {
      expect(cadastro(senha: ''), 'Informe a senha.');
    });

    test('senha com menos de 6 caracteres', () {
      expect(cadastro(senha: '12345'), 'A senha precisa ter pelo menos 6 caracteres.');
    });

    test('confirmação vazia', () {
      expect(cadastro(confirmacao: ''), 'Confirme a senha.');
    });

    test('senhas diferentes', () {
      expect(cadastro(senha: 'segredo1', confirmacao: 'segredo2'), 'As senhas não conferem.');
    });

    test('mostra o primeiro problema na ordem dos campos', () {
      expect(cadastro(nome: '', email: 'x', senha: '1'), 'Informe seu nome.');
      expect(cadastro(email: 'x', senha: '1'), 'Informe um e-mail válido.');
    });
  });

  group('validarLogin', () {
    test('com e-mail e senha passa', () {
      expect(validarLogin(email: 'ana@escola.com', senha: 'x'), isNull);
    });

    test('pede o e-mail e a senha', () {
      expect(validarLogin(email: '  ', senha: 'x'), 'Informe o e-mail.');
      expect(validarLogin(email: 'ana@escola.com', senha: ''), 'Informe a senha.');
    });
  });
}
