import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_list.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/student_dashboard.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/dashboard.dart';
import 'package:boilerplate/presentation/alert/alert.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/message/message.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class TabData {
  const TabData({required this.icon, required this.text, required this.screen});

  final IconData icon;
  final String text;
  final Widget screen;
}

class UserNavigationBar {
  static var bottomNavIndex = 0;
  static AnimatedBottomNavigationBar buildNavigationBar(BuildContext context,
      {void Function(void Function())? setState = null}) {
    final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
    final isStudent = currentProfile == UserRole.STUDENT.value;

    final iconList = <TabData>[
      TabData(
          icon: BootstrapIcons.kanban,
          text: AppLocalizations.of(context).translate('project'),
          screen: isStudent ? ProjectList() : DashBoardCompany()),
      TabData(
          icon: BootstrapIcons.clipboard_data,
          text: AppLocalizations.of(context).translate('dashboard'),
          screen: isStudent ? DashBoardStudent() : DashBoardCompany()),
      TabData(
          icon: BootstrapIcons.chat_dots,
          text: AppLocalizations.of(context).translate('message'),
          screen: MessageScreen()),
      TabData(
          icon: BootstrapIcons.bell,
          text: AppLocalizations.of(context).translate('alert'),
          screen: AlertScreen()),
    ];
    return AnimatedBottomNavigationBar.builder(
      backgroundColor: Theme.of(context).colorScheme.background,
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
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  iconList[index].screen,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
            (Route<dynamic> route) => false);
        if (setState != null) {
          setState(() {});
        }
        ;
      },
    );
  }
}
