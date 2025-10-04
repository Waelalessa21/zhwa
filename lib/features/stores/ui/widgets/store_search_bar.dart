import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class StoreSearchBar extends StatefulWidget {
  const StoreSearchBar({super.key});

  @override
  State<StoreSearchBar> createState() => _StoreSearchBarState();
}

class _StoreSearchBarState extends State<StoreSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: _isFocused ? AppColors.appGreen : AppColors.offWhite,
          width: _isFocused ? 2.w : 1.w,
        ),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: AppColors.appGreen.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: TextField(
        focusNode: _focusNode,
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.appGreen,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'ابحث عن متجر...',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.appGreen.withOpacity(0.4),
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: _isFocused
                ? AppColors.appGreen
                : AppColors.appGreen.withOpacity(0.5),
            size: 22.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
      ),
    );
  }
}
