import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/app_text_button.dart';
import 'package:zhwa/core/widgets/location_card.dart';

class ChangeYourLocation extends StatelessWidget {
  const ChangeYourLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تبي تغير موقعك؟',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.appGreen,
          ),
        ),
        SizedBox(height: 16.h),
        LocationCard(),
        SizedBox(height: 16.h),
        AppTextButton(text: 'إضافة موقع جديد؟'),
        SizedBox(height: 16.h),
      ],
    );
  }
}
