import 'package:flutter/material.dart';

class CoresCorrecao {
  CoresCorrecao(BuildContext context) : _cores = Theme.of(context).colorScheme;
  final ColorScheme _cores;
  bool get _temaEscuro => _cores.surface.computeLuminance() < 0.5;
  Color get acerto =>
      _temaEscuro ? const Color(0xFF81C995) : const Color(0xFF1E8E3E);
  Color get onAcerto => _temaEscuro ? const Color(0xFF00391A) : Colors.white;
  Color get erro => _cores.error;
  Color get onErro => _cores.onError;
  Color get neutro => _cores.surfaceContainerHighest;
  Color get onNeutro => _cores.onSurfaceVariant;
}

class LetraAlternativa extends StatelessWidget {
  const LetraAlternativa({
    super.key,
    required this.letra,
    required this.fundo,
    required this.corTexto,
    this.borda,
    this.tamanho = 36,
    this.onClick,
  });
  final String letra;
  final Color fundo;
  final Color corTexto;
  final Color? borda;
  final double tamanho;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) => Semantics(
    label: letra,
    button: onClick != null,
    child: SizedBox(
      width: tamanho,
      height: tamanho,
      child: Material(
        color: fundo,
        shape: CircleBorder(
          side: borda == null
              ? BorderSide.none
              : BorderSide(color: borda!, width: 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onClick,
          customBorder: const CircleBorder(),
          child: Center(
            child: Text(
              letra,
              style: TextStyle(color: corTexto, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ),
  );
}
