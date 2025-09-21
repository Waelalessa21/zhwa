import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/widgets/circles_loader.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({super.key});

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Stack(
            alignment: Alignment.center,
            children: [
              CirclesLoader(animation: _animation, animate: true),
              Image.asset(
                "assets/images/flower.png",
                width: 120.w,
                height: 120.h,
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Text(
            "حياك الله 👋🏻",
            style: TextStyle(fontSize: 24, color: AppColors.appGreen),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "الرجاء إدخال رقم الهاتف الخاص بك، سنقوم بإرسال رمز تحقق لإكمال تسجيل الدخول",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.appGreen,
                height: 1.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
