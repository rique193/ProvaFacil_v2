import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/auth/regras_login.dart';
import '../../components/prova_facil_text_field.dart';
import '../campo_senha.dart';
import 'cadastro_view_model.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key, required this.onVoltar});

  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CadastroViewModel>();
    final uiState = viewModel.uiState;
    final tema = Theme.of(context);
    final carregando = uiState.carregando;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova conta', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: tema.scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: carregando ? null : onVoltar,
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cadastre-se como professor para usar o ProvaFácil.',
                    style: tema.textTheme.bodyLarge?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ProvaFacilTextField(
                    value: uiState.nome,
                    onChanged: viewModel.atualizarNome,
                    label: 'Nome',
                    keyboardType: TextInputType.name,
                    singleLine: true,
                    enabled: !carregando,
                  ),
                  const SizedBox(height: 16),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 4),
                    child: Text(
                      'Mínimo de $tamanhoMinimoSenha caracteres.',
                      style: tema.textTheme.bodySmall?.copyWith(
                        color: tema.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CampoSenha(
                    value: uiState.confirmacaoSenha,
                    onChanged: viewModel.atualizarConfirmacaoSenha,
                    label: 'Confirmar senha',
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
                    texto: 'Criar conta',
                    carregando: carregando,
                    onPressed: viewModel.criarConta,
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: carregando ? null : onVoltar,
                      child: const Text('Já tenho conta'),
                    ),
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
