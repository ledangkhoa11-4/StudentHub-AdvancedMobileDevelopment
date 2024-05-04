
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/notification/notification.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_list.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/dashboard.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/notification/notification_service.dart';
import 'package:boilerplate/utils/socket/socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:moment_dart/moment_dart.dart';

class AuthWidget extends StatefulWidget {
  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // check to see if already called api
    if (_userStore.isLoggedIn) {
      _userStore.getMe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        body: Stack(
          children: [
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _userStore.isLoading,
                  child: CustomProgressIndicatorWidget(),
                );
              },
            ),
            Observer(
              builder: (context) {
                return !_userStore.isLoading && _userStore.getMeSuccess == true
                    ? navigate(context)
                    : SizedBox.shrink();
              },
            ),
            Observer(
              builder: (context) {
                return !_userStore.isLoading && _userStore.getMeSuccess == false
                    ? navigateLogin(context)
                    : SizedBox.shrink();
              },
            ),
          ],
        ));
  }

  Widget navigate(BuildContext context) {
    getIt<SharedPreferenceHelper>().authToken.then((value) {
      if (value != null) {
        SocketService.connect(value);
        final socket = SocketService.socket;

        if (socket != null) {
          socket.on('NOTI_${_userStore.user!.id}', (data) {
            try {
              final notification =
                  AppNotification.fromJson(data["notification"]);
              _userStore.setReadChat(notification.message.projectId,
                  notification.message.senderId);
              if (notification.typeNotifyFlag ==
                  TypeNotifyFlag.CHAT.value.toString()) {
                NotificationService().showNotification(
                    id: notification.id,
                    title: 'New chat',
                    body:
                        '${notification.sender.fullname}: ${notification.message.content}',
                    payLoad:
                        "{'projectId':'${notification.message.projectId}', 'senderId':'${notification.message.senderId}', 'userName':'${notification.sender.fullname}'}");
              }

              if (notification.typeNotifyFlag ==
                  TypeNotifyFlag.INTERVIEW.value.toString()) {
                NotificationService().showNotification(
                    id: notification.id,
                    title: 'Interview scheduled',
                    body:
                        '${notification.sender.fullname}: ${notification.message.content}',
                    payLoad:
                        "{'projectId':'${notification.message.projectId}', 'senderId':'${notification.message.senderId}', 'userName':'${notification.sender.fullname}'}");

                if (notification.interview != null &&
                    notification.meetingRoom != null) {
                  final scheduleTime = Moment(notification.interview!.startTime
                      .subtract(const Duration(minutes: 10)));
                  if (scheduleTime.isFuture) {
                    print(
                        "scheduled at ${DateTime.parse(scheduleTime.toIso8601String())} ");
                    NotificationService().scheduleNotification(
                        id: notification.id + notification.interview!.id,
                        title: 'Interview coming up',
                        body:
                            'The interview for ${notification.interview!.title} is coming in 10 minutes',
                        payLoad:
                            "{'projectId':'${notification.message.projectId}', 'senderId':'${notification.message.senderId}', 'userName':'${notification.sender.fullname}'}",
                        scheduledNotificationDateTime:
                            DateTime.parse(scheduleTime.toIso8601String()));
                  }
                }
              }
            } catch (e) {
              print(e);
            }

            // _userStore.getAllNotifications(loading: false);

            // if (data["notification"]["messageId"] != null) {
            //   _userStore.getAllChatList(loading: false);
            // }
          });

          socket.on('ERROR', (data) {
            print(data.toString());
            ToastHelper.error(data["content"]);
          });
        }
      }
    });
    Future.delayed(Duration(milliseconds: 0), () {
      final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
      print(currentProfile);
      print("++++++++++++++++++++++++");
      if (currentProfile == UserRole.COMPANY.value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DashBoardCompany()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ProjectList()),
            (Route<dynamic> route) => false);
      }
      _userStore.resetGetMeSuccessState();
    });

    return Container();
  }

  Widget navigateLogin(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false);

      ToastHelper.error(AppLocalizations.of(context).translate('unk_err'));
    });

    return Container();
  }
}
