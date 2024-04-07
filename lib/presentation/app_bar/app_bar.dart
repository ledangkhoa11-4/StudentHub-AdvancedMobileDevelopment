import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:flutter/material.dart';


class UserAppBar {
  static PreferredSizeWidget buildAppBar(BuildContext context, {TabBar? tabBar = null}) {
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
        buildSettingButton(),
      ];
    } else {
      return [];
    }
  }

  static Widget buildSettingButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.account_circle_rounded,
      ),
    );
  }
}
