import '../modelos/pedido_helado_modelo.dart';

class HeladoControlador {
  // Precios base por presentación
  static const Map<String, double> _preciosPresentacion = {
    'Cono': 1.00,
    'Vaso': 1.25,
    'Tarrina': 1.75,
  };

  // Precio adicional por bola
  static const double _precioPorBola = 0.75;

  // Precios de toppings
  static const Map<String, double> _preciosToppings = {
    'Chocolate': 0.50,
    'Chispas': 0.40,
    'Ninguno': 0.00,
  };

  static const double _tasaIva = 0.15;

  /// Valida los campos del formulario.
  /// Retorna un mensaje de error o null si todo es válido.
  String? validar({
    required String nombreCliente,
    required String presentacion,
    required String numeroBolasTexto,
    required String topping,
  }) {
    if (nombreCliente.trim().isEmpty) {
      return 'Por favor ingresa el nombre del cliente.';
    }
    if (presentacion.isEmpty) {
      return 'Por favor selecciona una presentación.';
    }
    if (numeroBolasTexto.trim().isEmpty) {
      return 'Por favor ingresa el número de bolas.';
    }
    final bolas = int.tryParse(numeroBolasTexto.trim());
    if (bolas == null || bolas <= 0) {
      return 'El número de bolas debe ser mayor a cero.';
    }
    if (topping.isEmpty) {
      return 'Por favor selecciona un topping.';
    }
    return null;
  }

  /// Calcula el pedido y retorna un PedidoHeladoModelo.
  PedidoHeladoModelo calcular({
    required String nombreCliente,
    required String presentacion,
    required int numeroBolas,
    required String topping,
  }) {
    final precioBase = _preciosPresentacion[presentacion] ?? 0.0;
    final valorBolas = numeroBolas * _precioPorBola;
    final valorTopping = _preciosToppings[topping] ?? 0.0;

    final subtotal = precioBase + valorBolas + valorTopping;
    final iva = subtotal * _tasaIva;
    final total = subtotal + iva;

    return PedidoHeladoModelo(
      nombreCliente: nombreCliente.trim(),
      presentacion: presentacion,
      numeroBolas: numeroBolas,
      topping: topping,
      subtotal: subtotal,
      iva: iva,
      total: total,
    );
  }

  // Expone los catálogos para las vistas
  static List<String> get presentaciones => _preciosPresentacion.keys.toList();
  static List<String> get toppings => _preciosToppings.keys.toList();
  static Map<String, double> get preciosPresentacion => _preciosPresentacion;
  static Map<String, double> get preciosToppings => _preciosToppings;
  static double get precioPorBola => _precioPorBola;
}
