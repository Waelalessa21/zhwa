import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/helper/extension.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/presentation/cubits/stores_by_category_cubit.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/stores/ui/widgets/store_category.dart';
import 'package:zhwa/features/stores/ui/widgets/store_details_container.dart';
import 'package:zhwa/features/stores/ui/widgets/store_search_bar.dart';

class StoresScreen extends StatefulWidget {
  final String storeName;

  const StoresScreen({super.key, required this.storeName});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoresByCategoryCubit>().getStoresByCategory(widget.storeName);
  }

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
            StoreCategory(storeName: widget.storeName),
            SizedBox(height: 24.h),
            StoreSearchBar(),
            SizedBox(height: 24.h),
            BlocBuilder<StoresByCategoryCubit, StoresByCategoryState>(
              builder: (context, state) {
                if (state is StoresByCategoryLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.h),
                      child: CircularProgressIndicator(
                        color: AppColors.appGreen,
                      ),
                    ),
                  );
                }

                if (state is StoresByCategoryFailure) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.h),
                      child: Column(
                        children: [
                          Icon(
                            Iconsax.warning_2,
                            color: Colors.red,
                            size: 48.sp,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'فشل في تحميل المتاجر',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
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
                    ),
                  );
                }

                if (state is StoresByCategorySuccess) {
                  final stores = state.stores;

                  if (stores.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.h),
                        child: Column(
                          children: [
                            Icon(
                              Iconsax.shop,
                              color: AppColors.primary400,
                              size: 48.sp,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'لا توجد متاجر متاحة في هذه الفئة',
                              style: TextStyle(
                                color: AppColors.primary400,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      final store = stores[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: StoreDetailsContainer(
                          imageUrl: "assets/images/aaa.png",
                          storeName: store.name,
                          storeDescription: store.description,
                          rating: 4.5,
                          location: '${store.city}, ${store.location}',
                          onTap: () {
                            context.pushNamed(
                              Routes.storeDetails,
                              arguments: store.id,
                            );
                          },
                        ),
                      );
                    },
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
