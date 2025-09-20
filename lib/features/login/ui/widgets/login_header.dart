import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Image.asset("assets/icons/lock.png", width: 50.w, height: 50.h),
          SizedBox(height: 20.h),
          Text(
            "حياك الله 👋🏻",
            style: TextStyle(fontSize: 22, color: AppColors.scaffoldBackground),
          ),
          SizedBox(height: 8.h),
          Text(
            "الرجاء إدخال رقم الهاتف الخاص بك",
            style: TextStyle(fontSize: 16, color: AppColors.scaffoldBackground),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
