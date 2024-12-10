import 'package:flutter/material.dart';
import '../styles/login_styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto de boas-vindas
                Text(
                  'Bem-vindo!',
                  style: LoginStyles.welcomeTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Entre para continuar',
                  style: LoginStyles.subtitleTextStyle,
                ),
                const SizedBox(height: 32),
                TextField(
                    decoration: LoginStyles.textFieldDecoration(
                      'Email',
                      icon: Icons.email_outlined,
                    ),
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 16),
                TextField(
                  decoration: LoginStyles.textFieldDecoration(
                    'Senha',
                    icon: Icons.lock_outline,
                  ),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: LoginStyles.elevatedButtonStyle(),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Center(child: Text('Entrar')),
                ),
                const SizedBox(height: 8),
                // Botão Cadastro
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('Cadastrar-se',
                        style: LoginStyles.textButtonStyle()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
