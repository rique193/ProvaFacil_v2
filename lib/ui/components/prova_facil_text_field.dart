import 'package:flutter/material.dart';

/// Campo de texto do app. Use [controller] ou [value]: com [value], o texto acompanha o estado
/// da tela (como o `value` do Compose), e [onChanged] informa o que o usuário digitou.
class ProvaFacilTextField extends StatefulWidget {
  const ProvaFacilTextField({
    super.key,
    this.controller,
    this.value,
    this.onChanged,
    required this.label,
    this.keyboardType,
    this.singleLine = false,
    this.enabled = true,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? value;
  final ValueChanged<String>? onChanged;
  final String label;
  final TextInputType? keyboardType;
  final bool singleLine;
  final bool enabled;

  /// Esconde o texto digitado (senha). O campo fica com uma linha só.
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  State<ProvaFacilTextField> createState() => _ProvaFacilTextFieldState();
}

class _ProvaFacilTextFieldState extends State<ProvaFacilTextField> {
  TextEditingController? _interno;

  TextEditingController get _controller =>
      widget.controller ?? (_interno ??= TextEditingController(text: widget.value));

  @override
  void didUpdateWidget(ProvaFacilTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final valor = widget.value;
    if (widget.controller == null && valor != null && valor != _controller.text) {
      _controller.value = TextEditingValue(
        text: valor,
        selection: TextSelection.collapsed(offset: valor.length),
      );
    }
  }

  @override
  void dispose() {
    _interno?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final forma = BorderRadius.circular(8);
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      maxLines: widget.singleLine || widget.obscureText ? 1 : null,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: widget.suffixIcon,
        border: OutlineInputBorder(borderRadius: forma),
        enabledBorder: OutlineInputBorder(
          borderRadius: forma,
          borderSide: BorderSide(color: cores.outline.withValues(alpha: 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: forma,
          borderSide: BorderSide(color: cores.primary, width: 2),
        ),
      ),
    );
  }
}
