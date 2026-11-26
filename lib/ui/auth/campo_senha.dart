import 'package:flutter/material.dart';

import '../components/prova_facil_text_field.dart';

/// Campo de senha com o botão de mostrar/ocultar o que foi digitado.
class CampoSenha extends StatelessWidget {
  const CampoSenha({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.visivel,
    required this.onAlternarVisivel,
    this.enabled = true,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final String label;
  final bool visivel;
  final VoidCallback onAlternarVisivel;
  final bool enabled;

  @override
  Widget build(BuildContext context) => ProvaFacilTextField(
    value: value,
    onChanged: onChanged,
    label: label,
    keyboardType: TextInputType.visiblePassword,
    obscureText: !visivel,
    enabled: enabled,
    suffixIcon: IconButton(
      onPressed: onAlternarVisivel,
      tooltip: visivel ? 'Ocultar senha' : 'Mostrar senha',
      icon: Icon(visivel ? Icons.visibility_off : Icons.visibility),
    ),
  );
}

/// Botão principal das telas de login e cadastro, com o indicador enquanto o Firebase responde.
class BotaoAutenticacao extends StatelessWidget {
  const BotaoAutenticacao({
    super.key,
    required this.texto,
    required this.carregando,
    required this.onPressed,
  });

  final String texto;
  final bool carregando;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: carregando ? null : onPressed,
    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
    child: carregando
        ? const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2, semanticsLabel: 'Carregando'),
          )
        : Text(texto),
  );
}
