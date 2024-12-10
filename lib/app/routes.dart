import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/imc_screen.dart';
import '../services/auth_service.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(), // Tela de login
  '/signup': (context) => SignupScreen(),
  '/home': (context) {
    final user = AuthService.currentUser;
    if (user != null) {
      return HomeScreen(user: user);  // Passando o usuário logado
    } else {
      return LoginScreen();  // Redireciona para a tela de login se o usuário não estiver logado
    }
  },
  '/payment': (context) => PaymentScreen(),
  '/imc': (context) => IMCScreen(),
};
