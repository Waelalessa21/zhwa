import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/core/helper/phone_validator.dart';
import 'package:zhwa/features/otp/ui/widgets/otp_loader.dart';

class PhoneInputField extends StatefulWidget {
  final Function(String)? onValidPhone;
  final Function()? onInvalidPhone;

  const PhoneInputField({super.key, this.onValidPhone, this.onInvalidPhone});

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _hasError = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    setState(() {
      _hasError = false;
      _isLoading = false;
    });

    final cleanValue = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanValue.length == 10) {
      if (PhoneValidator.isValidSaudiPhone(cleanValue)) {
        setState(() {
          _isLoading = true;
        });

        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            final formattedPhone = PhoneValidator.formatSaudiPhone(cleanValue);
            final localNumber = formattedPhone.replaceFirst('+966', '0');
            widget.onValidPhone?.call(localNumber);
          }
        });
      } else {
        setState(() {
          _hasError = true;
        });
        widget.onInvalidPhone?.call();

        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _hasError = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.appGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: _hasError ? Border.all(color: Colors.red, width: 2) : null,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                child: Image.asset(
                  "assets/icons/question.png",
                  width: 22.sp,
                  color: AppColors.primary400,
                ),
              ),
              Container(
                width: 1,
                height: 40.h,
                color: Colors.grey.withOpacity(0.3),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: AppColors.primary400,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textDirection: TextDirection.ltr,
                    onChanged: _onTextChanged,
                    decoration: InputDecoration(
                      hintText: "05xxxxxxxx",
                      hintStyle: TextStyle(
                        color: AppColors.primary400.withOpacity(0.7),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      hintTextDirection: TextDirection.ltr,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 40.h,
                color: Colors.grey.withOpacity(0.3),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "+966",
                      style: TextStyle(
                        color: AppColors.primary400,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text("🇸🇦", style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (_hasError) ...[
          SizedBox(height: 8.h),
          Text(
            "رقم الجوال غير صحيح. يرجى إدخال رقم سعودي صحيح",
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ],
        if (_isLoading) ...[SizedBox(height: 16.h), OtpLoader(isLoading: true)],
      ],
    );
  }
}
