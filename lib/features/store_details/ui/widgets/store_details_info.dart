import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class StoreDetailsInfo extends StatelessWidget {
  final String storeName;
  final double rating;
  final String location;

  const StoreDetailsInfo({
    super.key,
    required this.storeName,
    required this.rating,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storeName,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.appPurple,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.appYellow.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Icon(Iconsax.star5, color: AppColors.appYellow, size: 18.sp),
                  SizedBox(width: 6.w),
                  Text(
                    rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appGreen,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '(125)',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.appGreen.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Icon(Iconsax.location, color: AppColors.appGreen, size: 18.sp),
            SizedBox(width: 6.w),
            Expanded(
              child: Text(
                location,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.appGreen,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
