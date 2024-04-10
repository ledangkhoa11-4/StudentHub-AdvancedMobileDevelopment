import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/swicth_account.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

import 'switch_account_screen.dart';

class UserAppBar {
  static PreferredSizeWidget buildAppBar(BuildContext context,
      {TabBar? tabBar = null}) {
    return AppBar(
      title: Text("Student Hub"),
      actions: [
        ...buildActions(context),
        buildLeadingIcon(context),
      ],
      bottom: tabBar,
    );
  }

  static Widget buildLeadingIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigator.pushNamed(context, Routes.switchAccount);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SwitchAccountScreen(),
          ),
        );
      },
      icon: Icon(Icons.account_circle_rounded),
    );
  }

  static List<Widget> buildActions(BuildContext context) {
    final UserStore _userStore = getIt<UserStore>();

    if (_userStore.isLoggedIn) {
      return [
        buildSettingButton(context),
      ];
    } else {
      return [];
    }
  }

  static Widget buildSettingButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Switchaccount(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ));
      },
      icon: Icon(
        Icons.account_circle_rounded,
      ),
    );
  }
}
