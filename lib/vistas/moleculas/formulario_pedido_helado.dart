import 'package:flutter/material.dart';
import '../atomos/campo_texto_personalizado.dart';
import '../atomos/selector_personalizado.dart';
import '../atomos/boton_personalizado.dart';
import '../atomos/etiqueta_personalizada.dart';
import '../../controladores/helado_controlador.dart';
import '../../temas/tema_heladeria.dart';

class FormularioPedidoHelado extends StatelessWidget {
  final TextEditingController clienteCtrl;
  final TextEditingController bolasCtrl;
  final String? presentacionSeleccionada;
  final String? toppingSeleccionado;
  final ValueChanged<String?> alCambiarPresentacion;
  final ValueChanged<String?> alCambiarTopping;
  final VoidCallback alEnviar;

  const FormularioPedidoHelado({
    super.key,
    required this.clienteCtrl,
    required this.bolasCtrl,
    required this.presentacionSeleccionada,
    required this.toppingSeleccionado,
    required this.alCambiarPresentacion,
    required this.alCambiarTopping,
    required this.alEnviar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Encabezado
        Center(
          child: Column(
            children: [
              const Icon(Icons.icecream, size: 72, color: TemaHeladeria.rosadoOscuro),
              const SizedBox(height: 6),
              EtiquetaPersonalizada(
                texto: 'Haz tu pedido',
                estilo: Theme.of(context).textTheme.titleLarge,
                alineacion: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Nombre del cliente
        CampoTextoPersonalizado(
          etiqueta: 'Nombre del cliente',
          icono: Icons.person,
          controlador: clienteCtrl,
        ),
        const SizedBox(height: 14),

        // Presentación
        SelectorPersonalizado(
          etiqueta: 'Presentación',
          icono: Icons.set_meal,
          valorSeleccionado: presentacionSeleccionada,
          opciones: HeladoControlador.presentaciones,
          alCambiar: alCambiarPresentacion,
        ),
        const SizedBox(height: 14),

        // Número de bolas
        CampoTextoPersonalizado(
          etiqueta: 'Número de bolas',
          icono: Icons.circle,
          controlador: bolasCtrl,
          tipaTeclado: TextInputType.number,
        ),
        const SizedBox(height: 14),

        // Topping
        SelectorPersonalizado(
          etiqueta: 'Topping',
          icono: Icons.auto_awesome,
          valorSeleccionado: toppingSeleccionado,
          opciones: HeladoControlador.toppings,
          alCambiar: alCambiarTopping,
        ),
        const SizedBox(height: 28),

        // Botón
        BotonPersonalizado(
          texto: 'Generar Nota de Venta',
          icono: Icons.receipt_long,
          alPresionar: alEnviar,
        ),
      ],
    );
  }
}
