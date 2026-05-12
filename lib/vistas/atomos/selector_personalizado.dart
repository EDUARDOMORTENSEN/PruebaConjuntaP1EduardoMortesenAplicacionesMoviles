import 'package:flutter/material.dart';
import '../../temas/tema_heladeria.dart';

class SelectorPersonalizado extends StatelessWidget {
  final String etiqueta;
  final IconData icono;
  final String? valorSeleccionado;
  final List<String> opciones;
  final ValueChanged<String?> alCambiar;

  const SelectorPersonalizado({
    super.key,
    required this.etiqueta,
    required this.icono,
    required this.valorSeleccionado,
    required this.opciones,
    required this.alCambiar,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: valorSeleccionado,
      hint: Text(etiqueta),
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: Icon(icono),
      ),
      dropdownColor: TemaHeladeria.blanco,
      borderRadius: BorderRadius.circular(12),
      items: opciones
          .map((op) => DropdownMenuItem(value: op, child: Text(op)))
          .toList(),
      onChanged: alCambiar,
    );
  }
}
