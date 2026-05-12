import 'package:flutter/material.dart';
import 'temas/tema_heladeria.dart';
import 'vistas/paginas/vista_heladeria.dart';
import 'vistas/paginas/vista_nota_venta_helado.dart';

void main() {
  runApp(const AplicacionBase());
}

class AplicacionBase extends StatelessWidget {
  const AplicacionBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heladería Eduardo',
      theme: TemaHeladeria.claro,
      initialRoute: '/heladeria',
      routes: {
        '/heladeria': (context) => const VistaHeladeria(),
        '/notaVentaHelado': (context) => const VistaNotaVentaHelado(),
      },
    );
  }
}
