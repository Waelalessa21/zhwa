import 'package:flutter/material.dart';
import 'package:zhwa/core/di/dependency_injection.dart';
import 'package:zhwa/core/routing/app_router.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/core/services/auth_service.dart';
import 'package:zhwa/zhwa_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.init();

  final isAuthenticated = await AuthService.isAuthenticated();
  final initialRoute = isAuthenticated ? Routes.home : Routes.login;

  runApp(ZhwaApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
