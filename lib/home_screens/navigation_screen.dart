
import 'package:flutter/material.dart';
import '../global_widgets/custom_icon.dart';
import '../utils/icons.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

double iconSize = 35;

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    // SplashScreen(),
    // WeatherScreen(),
    // NotificationScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, -2)),
          ],
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 50,
            currentIndex: currentIndex,
            onTap: (int newValue) {
              setState(() {
                currentIndex = newValue;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  tooltip: 'Home',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: home2.mode[currentIndex == 0 ? 0 : 1])),
              // BottomNavigationBarItem(
              //     label: 'Calender',
              //     tooltip: 'Calender',
              //     icon: CustomIcon(
              //         height: iconSize,
              //         iconName: calender2.mode[currentIndex == 1 ? 0 : 1])),
              // BottomNavigationBarItem(
              //     label: 'Notifications',
              //     tooltip: 'Notifications',
              //     icon: CustomIcon(
              //         height: iconSize,
              //         iconName:
              //             notifications2.mode[currentIndex == 2 ? 0 : 1])),
              BottomNavigationBarItem(
                  label: 'Settings',
                  tooltip: 'Settings',
                  icon: CustomIcon(
                      height: iconSize,
                      iconName: profile2.mode[currentIndex == 3 ? 0 : 1])),
            ]),
      ),
    );
  }
}
