import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/localization/language_service.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/localization/app_localizations.dart';

class OnBoardingProgressIndicator extends StatelessWidget {
  final int currentStep;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final LanguageState languageState;
  const OnBoardingProgressIndicator({
    super.key,
    required this.currentStep,
    required this.onNext,
    required this.onSkip,
    required this.languageState,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final progress = (currentStep + 1) / 2;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: currentStep == index ? 24.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: currentStep == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4.r),
              ),
            );
          }),
        ),
        SizedBox(height: 24.h),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 48.w,
                height: 48.h,
                child: TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 0.0, end: progress),
                  builder: (context, value, child) {
                    return CircularProgressIndicator(
                      value: value,
                      strokeWidth: 3.w,
                      backgroundColor: AppColors.appPurple.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: onNext,
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  child: Icon(
                    languageState.isRTL
                        ? Iconsax.arrow_circle_left
                        : Iconsax.arrow_circle_right,
                    color: AppColors.appGreen,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: languageState.isRTL
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: TextButton(
            onPressed: onSkip,
            child: Text(
              localizations.translate('skip'),
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}
