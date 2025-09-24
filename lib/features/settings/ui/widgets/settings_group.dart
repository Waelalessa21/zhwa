import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/settings/ui/widgets/settings_container.dart';

class SettingsGroup extends StatelessWidget {
  final List<SettingsItem> items;
  final bool showDividers;
  final double spacing;

  const SettingsGroup({
    super.key,
    required this.items,
    this.showDividers = false,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: showDividers ? AppColors.white : null,
        borderRadius: showDividers ? BorderRadius.circular(18.r) : null,
        boxShadow: showDividers
            ? [
                BoxShadow(
                  color: AppColors.appGreen.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: List.generate(items.length * 2 - 1, (index) {
          if (showDividers && index.isOdd) {
            return Divider(
              color: AppColors.offWhite,
              height: 1,
              thickness: 1,
              indent: 16.w,
              endIndent: 16.w,
            );
          }

          final itemIndex = index ~/ 2;
          return SettingsContainer(
            title: items[itemIndex].title,
            iconName: items[itemIndex].iconName,
            onTap: items[itemIndex].onTap,
            transparent: showDividers,
          );
        }),
      ),
    );
  }
}

class SettingsItem {
  final String title;
  final IconData iconName;
  final Function() onTap;

  const SettingsItem({
    required this.title,
    required this.iconName,
    required this.onTap,
  });
}
