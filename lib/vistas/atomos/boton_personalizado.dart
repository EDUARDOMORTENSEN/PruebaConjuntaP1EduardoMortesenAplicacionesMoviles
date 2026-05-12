import 'package:flutter/material.dart';

class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback alPresionar;
  final IconData? icono;

  const BotonPersonalizado({
    super.key,
    required this.texto,
    required this.alPresionar,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: alPresionar,
        icon: icono != null ? Icon(icono, size: 20) : const SizedBox.shrink(),
        label: Text(texto),
      ),
    );
  }
}
