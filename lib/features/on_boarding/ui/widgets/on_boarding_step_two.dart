import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OnBoardingStepTwo extends StatelessWidget {
  const OnBoardingStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "يزهاك و يسنعك",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appPurple,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/sakura.png",
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.scaffoldBackground,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "من كل شي تحتاجه",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.scaffoldBackground,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Center(
            child: Stack(clipBehavior: Clip.none, children: [
              
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        ],
      ),
    );
  }
}
