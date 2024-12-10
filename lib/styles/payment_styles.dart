import 'package:flutter/material.dart';

class PaymentStyles {
  // Estilo do botão de pagamento (Cartão / PIX)
  static ButtonStyle paymentButtonStyle(bool isSelected) {
    return ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.blueAccent : Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: TextStyle(fontSize: 16),
    );
  }

  // Estilo para os campos de texto (Número do Cartão, Data de Validade, Código de Segurança)
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

  // Estilo do botão de confirmação de pagamento
  static ButtonStyle confirmButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.bold),
      elevation: 5,
    );
  }

  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Estilo do texto para o Pix
  static const pixTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
