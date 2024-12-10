import 'package:flutter/material.dart';
import '../styles/login_styles.dart';

class SignupScreen extends StatelessWidget {
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
                Text(
                  'Criar Conta',
                  style: LoginStyles.welcomeTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Preencha os campos abaixo para continuar',
                  style: LoginStyles.subtitleTextStyle,
                ),
                const SizedBox(height: 32),
                TextField(
                  decoration: LoginStyles.textFieldDecoration(
                    'Nome',
                    icon: Icons.person_outline,
                  ),
                  style: TextStyle(color: const Color(0xFFF4BF01)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: LoginStyles.textFieldDecoration(
                    'Email',
                    icon: Icons.email_outlined,
                  ),
                  style: TextStyle(color: const Color(0xFFF4BF01)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: LoginStyles.textFieldDecoration(
                    'Senha',
                    icon: Icons.lock_outline,
                  ),
                  style: TextStyle(color: const Color(0xFFF4BF01)),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: LoginStyles.elevatedButtonStyle(),
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment');
                  },
                  child: const Center(child: Text('Continuar')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
