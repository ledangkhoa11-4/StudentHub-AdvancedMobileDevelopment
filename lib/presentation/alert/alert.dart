import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/notification/notification.dart';
import 'package:boilerplate/presentation/alert/components/action_notification.dart';
import 'package:boilerplate/presentation/alert/components/chat_notification.dart';
import 'package:boilerplate/presentation/alert/components/invite_notification.dart';
import 'package:boilerplate/presentation/alert/components/offer_notification.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AlertScreen extends StatefulWidget {
  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  final UserStore _userStore = getIt<UserStore>();
  final ProjectStore _projectStore = getIt<ProjectStore>();

  @override
  void initState() {
    if (_userStore.listNotifications == null) {
      _userStore.getAllNotifications();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          UserAppBar.buildAppBar(context, titleWidget: Text("Notifications")),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () {
              return _userStore.getAllNotifications(loading: false);
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              child: Observer(builder: (context) {
                final List<AppNotification> reverseNotification =
                    _userStore.listNotifications != null
                        ? _userStore.listNotifications!.reversed.toList()
                        : [];
                final List<int> alreadyChat = [];
                final List<int> alreadyInvite = [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...reverseNotification.where((e) {
                      if (e.typeNotifyFlag ==
                              TypeNotifyFlag.CHAT.value.toString() &&
                          alreadyChat.contains(e.senderId)) {
                        return false;
                      }
                      if (e.typeNotifyFlag ==
                          TypeNotifyFlag.CHAT.value.toString()) {
                        alreadyChat.add(e.senderId);
                        return true;
                      }
            
                      if (e.typeNotifyFlag ==
                              TypeNotifyFlag.INTERVIEW.value.toString() &&
                          alreadyInvite.contains(e.senderId)) {
                        return false;
                      }
                      if (e.typeNotifyFlag ==
                          TypeNotifyFlag.INTERVIEW.value.toString()) {
                        alreadyInvite.add(e.senderId);
                        return true;
                      }
            
                      if (e.typeNotifyFlag ==
                          TypeNotifyFlag.SUBMITTED.value.toString()) {
                        return true;
                      }
            
                      if (e.typeNotifyFlag ==
                          TypeNotifyFlag.OFFER.value.toString()) {
                        return true;
                      }
            
                      return false;
                    }).map((e) {
                      if (e.typeNotifyFlag ==
                          TypeNotifyFlag.CHAT.value.toString()) {
                        return ChatNotification(
                          noti: e,
                        );
                      } else if (e.typeNotifyFlag ==
                          TypeNotifyFlag.INTERVIEW.value.toString()) {
                        return InviteNotification(
                          noti: e,
                        );
                      } else if (e.typeNotifyFlag ==
                          TypeNotifyFlag.SUBMITTED.value.toString()) {
                        return SubmittedNotification(
                          noti: e,
                        );
                      } else if (e.typeNotifyFlag ==
                          TypeNotifyFlag.OFFER.value.toString()) {
                        return OfferNotification(
                          noti: e,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }).toList(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
            ),
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading || _projectStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
