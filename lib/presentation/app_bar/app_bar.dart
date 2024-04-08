import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/swicth_account.dart';
import 'package:flutter/material.dart';

class UserAppBar {
  static PreferredSizeWidget buildAppBar(BuildContext context,
      {TabBar? tabBar = null}) {
    return AppBar(
      title: Text("Student Hub"),
      actions: buildActions(context),
      bottom: tabBar,
    );
  }

  static List<Widget> buildActions(BuildContext context) {
    final UserStore _userStore = getIt<UserStore>();

    if (_userStore.isLoggedIn) {
      return <Widget>[
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
