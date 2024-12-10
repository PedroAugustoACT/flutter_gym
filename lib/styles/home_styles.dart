import 'package:flutter/material.dart';

class HomeStyles {
  // Estilo para o título da AppBar
  static const appBarTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Botão de logout com estilo aprimorado
  static IconButton logoutButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout, color: Colors.white),
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
    color: Colors.white,
  );

  // Estilo do subtítulo abaixo do texto de boas-vindas
  static const subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );
}
