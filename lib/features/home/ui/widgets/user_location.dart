import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/app_bottom_sheet.dart';
import 'package:zhwa/features/home/ui/widgets/change_your_location.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.show(context: context, child: ChangeYourLocation());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Iconsax.location, color: AppColors.appGreen),
              SizedBox(width: 4.w),
              Text(
                'التوصيل إلى',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              SizedBox(width: 8.w),
              Text(
                'أبها , حي المنسك',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
