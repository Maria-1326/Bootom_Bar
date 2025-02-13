import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talkiam/View/Home/Chat/messages.dart';
import 'package:talkiam/View/Home/Notification/notification.dart';
import 'package:talkiam/View/Home/Profile/profile.dart';
import 'package:talkiam/View/Home/DashBoard/home.dart';
import 'package:talkiam/core/utils/Themes/app_color.dart';
import 'package:talkiam/core/utils/Themes/app_images.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  _BottomBarCusState createState() => _BottomBarCusState();
}

class _BottomBarCusState extends State<BottomBarPage> {
  int selectedIndex = 0;

  final List<Widget> classes = [
    HomePage(),
    Messages(),
    NotificationScreen(),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: classes[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              AppColors.primaryColor2,
              AppColors.primaryColor,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(AppImages.home, AppImages.homeSelected, 0),
                buildNavItem(AppImages.chat, AppImages.chatSelected, 1),
                buildNavItem(
                    AppImages.notification, AppImages.notificationSelected, 2),
                buildNavItem(AppImages.profile, AppImages.profileSelected, 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String icon, String selectedIcon, int index) {
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: SvgPicture.asset(
        selectedIndex == index ? selectedIcon : icon,
      ),
    );
  }
}

