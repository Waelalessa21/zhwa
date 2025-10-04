import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/helper/extension.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/stores/ui/widgets/store_category.dart';
import 'package:zhwa/features/stores/ui/widgets/store_details_container.dart';
import 'package:zhwa/features/stores/ui/widgets/store_search_bar.dart';

class StoresScreen extends StatelessWidget {
  final String storeName;

  const StoresScreen({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_right_3,
            color: AppColors.appGreen,
            size: 24.sp,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreCategory(storeName: storeName),
            SizedBox(height: 24.h),
            StoreSearchBar(),
            SizedBox(height: 24.h),
            StoreDetailsContainer(
              imageUrl: "assets/images/offeer.png",
              storeName: "صالون زهوة للتجميل",
              storeDescription: "صالون متخصص في المكياج والتجميل للعرائس",
              rating: 4.8,
              location: "الرياض، حي النرجس",
            ),
            SizedBox(height: 24.h),
            StoreDetailsContainer(
              imageUrl: "assets/images/offeer.png",
              storeName: "صالون زهوة للتجميل",
              storeDescription: "صالون متخصص في المكياج والتجميل للعرائس",
              rating: 4.8,
              location: "الرياض، حي النرجس",
            ),
            SizedBox(height: 24.h),
            StoreDetailsContainer(
              imageUrl: "assets/images/offeer.png",
              storeName: "صالون زهوة للتجميل",
              storeDescription: "صالون متخصص في المكياج والتجميل للعرائس",
              rating: 4.8,
              location: "الرياض، حي النرجس",
            ),
          ],
        ),
      ),
    );
  }
}
