import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class TabData {
  const TabData({required this.icon, required this.text});

  final IconData icon;
  final String text;
}

class UserNavigationBar {
  static var bottomNavIndex = 0;
  static AnimatedBottomNavigationBar buildNavigationBar(BuildContext context,
      {void Function(void Function())? setState = null}) {
    final iconList = <TabData>[
      TabData(icon: BootstrapIcons.kanban, text: "Project"),
      TabData(icon: BootstrapIcons.clipboard_data, text: "Dashboard"),
      TabData(icon: BootstrapIcons.chat_dots, text: "Message"),
      TabData(icon: BootstrapIcons.bell, text: "Alert"),
    ];
    return AnimatedBottomNavigationBar.builder(
      height: 80,
      itemCount: iconList.length,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      shadow: BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.1,
        color: Colors.grey,
      ),
      tabBuilder: (int index, bool isActive) {
        return Transform.translate(
          offset: Offset(
              index == 1 || index == 2
                  ? index == 1
                      ? 20
                      : -20
                  : 0,
              0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index].icon,
                size: 24,
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 4),
              Text(
                iconList[index].text,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              )
            ],
          ),
        );
      },
      activeIndex: bottomNavIndex,
      onTap: (index) {
        bottomNavIndex = index;
        if (setState != null) {
          setState(() {});
        }
        ;
      },
    );
  }
}
