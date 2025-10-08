import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/store_details/ui/store_details_screen.dart';

class StoreDetailsContainer extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String storeDescription;
  final double rating;
  final String location;
  final VoidCallback? onTap;

  const StoreDetailsContainer({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.storeDescription,
    required this.rating,
    required this.location,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoreDetailsScreen(storeId: 'temp-id'),
              ),
            );
          },
      child: Container(
        height: 240.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: _buildStoreImage(context),
              ),
            ),
            // Store Details
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      storeName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appPurple,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      storeDescription,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.appGreen.withOpacity(0.7),
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Iconsax.star5,
                          color: AppColors.appYellow,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.appGreen,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Icon(
                          Iconsax.location,
                          color: AppColors.appGreen.withOpacity(0.6),
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.appGreen.withOpacity(0.6),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreImage(BuildContext context) {
    if (imageUrl.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackIcon();
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.appGreen,
                strokeWidth: 2,
              ),
            );
          },
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain,

          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackIcon();
          },
        ),
      );
    }
  }

  Widget _buildFallbackIcon() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appGreen.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Center(
        child: Icon(Iconsax.shop, color: AppColors.appGreen, size: 48.sp),
      ),
    );
  }
}
