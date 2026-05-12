import 'package:flutter/material.dart';
import '../../modelos/pedido_helado_modelo.dart';
import '../moleculas/bloque_nota_venta.dart';
import '../atomos/boton_personalizado.dart';
import '../../temas/tema_heladeria.dart';

class VistaNotaVentaHelado extends StatelessWidget {
  const VistaNotaVentaHelado({super.key});

  @override
  Widget build(BuildContext context) {
    final pedido =
        ModalRoute.of(context)!.settings.arguments as PedidoHeladoModelo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota de Venta'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [TemaHeladeria.fondoClaro, TemaHeladeria.celeste],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BloqueNotaVenta(pedido: pedido),
              const SizedBox(height: 24),
              BotonPersonalizado(
                texto: 'Nuevo Pedido',
                icono: Icons.add_circle_outline,
                alPresionar: () => Navigator.pop(context),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
