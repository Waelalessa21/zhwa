import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final bool showAll;
  final IconData icon;
  const SectionHeading({
    super.key,
    required this.title,
    required this.icon,
    this.showAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.appGreen),
            SizedBox(width: 6.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.appGreen,
              ),
            ),
          ],
        ),
        Text(
          showAll ? "الكل" : "",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.appGreen,
          ),
        ),
      ],
    );
  }
}
