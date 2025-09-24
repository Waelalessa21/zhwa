import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhwa/core/theming/app_colors.dart';
import 'package:zhwa/features/home/ui/home_screen.dart';
import 'package:zhwa/features/orders/ui/orders_screen.dart';
import 'package:zhwa/features/settings/ui/settings_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _goToBranch(int index) {}

  List<Widget> _getScreens() {
    return [HomeScreen(), OrdersScreen(), SettingsScreen()];
  }

  @override
  Widget build(BuildContext context) {
    final screens = _getScreens();
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.appGreen,
          unselectedItemColor: AppColors.triadic1,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11.sp,
          unselectedFontSize: 11.sp,
          onTap: (index) {
            setState(() => _selectedIndex = index);

            _goToBranch(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22.w,
                height: 22.h,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 0
                        ? AppColors.appGreen
                        : AppColors.appGreen.withOpacity(0.2),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset('assets/icons/home.png'),
                ),
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22.w,
                height: 22.h,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 1
                        ? AppColors.appGreen
                        : AppColors.appGreen.withOpacity(0.2),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset('assets/icons/home.png'),
                ),
              ),
              label: 'طلباتي',
            ),

            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22.w,
                height: 22.h,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? AppColors.appGreen
                        : AppColors.appGreen.withOpacity(0.2),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset('assets/icons/more.png'),
                ),
              ),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }
}
