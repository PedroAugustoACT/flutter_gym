import 'package:flutter/material.dart';
import '../styles/home_styles.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  String _getImcStatus(double imc) {
    if (imc < 18.5) return "abaixo do peso";
    if (imc >= 18.5 && imc < 24.9) return "com peso ideal";
    return "com sobrepeso";
  }

  void _logout(BuildContext context) {
    AuthService.logout(); 
    Navigator.pushReplacementNamed(
        context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: const Color(0xFFF4BF01)),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: const Color(0xFFF4BF01)),
            onPressed: () => _logout(context),
          ),
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título e Subtítulo
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('👋 Olá, ${user['name']}!',
                        style: HomeStyles.welcomeTextStyle),
                    const SizedBox(height: 8),
                    Text(
                      'Explore as funcionalidades da aplicação.',
                      style: HomeStyles.subtitleTextStyle,
                    ),
                  ],
                ),
              ),
              // Cards abaixo do título
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    CardWidget(
                      title: "IMC",
                      subtitle:
                          "Seu IMC é ${user['imc'].toStringAsFixed(1)}, você está ${_getImcStatus(user['imc'])}.",
                    ),
                    const SizedBox(height: 16),
                    CardWidget(
                      title: "Meus Treinos",
                      subtitle: "Treinos sugeridos para você.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Declaração do CardWidget dentro do próprio arquivo
class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
        color: const Color(0xFFF4BF01),
        shape: HomeStyles.cardShape,
        elevation: HomeStyles.cardElevation,
        child: Padding(
          padding: HomeStyles.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: HomeStyles.cardTitleStyle),
              const SizedBox(height: 8),
              Text(subtitle, style: HomeStyles.cardSubtitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}
