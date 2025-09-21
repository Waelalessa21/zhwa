import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/login/ui/widgets/login_header.dart';
import 'package:zhwa/features/login/ui/widgets/login_form.dart';
import 'package:zhwa/features/login/ui/widgets/policy_and_items.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldMake: true,
      backgroundColor: AppColors.scaffoldBackground,
      child: Column(
        children: [
          LoginHeader(),
          SizedBox(height: 20.h),
          LoginForm(),
          Spacer(),
          PolicyAndItems(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
