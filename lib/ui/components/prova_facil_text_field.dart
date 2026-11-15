import 'package:flutter/material.dart';

class ProvaFacilTextField extends StatelessWidget {
  const ProvaFacilTextField({
    super.key,
    this.controller,
    this.onChanged,
    required this.label,
    this.keyboardType,
    this.singleLine = false,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String label;
  final TextInputType? keyboardType;
  final bool singleLine;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final forma = BorderRadius.circular(8);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: singleLine ? 1 : null,
      decoration: InputDecoration(
        labelText: label,
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
