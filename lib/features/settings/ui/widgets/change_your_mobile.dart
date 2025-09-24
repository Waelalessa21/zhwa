import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/app_text_button.dart';
import 'package:zhwa/features/login/ui/widgets/phone_input_field.dart';

class ChangeYourMobile extends StatelessWidget {
  const ChangeYourMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تبي تغير جوالك؟',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.appGreen,
          ),
        ),
        SizedBox(height: 16.h),
        PhoneInputField(),
        SizedBox(height: 16.h),
        AppTextButton(text: "تغيير الرقم "),
        SizedBox(height: 16.h),
      ],
    );
  }
}
