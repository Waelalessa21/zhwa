import 'package:flutter/material.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/features/on_boarding/ui/on_boarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      default:
        return null;
    }
  }
}
