import 'package:boilerplate/presentation/alert/components/action_notification.dart';
import 'package:boilerplate/presentation/alert/components/chat_notification.dart';
import 'package:boilerplate/presentation/alert/components/invite_notification.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context, titleWidget: Text("Notifications")),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ActionNotification(),
            SizedBox(height: 20,),
            ChatNotification(),
            SizedBox(height: 20,),
            InviteNotification()
            
          ],
        ),
      ),
    );
  }
}
