import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/presentation/cubits/store_details_cubit.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_about.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_header.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_info.dart';
import 'package:zhwa/features/store_details/ui/widgets/store_details_services.dart';

class StoreDetailsScreen extends StatefulWidget {
  final String storeId;

  const StoreDetailsScreen({super.key, required this.storeId});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoreDetailsCubit>().getStore(widget.storeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
        builder: (context, state) {
          if (state is StoreDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.appGreen),
            );
          }

          if (state is StoreDetailsFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.warning_2, color: Colors.red, size: 64.sp),
                  SizedBox(height: 16.h),
                  Text(
                    'فشل في تحميل تفاصيل المتجر',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    state.message,
                    style: TextStyle(
                      color: AppColors.primary400,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (state is StoreDetailsSuccess) {
            final store = state.store;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoreDetailsHeader(imageUrl: store.image),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        StoreDetailsInfo(
                          storeName: store.name,
                          rating: 4.5,
                          location: '${store.city}, ${store.location}',
                        ),
                        SizedBox(height: 24.h),
                        StoreDetailsAbout(description: store.description),
                        SizedBox(height: 24.h),
                        StoreDetailsServices(products: store.products),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
