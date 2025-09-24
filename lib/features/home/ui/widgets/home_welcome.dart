import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/section_heading.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نورتنا 👋',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.appPurple,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          'أهلًا بك في زهوة',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.appPurple,
          ),
        ),
        SizedBox(height: 24.h),
        SectionHeading(title: 'متاجرنا', icon: Iconsax.shop),
      ],
    );
  }
}
