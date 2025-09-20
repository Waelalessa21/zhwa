import 'package:flutter/material.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/features/home/ui/home_screen.dart';
import 'package:zhwa/features/login/ui/login_screen.dart';
import 'package:zhwa/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:zhwa/core/localization/language_bloc_listener.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const LanguageBlocListener(child: OnBoardingScreen()),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
