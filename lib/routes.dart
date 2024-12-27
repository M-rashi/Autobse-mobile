import 'package:autobse/presentation/pages/account/account_screen.dart';
import 'package:autobse/presentation/pages/explore/explore_screen.dart';
import 'package:autobse/presentation/pages/login/login_screen.dart';
import 'package:autobse/presentation/pages/home/home_screen.dart';
import 'package:autobse/presentation/pages/sign%20up/signin_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String account = '/account';
  static const String createAccount = '/create-account';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case explore:
        return MaterialPageRoute(builder: (_) => const ExplorePage());
      case account:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      default:
        return null;
    }
  }
}
