class PedidoHeladoModelo {
  final String nombreCliente;
  final String presentacion; // cono, vaso, tarrina
  final int numeroBolas;
  final String topping; // chocolate, chispas, ninguno
  final double subtotal;
  final double iva;
  final double total;

  PedidoHeladoModelo({
    required this.nombreCliente,
    required this.presentacion,
    required this.numeroBolas,
    required this.topping,
    required this.subtotal,
    required this.iva,
    required this.total,
  });
}
