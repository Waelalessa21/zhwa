import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OnBoardingStepTwo extends StatelessWidget {
  const OnBoardingStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 56.h),
        Text(
          "إعزم و حنا نسااااعدك",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.scaffoldBackground,
          ),
        ),
      ],
    );
  }
}
