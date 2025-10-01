import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OnBoardingStepTwo extends StatefulWidget {
  const OnBoardingStepTwo({super.key});

  @override
  State<OnBoardingStepTwo> createState() => _OnBoardingStepTwoState();
}

class _OnBoardingStepTwoState extends State<OnBoardingStepTwo>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _imageController;

  late Animation<double> _titleFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _imageFadeAnimation;
  late Animation<Offset> _imageSlideAnimation;

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _titleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _titleController, curve: Curves.easeOut));

    _titleSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _titleController, curve: Curves.easeOutCubic),
        );

    _imageFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _imageController, curve: Curves.easeOut));

    _imageSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _imageController, curve: Curves.easeOutCubic),
        );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _titleController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _imageController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          SlideTransition(
            position: _titleSlideAnimation,
            child: FadeTransition(
              opacity: _titleFadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "يزهاك و يسنعك",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPurple,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/sakura.png",
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.scaffoldBackground,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "من كل شي تحتاجه",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.scaffoldBackground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60.h),
          Center(
            child: SlideTransition(
              position: _imageSlideAnimation,
              child: FadeTransition(
                opacity: _imageFadeAnimation,
                child: Image.asset("assets/images/onboardingtoo.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
