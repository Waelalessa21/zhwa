import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  final bool isDismissible;
  final bool enableDrag;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Color? bgColor;

  const AppBottomSheet({
    this.bgColor,
    super.key,
    required this.child,
    this.isDismissible = true,
    this.enableDrag = true,
    this.padding,
    this.backgroundColor,
    this.elevation,
    this.shape,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Color? bgColor,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: bgColor ?? Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      builder: (context) => AppBottomSheet(
        bgColor: bgColor,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        padding: padding,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primary300.withOpacity(0.01),
              blurRadius: 41,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (enableDrag)
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            child,
          ],
        ),
      ),
    );
  }
}
