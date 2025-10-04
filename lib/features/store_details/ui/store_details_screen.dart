import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_about.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_gallery.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_header.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_info.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_services.dart';

class StoreDetailsScreen extends StatelessWidget {
  final String storeName;
  final String storeImage;
  final double rating;
  final String location;
  final String description;

  const StoreDetailsScreen({
    super.key,
    required this.storeName,
    required this.storeImage,
    required this.rating,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreDetailsHeader(imageUrl: storeImage),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  StoreDetailsInfo(
                    storeName: storeName,
                    rating: rating,
                    location: location,
                  ),
                  SizedBox(height: 24.h),
                  StoreDetailsAbout(description: description),
                  SizedBox(height: 24.h),
                  StoreDetailsServices(),
                  SizedBox(height: 24.h),
                  StoreDetailsGallery(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
