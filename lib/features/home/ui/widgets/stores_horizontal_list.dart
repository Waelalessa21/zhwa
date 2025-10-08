import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/helper/list_of_stores.dart';
import 'package:zhwa/features/home/ui/widgets/store_container.dart';

class StoresHorizontalList extends StatelessWidget {
  const StoresHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final stores = ListOfStores.getStores();

      return SizedBox(
        height: 140.h,
        child: Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stores.length,
              itemBuilder: (context, index) {
                final store = stores[index];
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: StoreContainer(
                    imageUrl: store.imageUrl,
                    storeName: store.storeName,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IgnorePointer(
                child: Container(
                  width: 40.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.scaffoldBackground,
                        AppColors.scaffoldBackground.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      return SizedBox(
        height: 140.h,
        child: Center(
          child: Text(
            'خطأ في تحميل المتاجر',
            style: TextStyle(color: Colors.red, fontSize: 14.sp),
          ),
        ),
      );
    }
  }
}
