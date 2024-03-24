
import 'package:flutter/material.dart';

class UserAppBar {

  
  static PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Student Hub"),
      actions: buildActions(context),
    );
  }
  static List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      buildSettingButton(),
    ];
  }

   static Widget buildSettingButton() {
    return IconButton(
      onPressed: () {
        
      },
      icon: Icon(
        Icons.account_circle_rounded,
      ),
    );
  }
}
