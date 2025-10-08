import 'package:flutter/material.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/core/widgets/nav_bar.dart';
import 'package:zhwa/features/login/ui/login_screen.dart';
import 'package:zhwa/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:zhwa/core/localization/language_bloc_listener.dart';
import 'package:zhwa/features/otp/ui/otp_screen.dart';
import 'package:zhwa/features/stores/ui/stores_screen.dart';
import 'package:zhwa/features/store_details/ui/store_details_screen.dart';

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
        final phoneNumber = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => OtpScreen(phoneNumber: phoneNumber),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const NavBar());

      case Routes.stores:
        final storeName = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => StoresScreen(storeName: storeName),
        );

      case Routes.storeDetails:
        final storeId = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => StoreDetailsScreen(storeId: storeId),
        );

      default:
        return null;
    }
  }
}
