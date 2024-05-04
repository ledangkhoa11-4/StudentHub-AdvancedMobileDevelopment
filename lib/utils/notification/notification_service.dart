import 'dart:convert';

import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/message/message_detail.dart';
import 'package:boilerplate/presentation/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('student_hub_icon');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      final BuildContext? context = navigatorKey.currentContext;

      if (context != null && notificationResponse.payload != null) {
        final data =
            jsonDecode(notificationResponse.payload!.replaceAll("\'", "\""));
        try {
          final int? projectId = int.tryParse(data["projectId"]);
          final int? senderId = int.tryParse(data["senderId"]);
          final String? userName = data["userName"];

          final UserStore _userStore = getIt<UserStore>();
          if (senderId != null &&
              userName != null &&
              projectId != null &&
              (_userStore.currentChatProjectId != projectId ||
                  _userStore.currentChatUserId != senderId)) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return MessageDetail(
                    projectId: projectId, userId: senderId, userName: userName);
              }),
            );
          }
        } catch (e) {
          print(e);
        }
      }
    });
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  void onSelectedNotification(NotificationResponse notificationResponse) {
    print(notificationResponse);
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin
        .show(id, title, body, await notificationDetails(), payload: payLoad);
  }

  Future<void> cancelNotification({required int id}) async {
    return await notificationsPlugin.cancel(id);
  }

  Future scheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required DateTime scheduledNotificationDateTime}) async {
    try {
      final schedule = notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.parse(
              tz.local, scheduledNotificationDateTime.toString()),
          await notificationDetails(),
          androidAllowWhileIdle: true,
          payload: payLoad,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      return schedule;
    } catch (e) {
      print(e);
    }
  }
}
