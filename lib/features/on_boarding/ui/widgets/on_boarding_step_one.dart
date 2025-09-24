import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class OnBoardingStepOne extends StatefulWidget {
  const OnBoardingStepOne({super.key});

  @override
  State<OnBoardingStepOne> createState() => _OnBoardingStepOneState();
}

class _OnBoardingStepOneState extends State<OnBoardingStepOne>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _imageController;
  late AnimationController _notificationController;

  late Animation<double> _titleFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _imageFadeAnimation;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<double> _notificationScaleAnimation;
  late Animation<double> _notificationFadeAnimation;

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

    _notificationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
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

    _notificationScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _notificationController,
        curve: Curves.elasticOut,
      ),
    );

    _notificationFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _notificationController, curve: Curves.easeOut),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _titleController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    _imageController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _notificationController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageController.dispose();
    _notificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          SlideTransition(
            position: _titleSlideAnimation,
            child: FadeTransition(
              opacity: _titleFadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "زَهــــوة",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPurple,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/palms.png",
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.scaffoldBackground,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "مالك إلا زهوة، نسنعك!  ",
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
          SizedBox(height: 50.h),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SlideTransition(
                  position: _imageSlideAnimation,
                  child: FadeTransition(
                    opacity: _imageFadeAnimation,
                    child: Image.asset(
                      'assets/images/onBoardingOneMock.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: -90.h,
                  left: 150.w,
                  child: ScaleTransition(
                    scale: _notificationScaleAnimation,
                    child: FadeTransition(
                      opacity: _notificationFadeAnimation,
                      child: Image.asset(
                        'assets/images/OnBoardingOneFirstNotification.png',
                        width: 220.w,
                        height: 220.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.5),
        ],
      ),
    );
  }
}
