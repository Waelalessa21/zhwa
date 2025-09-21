import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class PolicyAndItems extends StatelessWidget {
  const PolicyAndItems({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "بإستخدامك زهوة أنت توافق على ",
        style: TextStyle(
          color: AppColors.appGreen,
          fontFamily: 'IBMPlexSansArabic',
          fontSize: 13.sp,
        ),
        children: [
          TextSpan(
            text: "الشروط و الأحكام",
            style: TextStyle(
              color: AppColors.primary400,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: " و ",
            style: TextStyle(color: AppColors.appGreen),
          ),
          TextSpan(
            text: "سياسة الخصوصية",
            style: TextStyle(
              color: AppColors.primary400,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
