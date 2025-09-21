import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/helper/extension.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/features/otp/ui/widgets/otp_header.dart';
import 'package:zhwa/features/otp/ui/widgets/otp_form.dart';
import 'package:zhwa/features/otp/ui/widgets/otp_loader.dart';
import 'package:zhwa/features/otp/ui/widgets/otp_resend.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool _isVerifying = false;

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged() {
    final otp = _otpControllers.map((controller) => controller.text).join('');
    if (otp.length == 6) {
      setState(() {
        _isVerifying = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isVerifying = false;
          });
          context.pushNamed(Routes.home);
        }
      });
    } else {
      setState(() {
        _isVerifying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldMake: true,
      backgroundColor: AppColors.scaffoldBackground,
      child: Column(
        children: [
          OtpHeader(phoneNumber: widget.phoneNumber),
          SizedBox(height: 20.h),
          OtpForm(
            controllers: _otpControllers,
            focusNodes: _focusNodes,
            onChanged: _onOtpChanged,
          ),
          SizedBox(height: 20.h),
          OtpResend(),
          SizedBox(height: 20.h),
          OtpLoader(isLoading: _isVerifying),
          Spacer(),
        ],
      ),
    );
  }
}
