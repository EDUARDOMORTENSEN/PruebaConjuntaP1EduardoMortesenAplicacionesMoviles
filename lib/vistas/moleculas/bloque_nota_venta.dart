import 'package:flutter/material.dart';
import '../atomos/etiqueta_personalizada.dart';
import '../../modelos/pedido_helado_modelo.dart';
import '../../temas/tema_heladeria.dart';
import '../../controladores/helado_controlador.dart';

class BloqueNotaVenta extends StatelessWidget {
  final PedidoHeladoModelo pedido;

  const BloqueNotaVenta({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    final precioBase = HeladoControlador.preciosPresentacion[pedido.presentacion] ?? 0;
    final valorBolas = pedido.numeroBolas * HeladoControlador.precioPorBola;
    final valorTopping = HeladoControlador.preciosToppings[pedido.topping] ?? 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado nota
            Center(
              child: Column(
                children: [
                  const Icon(Icons.icecream, size: 48, color: TemaHeladeria.rosadoOscuro),
                  const SizedBox(height: 4),
                  EtiquetaPersonalizada(
                    texto: ' NOTA DE VENTA ',
                    estilo: Theme.of(context).textTheme.titleLarge,
                    alineacion: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: TemaHeladeria.rosado, thickness: 1.5),
            const SizedBox(height: 12),

            // Datos del cliente
            _filaDato(context, 'Cliente:', pedido.nombreCliente,
                icono: Icons.person),
            const SizedBox(height: 10),

            // Detalles del pedido
            EtiquetaPersonalizada(
              texto: 'Detalle del pedido:',
              estilo: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            _filaDetalle(
              context,
              'Presentación (${pedido.presentacion})',
              precioBase,
            ),
            _filaDetalle(
              context,
              '${pedido.numeroBolas} bola(s) × \$${HeladoControlador.precioPorBola.toStringAsFixed(2)}',
              valorBolas,
            ),
            _filaDetalle(
              context,
              'Topping: ${pedido.topping}',
              valorTopping,
            ),
            const SizedBox(height: 8),
            const Divider(color: TemaHeladeria.celeste, thickness: 1),
            const SizedBox(height: 8),

            // Subtotal, IVA, Total
            _filaMonto(context, 'Subtotal:', pedido.subtotal, bold: false),
            _filaMonto(context, 'IVA (15%):', pedido.iva, bold: false),
            const Divider(color: TemaHeladeria.rosado, thickness: 2),
            _filaMonto(context, 'TOTAL A PAGAR:', pedido.total,
                bold: true, grande: true),
          ],
        ),
      ),
    );
  }

  Widget _filaDato(BuildContext context, String label, String valor,
      {IconData? icono}) {
    return Row(
      children: [
        if (icono != null) ...[
          Icon(icono, size: 18, color: TemaHeladeria.rosadoOscuro),
          const SizedBox(width: 6),
        ],
        EtiquetaPersonalizada(
          texto: label,
          estilo: const TextStyle(
              fontWeight: FontWeight.w600, color: TemaHeladeria.rosadoOscuro),
        ),
        const SizedBox(width: 6),
        EtiquetaPersonalizada(texto: valor),
      ],
    );
  }

  Widget _filaDetalle(BuildContext context, String descripcion, double valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: EtiquetaPersonalizada(
              texto: '• $descripcion',
              estilo: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          EtiquetaPersonalizada(
            texto: '\$${valor.toStringAsFixed(2)}',
            estilo: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _filaMonto(BuildContext context, String label, double valor,
      {bool bold = false, bool grande = false}) {
    final estilo = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: grande ? 18 : 15,
      color: grande ? TemaHeladeria.rosadoOscuro : null,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EtiquetaPersonalizada(texto: label, estilo: estilo),
          EtiquetaPersonalizada(
            texto: '\$${valor.toStringAsFixed(2)}',
            estilo: estilo,
          ),
        ],
      ),
    );
  }
}
