import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/widgets/app_bottom_sheet.dart';
import 'package:zhwa/features/home/ui/widgets/change_your_location.dart';
import 'package:zhwa/features/settings/ui/widgets/change_your_mobile.dart';
import 'package:zhwa/features/settings/ui/widgets/settings_group.dart';
import 'package:zhwa/features/settings/ui/widgets/settings_title.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTitle(title: 'المعلومات الشخصية', icon: Iconsax.user_cirlce_add),
        SizedBox(height: 16.h),
        SettingsGroup(
          items: [
            SettingsItem(
              title: "جوالي",
              iconName: Iconsax.mobile,
              onTap: () {
                AppBottomSheet.show(
                  context: context,
                  child: ChangeYourMobile(),
                );
              },
            ),
            SettingsItem(
              title: "موقعي",
              iconName: Iconsax.location,
              onTap: () {
                AppBottomSheet.show(
                  context: context,
                  child: ChangeYourLocation(),
                );
              },
            ),
          ],
          showDividers: true,
        ),
        SizedBox(height: 24.h),
        SettingTitle(title: 'الخصوصية', icon: Iconsax.security_safe),
        SizedBox(height: 16.h),
        SettingsGroup(
          items: [
            SettingsItem(
              title: 'الوصول للموقع',
              iconName: Iconsax.safe_home,
              onTap: () {},
            ),
            SettingsItem(
              title: 'سياسة الخصوصية',
              iconName: Iconsax.shield_tick,
              onTap: () {},
            ),
            SettingsItem(
              title: 'الإشعارات',
              iconName: Iconsax.notification,
              onTap: () {},
            ),
          ],
          showDividers: true,
        ),
      ],
    );
  }
}
