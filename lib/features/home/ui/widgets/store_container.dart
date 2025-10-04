import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/stores/ui/stores_screen.dart';

class StoreContainer extends StatelessWidget {
  final String imageUrl;
  final String storeName;

  const StoreContainer({
    super.key,
    required this.imageUrl,
    required this.storeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoresScreen(storeName: storeName),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            child: Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(color: AppColors.primary50),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              storeName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.appPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
