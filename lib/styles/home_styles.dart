import 'package:flutter/material.dart';

class HomeStyles {
  // Estilo para o título da AppBar
  static const appBarTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFF4BF01),
  );

  // Botão de logout com estilo aprimorado
  static IconButton logoutButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout, color: const Color(0xFFF4BF01)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/');
      },
      splashRadius: 24,
      tooltip: 'Sair',
    );
  }

  // Estilo do texto de boas-vindas
  static const welcomeTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFF4BF01),
  );

  // Estilo do subtítulo abaixo do texto de boas-vindas
  static const subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: const Color(0xFFF4BF01),
  );

  // Estilo do título nos cards
  static const cardTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Estilo do subtítulo nos cards
static const cardSubtitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600, // Peso SemiBold
  fontStyle: FontStyle.italic, // Aplica o estilo itálico
  fontFamily: 'Montserrat', // Especifica a família da fonte
  color: Colors.black,
);



  // Configurações gerais do Card
  static const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  static const cardElevation = 4.0;

  static const cardPadding = EdgeInsets.all(16);
}
