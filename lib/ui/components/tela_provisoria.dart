import 'package:flutter/material.dart';

/// Ocupa o lugar de uma tela que ainda não foi portada. Cada membro troca a sua.
class TelaProvisoria extends StatelessWidget {
  const TelaProvisoria({super.key, required this.nome, this.parametros = const {}});

  final String nome;
  final Map<String, Object?> parametros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nome)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(nome, style: Theme.of(context).textTheme.headlineSmall),
            for (final MapEntry(:key, :value) in parametros.entries) Text('$key: $value'),
          ],
        ),
      ),
    );
  }
}
