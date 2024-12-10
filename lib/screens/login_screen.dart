import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../styles/login_styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (AuthService.login(email, password)) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        errorMessage = "Credenciais inválidas.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
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
                // Mensagens de erro
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 16),
                Text('Bem-vindo!', style: LoginStyles.welcomeTextStyle),
                const SizedBox(height: 8),
                Text('Entre para continuar',
                    style: LoginStyles.subtitleTextStyle),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: LoginStyles.textFieldDecoration('Email',
                      icon: Icons.email_outlined),
                  style: const TextStyle(color: Color(0xFFF4BF01)),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: LoginStyles.textFieldDecoration('Senha',
                      icon: Icons.lock_outline),
                  style: const TextStyle(color: Color(0xFFF4BF01)),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: LoginStyles.elevatedButtonStyle(),
                  onPressed: _handleLogin,
                  child: const Center(child: Text('Entrar')),
                ),
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
