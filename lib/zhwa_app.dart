import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zhwa/core/di/dependency_injection.dart';
import 'package:zhwa/core/routing/app_router.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/localization/app_localizations.dart';

class ZhwaApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;
  const ZhwaApp({super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DependencyInjection.authCubit),
        BlocProvider(create: (_) => DependencyInjection.storesCubit),
        BlocProvider(create: (_) => DependencyInjection.storeDetailsCubit),
        BlocProvider(create: (_) => DependencyInjection.storesByCategoryCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.scaffoldBackground,
              selectionHandleColor: AppColors.scaffoldBackground,
            ),
            fontFamily: 'IBMPlexSansArabic',
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: initialRoute,
          locale: const Locale('ar'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar'), Locale('en')],
        ),
      ),
    );
  }
}
