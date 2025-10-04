import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/app_bottom_sheet.dart';
import 'package:zhwa/features/store_details/ui/widgets/confirm_reservation.dart';

class StoreDetailsServices extends StatelessWidget {
  const StoreDetailsServices({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'name': 'مكياج عرائس', 'icon': Iconsax.brush_1, 'price': '500 ر.س'},
      {'name': 'تسريحات شعر', 'icon': Iconsax.scissor, 'price': '300 ر.س'},
      {'name': 'عناية بالبشرة', 'icon': Iconsax.health, 'price': '250 ر.س'},
      {'name': 'مناكير وباديكير', 'icon': Iconsax.activity, 'price': '150 ر.س'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.search_favorite,
              color: AppColors.appGreen,
              size: 18.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'وش يقدم المتجر؟',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.appGreen,
              ),
            ),
          ],
        ),
        ...services.map((service) {
          return Container(
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      service['icon'] as IconData,
                      color: AppColors.appPurple,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      service['name'] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      service['price'] as String,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appGreen,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      onPressed: () {
                        AppBottomSheet.show(
                          context: context,
                          child: ConfirmReservation(
                            serviceName: service['name'].toString(),
                            servicePrice: service['price'].toString(),
                          ),
                        );
                      },
                      child: Text(
                        'اطلب الخدمة',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
