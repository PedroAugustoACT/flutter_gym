import 'package:flutter/material.dart';

class LoginStyles {
  // Estilo para o texto de boas-vindas
  static const welcomeTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Estilo para o subtítulo
  static const subtitleTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  // Decoração para os campos de texto
  static InputDecoration textFieldDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon, color: Colors.white70) : null,
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      labelStyle: TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  // Estilo para o botão elevado
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: TextStyle(
          fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.bold),
      elevation: 5,
    );
  }

  // Estilo para o botão de texto
  static TextStyle textButtonStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: 14,
        decoration: TextDecoration.underline);
  }
}
