import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OtpHeader extends StatelessWidget {
  final String phoneNumber;

  const OtpHeader({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.appGreen.withOpacity(0.1),
              border: Border.all(
                color: AppColors.appGreen.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Image.asset(
              "assets/icons/code.png",
              width: 40.w,
              color: AppColors.appGreen,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "جاك رمز التحقق",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.appGreen,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            " أرسلنا لك رمز مكون من ٦ أرقام إلى",
            style: TextStyle(fontSize: 16.sp, color: AppColors.primary400),
          ),
          SizedBox(height: 8.h),
          Text(
            phoneNumber,
            style: TextStyle(fontSize: 16.sp, color: AppColors.primary400),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
