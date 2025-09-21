import 'package:flutter/material.dart';
import 'package:zhwa/core/helper/extension.dart';
import 'package:zhwa/core/routing/routes.dart';
import 'package:zhwa/features/login/ui/widgets/phone_input_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void _onValidPhone(String phoneNumber) {
    context.pushNamed(Routes.otp, arguments: phoneNumber);
  }

  void _onInvalidPhone() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneInputField(
          onValidPhone: _onValidPhone,
          onInvalidPhone: _onInvalidPhone,
        ),
      ],
    );
  }
}
