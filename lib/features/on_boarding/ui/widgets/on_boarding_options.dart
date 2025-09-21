import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/localization/language_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingOptions extends StatelessWidget {
  const OnBoardingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, languageState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                final newLocale = languageState.locale.languageCode == 'ar'
                    ? const Locale('en')
                    : const Locale('ar');
                context.read<LanguageCubit>().changeLanguage(newLocale);
              },
              child: Align(
                alignment: languageState.isRTL
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Iconsax.global, color: Colors.black),
                      SizedBox(width: 10.w),
                      Text(
                        languageState.languageName,
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/images/flower.png",
              width: 100.w,
              height: 100.h,
            ),
          ],
        );
      },
    );
  }
}
