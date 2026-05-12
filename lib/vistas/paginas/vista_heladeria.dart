import 'package:flutter/material.dart';
import '../moleculas/formulario_pedido_helado.dart';
import '../../controladores/helado_controlador.dart';

class VistaHeladeria extends StatefulWidget {
  const VistaHeladeria({super.key});

  @override
  State<VistaHeladeria> createState() => _VistaHeladeriaEstado();
}

class _VistaHeladeriaEstado extends State<VistaHeladeria> {
  final clienteCtrl = TextEditingController();
  final bolasCtrl = TextEditingController();
  String? presentacionSeleccionada;
  String? toppingSeleccionado;

  final controlador = HeladoControlador();

  @override
  void dispose() {
    clienteCtrl.dispose();
    bolasCtrl.dispose();
    super.dispose();
  }

  void _generarNota() {
    final error = controlador.validar(
      nombreCliente: clienteCtrl.text,
      presentacion: presentacionSeleccionada ?? '',
      numeroBolasTexto: bolasCtrl.text,
      topping: toppingSeleccionado ?? '',
    );

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    final pedido = controlador.calcular(
      nombreCliente: clienteCtrl.text,
      presentacion: presentacionSeleccionada!,
      numeroBolas: int.parse(bolasCtrl.text.trim()),
      topping: toppingSeleccionado!,
    );

    Navigator.pushNamed(context, '/notaVentaHelado', arguments: pedido);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Heladería Eduardo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: FormularioPedidoHelado(
          clienteCtrl: clienteCtrl,
          bolasCtrl: bolasCtrl,
          presentacionSeleccionada: presentacionSeleccionada,
          toppingSeleccionado: toppingSeleccionado,
          alCambiarPresentacion: (val) =>
              setState(() => presentacionSeleccionada = val),
          alCambiarTopping: (val) =>
              setState(() => toppingSeleccionado = val),
          alEnviar: _generarNota,
        ),
      ),
    );
  }
}
