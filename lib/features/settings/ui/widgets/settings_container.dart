import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class SettingsContainer extends StatelessWidget {
  final String title;
  final Function() onTap;
  final IconData iconName;
  final bool transparent;

  const SettingsContainer({
    super.key,
    required this.title,
    required this.iconName,
    required this.onTap,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: transparent
            ? null
            : BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appGreen.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconName, color: AppColors.appGreen, size: 20.sp),
                SizedBox(width: 16.w),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.appGreen,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.appGreen,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
