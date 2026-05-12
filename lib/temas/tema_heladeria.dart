import 'package:flutter/material.dart';

class TemaHeladeria {
  // Colores principales
  static const Color rosado = Color(0xFFF48FB1);
  static const Color rosadoOscuro = Color(0xFFE91E8C);
  static const Color celeste = Color(0xFF81D4FA);
  static const Color celesteOscuro = Color(0xFF0288D1);
  static const Color blanco = Colors.white;
  static const Color fondoClaro = Color(0xFFFCE4EC);

  static ThemeData get claro {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: rosado,
        primary: rosadoOscuro,
        secondary: celesteOscuro,
        surface: fondoClaro,
      ),
      scaffoldBackgroundColor: fondoClaro,

      // AppBar rosada
      appBarTheme: const AppBarTheme(
        backgroundColor: rosado,
        foregroundColor: blanco,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: blanco,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),

      // Botones redondeados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: rosadoOscuro,
          foregroundColor: blanco,
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          elevation: 3,
        ),
      ),

      // Campos de texto con borde
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: blanco,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: rosado, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: rosado, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: rosadoOscuro, width: 2),
        ),
        labelStyle: const TextStyle(color: rosadoOscuro),
        prefixIconColor: rosadoOscuro,
      ),

      // Texto
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: rosadoOscuro,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: celesteOscuro,
        ),
        bodyMedium: TextStyle(fontSize: 15, color: Color(0xFF424242)),
        bodySmall: TextStyle(fontSize: 13, color: Color(0xFF757575)),
      ),

      // POR ESTO
      cardTheme: const CardThemeData(
        color: blanco,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      ),
    );
  }
}
