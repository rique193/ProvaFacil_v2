import 'package:flutter/material.dart';

class ProvaFacilCard extends StatelessWidget {
  const ProvaFacilCard({super.key, this.onTap, required this.child});

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final borda = BorderRadius.circular(12);
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: borda),
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: onTap == null ? child : InkWell(onTap: onTap, borderRadius: borda, child: child),
      ),
    );
  }
}
