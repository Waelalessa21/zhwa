import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/features/otp/ui/widgets/otp_field.dart';

class OtpForm extends StatefulWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final VoidCallback? onChanged;

  const OtpForm({
    super.key,
    required this.controllers,
    required this.focusNodes,
    this.onChanged,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  void _onTextChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.controllers.length - 1) {
      widget.focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      widget.focusNodes[index - 1].requestFocus();
    }
    widget.onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: List.generate(widget.controllers.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: OtpField(
              controller: widget.controllers[index],
              focusNode: widget.focusNodes[index],
              onChanged: (value) => _onTextChanged(value, index),
            ),
          );
        }),
      ),
    );
  }
}
