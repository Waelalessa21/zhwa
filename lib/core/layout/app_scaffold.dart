import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final bool scaffoldMake;
  final Widget? bottomNavigationBar;
  final double horizontalPadding;
  final Color? backgroundColor;

  const AppScaffold({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.scaffoldMake = true,
    this.horizontalPadding = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
        child: child,
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: AppColors.scaffoldBackground),
      child: scaffoldMake
          ? Scaffold(
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: bottomNavigationBar,
              backgroundColor: backgroundColor ?? Colors.transparent,
              appBar: appBar,
              body: content,
            )
          : content,
    );
  }
}
