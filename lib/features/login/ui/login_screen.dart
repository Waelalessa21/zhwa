import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/login/ui/widgets/app_button.dart';
import 'package:zhwa/features/login/ui/widgets/app_text_form_field.dart';
import 'package:zhwa/features/login/ui/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldMake: true,
      backgroundColor: AppColors.appGreen,
      child: Column(
        children: [
          LoginHeader(),
          SizedBox(height: 20.h),
          AppTextFormField(),
          SizedBox(height: 9.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "بمجرد تسجيل الدخول أنت توافق على سياسة الخصوصية",
              style: TextStyle(color: AppColors.scaffoldBackground),
            ),
          ),
          SizedBox(height: 40.h),
          AppButton(),
        ],
      ),
    );
  }
}
