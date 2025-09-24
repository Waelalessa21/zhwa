import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/layout/app_scaffold.dart';
import 'package:zhwa/core/widgets/scaffold_app_bar.dart';
import 'package:zhwa/features/settings/ui/widgets/setting_content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: ScaffoldAppBar(title: 'ملفي الشخصي'),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0.h),
          child: Column(children: [SettingContent()]),
        ),
      ),
    );
  }
}
