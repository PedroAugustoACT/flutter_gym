import 'package:flutter/material.dart';
import '../styles/home_styles.dart';

class HomeScreen extends StatelessWidget {
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Home', style: HomeStyles.appBarTitleStyle),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                        ),
                        HomeStyles.logoutButton(context),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('👋 Bem-vindo de volta!', style: HomeStyles.welcomeTextStyle),
                    const SizedBox(height: 16),
                    Text(
                      'Explore as funcionalidades da aplicação.',
                      style: HomeStyles.subtitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
