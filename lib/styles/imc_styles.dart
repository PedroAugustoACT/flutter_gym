import 'package:flutter/material.dart';

class IMCStyles {
  // Estilo para os campos de texto (Altura e Peso)
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

  // Estilo para o botão de cálculo
  static ButtonStyle calculateButtonStyle() {
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

  // Estilo para o texto do resultado
  static TextStyle resultTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Estilo para o AppBar
  static AppBar appBarStyle(String title) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.blueAccent,
    );
  }
}