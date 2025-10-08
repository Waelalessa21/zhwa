import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/helper/extension.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class StoreDetailsHeader extends StatelessWidget {
  final String imageUrl;

  const StoreDetailsHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280.h,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.primary50),
          child: Stack(
            children: [
              _buildStoreImage(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                  ),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: AppColors.appGreen,
                    size: 24.sp,
                  ),
                  onPressed: () => context.pop(),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Iconsax.heart,
                      color: AppColors.appPurple,
                      size: 24.sp,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoreImage() {
    if (imageUrl.startsWith('http')) {
      return Image.network(
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
      );
    } else {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackIcon();
        },
      );
    }
  }

  Widget _buildFallbackIcon() {
    return Image.asset(
      "assets/images/logo.png",
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
