import 'package:flutter/material.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OtpResend extends StatelessWidget {
  const OtpResend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("لم تستلم رمز التحقق؟"),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(foregroundColor: AppColors.appGreen),
          child: Text("إعادة الإرسال"),
        ),
      ],
    );
  }
}
