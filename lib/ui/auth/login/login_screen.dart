import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_text_field.dart';
import '../campo_senha.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.onCriarConta});

  final VoidCallback onCriarConta;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    final uiState = viewModel.uiState;
    final tema = Theme.of(context);
    final carregando = uiState.carregando;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.school, size: 64, color: tema.colorScheme.primary),
                  const SizedBox(height: 16),
                  Text(
                    'ProvaFácil',
                    textAlign: TextAlign.center,
                    style: tema.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Entre com sua conta de professor',
                    textAlign: TextAlign.center,
                    style: tema.textTheme.bodyLarge?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ProvaFacilTextField(
                    value: uiState.email,
                    onChanged: viewModel.atualizarEmail,
                    label: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    singleLine: true,
                    enabled: !carregando,
                  ),
                  const SizedBox(height: 16),
                  CampoSenha(
                    value: uiState.senha,
                    onChanged: viewModel.atualizarSenha,
                    label: 'Senha',
                    visivel: uiState.senhaVisivel,
                    onAlternarVisivel: viewModel.alternarSenhaVisivel,
                    enabled: !carregando,
                  ),
                  if (uiState.erro case final mensagem?) ...[
                    const SizedBox(height: 16),
                    Text(mensagem, style: TextStyle(color: tema.colorScheme.error)),
                  ],
                  const SizedBox(height: 24),
                  BotaoAutenticacao(
                    texto: 'Entrar',
                    carregando: carregando,
                    onPressed: viewModel.entrar,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ainda não tem conta?'),
                      TextButton(
                        onPressed: carregando ? null : onCriarConta,
                        child: const Text('Criar conta'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
