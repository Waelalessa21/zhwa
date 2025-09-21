import 'package:flutter/material.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/features/home/ui/home_screen.dart';
import 'package:zhwa/features/login/ui/login_screen.dart';
import 'package:zhwa/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:zhwa/core/localization/language_bloc_listener.dart';
import 'package:zhwa/features/otp/ui/otp_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const LanguageBlocListener(child: OnBoardingScreen()),
        );

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(phoneNumber: "0542772934"),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
