import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OrderContainer extends StatelessWidget {
  final String storeImageUrl;
  final String storeName;
  final String date;
  final String state;
  final String price;
  final VoidCallback? onTap;

  const OrderContainer({
    super.key,
    required this.storeImageUrl,
    required this.storeName,
    required this.date,
    required this.state,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(storeImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // Store info section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appGreen,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF7F8C8D),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: _getStateColor(state).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      state,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: _getStateColor(state),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                SizedBox(width: 4.w),
                Image.asset('assets/images/sa.png', width: 14.w, height: 14.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStateColor(String state) {
    switch (state.toLowerCase()) {
      case 'مكتمل':
      case 'تم التسليم':
        return Colors.green;
      case 'قيد التنفيذ':
      case 'جاري التحضير':
        return Colors.orange;
      case 'ملغي':
      case 'مرفوض':
        return Colors.red;
      case 'قيد المراجعة':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
