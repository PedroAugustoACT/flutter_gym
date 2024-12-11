import 'package:flutter/material.dart';
import '../styles/signup_styles.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF4BF01)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo-smart-fit-2048.png',
            height: 100,
          ),
        ),
        actions: [
          Container(width: 48),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Text(
                          'Criar Conta',
                          style: SignupStyles.welcomeTextStyle,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Preencha os campos abaixo para continuar',
                        style: SignupStyles.subtitleTextStyle,
                      ),
                      const SizedBox(height: 32),
                      TextField(
                        decoration: SignupStyles.textFieldDecoration(
                          'Nome',
                          icon: Icons.person_outline,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: SignupStyles.textFieldDecoration(
                          'Email',
                          icon: Icons.email_outlined,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: SignupStyles.textFieldDecoration(
                          'Senha',
                          icon: Icons.lock_outline,
                        ),
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: SignupStyles.elevatedButtonStyle(),
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment');
                        },
                        child: const Center(child: Text('Continuar')),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
