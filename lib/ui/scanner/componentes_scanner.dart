import 'package:flutter/material.dart';

/// Cores das telas do scanner, iguais às do app Kotlin.
const corFundoCamera = Color(0xFF121212);
const corSucesso = Color(0xFF4CAF50);
const corVerde = Color(0xFF2E7D32);
const corAviso = Color(0xFFF9A825);
const corErroScanner = Color(0xFFD32F2F);
const corAzul = Color(0xFF1976D2);
const corBotao = Color(0xFF3B82F6);

/// Cabeçalho escuro com o botão de voltar, imitando a câmera ligada.
class CabecalhoScanner extends StatelessWidget {
  const CabecalhoScanner({super.key, required this.titulo, this.subtitulo, required this.onVoltar});

  final String titulo;
  final String? subtitulo;
  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            onPressed: onVoltar,
            tooltip: 'Voltar',
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (subtitulo != null)
                  Text(
                    subtitulo!,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Linha "título: valor" alinhada, usada nos cartões de resultado da leitura.
class LinhaDado extends StatelessWidget {
  const LinhaDado({super.key, required this.titulo, required this.valor});

  final String titulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(titulo, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          ),
          Expanded(
            flex: 7,
            child: Text(
              valor,
              style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

/// Cartão branco de cantos arredondados que aparece por cima do fundo escuro.
class CartaoScanner extends StatelessWidget {
  const CartaoScanner({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(padding: const EdgeInsets.all(20), child: child),
    );
  }
}

/// Botão azul principal das telas do scanner.
class BotaoScanner extends StatelessWidget {
  const BotaoScanner({super.key, required this.texto, required this.onPressed, this.icone});

  final String texto;
  final VoidCallback? onPressed;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: corBotao,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Text(texto, style: const TextStyle(fontSize: 16))),
            if (icone != null) ...[const SizedBox(width: 8), Icon(icone, size: 18)],
          ],
        ),
      ),
    );
  }
}
