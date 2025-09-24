import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/helper/extension.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/on_boarding/ui/widgets/on_boarding_options.dart';
import 'package:zhwa/features/on_boarding/ui/widgets/on_boarding_step_one.dart';
import 'package:zhwa/features/on_boarding/ui/widgets/on_boarding_step_two.dart';
import 'package:zhwa/features/on_boarding/ui/widgets/on_boarding_progress_indicator.dart';
import 'package:zhwa/core/localization/language_service.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushNamed(Routes.login);
    }
  }

  void _skipOnboarding() {
    context.pushNamed(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldMake: true,
      backgroundColor: AppColors.appGreen,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return Column(
            children: [
              OnBoardingOptions(),
              SizedBox(height: 30.h),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentStep = index;
                    });
                  },
                  children: [OnBoardingStepOne(), OnBoardingStepTwo()],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 40.h),
                child: OnBoardingProgressIndicator(
                  currentStep: _currentStep,
                  onNext: _nextStep,
                  onSkip: _skipOnboarding,
                  languageState: languageState,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
