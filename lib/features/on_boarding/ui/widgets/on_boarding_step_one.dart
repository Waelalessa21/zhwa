import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OnBoardingStepOne extends StatelessWidget {
  const OnBoardingStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          "زَهــــوة",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.appPurple,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/palms.png",
              width: 20.w,
              height: 20.h,
              color: AppColors.scaffoldBackground,
            ),
            SizedBox(width: 4.w),
            Text(
              "مالك إلا زهوة، نسنعك!  ",
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.scaffoldBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
