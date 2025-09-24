import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/helper/list_of_stores.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/widgets/section_heading.dart';
import 'package:zhwa/features/home/ui/widgets/home_app_bar.dart';
import 'package:zhwa/features/home/ui/widgets/home_welcome.dart';
import 'package:zhwa/features/home/ui/widgets/offer_vertical_list.dart';
import 'package:zhwa/features/home/ui/widgets/stores_horizontal_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HomeAppBar(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h),
        child: Align(
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeWelcome(),
                SizedBox(height: 24.h),
                StoresHorizontalList(),
                SectionHeading(title: 'العروض', icon: Iconsax.discover),
                SizedBox(height: 24.h),
                OfferVerticalList(offers: ListOfOffers.getOffers()),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
