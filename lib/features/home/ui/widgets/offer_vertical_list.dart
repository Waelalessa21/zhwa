import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/helper/list_of_stores.dart';
import 'offer_container.dart';

class OfferVerticalList extends StatelessWidget {
  final List<OfferData> offers;
  const OfferVerticalList({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: offers.asMap().entries.map((entry) {
        int index = entry.key;
        OfferData offer = entry.value;

        return Column(
          children: [
            OfferContainer(
              imageUrl: offer.imageUrl,
              offerType: "عرض خاص",
              offerProvider: offer.storeName,
              offerDetails: offer.offerDetails,
              onTap: () {},
            ),
            if (index < offers.length - 1) SizedBox(height: 16.h),
          ],
        );
      }).toList(),
    );
  }
}
