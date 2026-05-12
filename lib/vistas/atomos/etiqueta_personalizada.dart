import 'package:flutter/material.dart';

class EtiquetaPersonalizada extends StatelessWidget {
  final String texto;
  final TextStyle? estilo;
  final TextAlign alineacion;

  const EtiquetaPersonalizada({
    super.key,
    required this.texto,
    this.estilo,
    this.alineacion = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: estilo ?? Theme.of(context).textTheme.bodyMedium,
      textAlign: alineacion,
    );
  }
}
