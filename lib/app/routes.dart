import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/imc_screen.dart';
import '../services/auth_service.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/signup': (context) => SignupScreen(),
  '/home': (context) {
    final user = AuthService.currentUser;
    if (user != null) {
      return HomeScreen(user: user); 
    } else {
      return LoginScreen();
    }
  },
  '/payment': (context) => PaymentScreen(),
  '/imc': (context) => IMCScreen(),
};
