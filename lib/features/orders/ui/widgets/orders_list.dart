import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'order_container.dart';

class OrdersList extends StatelessWidget {
  final List<OrderData> orders;

  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orders.asMap().entries.map((entry) {
        int index = entry.key;
        OrderData order = entry.value;

        return Column(
          children: [
            OrderContainer(
              storeImageUrl: order.storeImageUrl,
              storeName: order.storeName,
              date: order.date,
              state: order.state,
              price: order.price,
              onTap: () {
                // Handle order tap
              },
            ),
            if (index < orders.length - 1)
              Divider(
                height: 1.h,
                thickness: 1.h,
                color: Colors.grey.withOpacity(0.2),
                indent: 16.w,
                endIndent: 16.w,
              ),
          ],
        );
      }).toList(),
    );
  }
}

class OrderData {
  final String storeImageUrl;
  final String storeName;
  final String date;
  final String state;
  final String price;

  OrderData({
    required this.storeImageUrl,
    required this.storeName,
    required this.date,
    required this.state,
    required this.price,
  });
}
