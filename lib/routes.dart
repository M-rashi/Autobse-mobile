import 'package:autobse/presentation/pages/login/login_screen.dart';
import 'package:autobse/presentation/pages/home/home_screen.dart';
import 'package:autobse/presentation/pages/sign%20up/signin_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String createAccount = '/create-account';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      default:
        return null;
    }
  }
}
