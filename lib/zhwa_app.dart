import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zhwa/core/routing/app_router.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class ZhwaApp extends StatelessWidget {
  final AppRouter appRouter;
  const ZhwaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.primaryColor,
            selectionHandleColor: AppColors.primaryColor,
          ),
          fontFamily: 'IBMPlexSansArabic',
          // scaffoldBackgroundColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar')],
      ),
    );
  }
}
