import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/scaffold_app_bar.dart';
import 'package:zhwa/features/orders/ui/widgets/order_container.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: ScaffoldAppBar(title: 'طلباتي'),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.sp),
          child: Column(
            children: [
              OrderContainer(
                storeImageUrl: 'assets/icons/foood.png',
                storeName: 'متجر x',
                date: '2025-01-01',
                state: 'تم التسليم',
                price: '100',
              ),
              Divider(color: AppColors.primary50, height: 1.h, thickness: 1.h),
              OrderContainer(
                storeImageUrl: 'assets/icons/foood.png',
                storeName: 'متجر x',
                date: '2025-01-01',
                state: 'قيد التنفيذ',
                price: '100',
              ),
              Divider(color: AppColors.primary50, height: 1.h, thickness: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
