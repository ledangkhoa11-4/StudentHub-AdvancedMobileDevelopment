import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/meeting_room/meeting_room.dart';
import 'package:boilerplate/domain/entity/notification/notification.dart';
import 'package:boilerplate/domain/usecase/user/check_room_available_usercase.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/presentation/video_call/video_conference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:moment_dart/moment_dart.dart';

class InviteNotification extends StatefulWidget {
  final AppNotification noti;

  const InviteNotification({Key? key, required this.noti}) : super(key: key);

  @override
  State<InviteNotification> createState() => _InviteNotificationState();
}

class _InviteNotificationState extends State<InviteNotification> {
  final _userStore = getIt<UserStore>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              width: 40,
              Assets.inviteImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Moment(widget.noti.createdAt).toLocal().formatDateShort(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
                Text(
                    "${AppLocalizations.of(context).translate('act_notif_text')} ${widget.noti.interview?.title ?? ""} at ${Moment(widget.noti.interview?.startTime ?? DateTime.now()).toLocal().formatDateTimeShort()}",
                    style: Theme.of(context).textTheme.labelSmall!),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 150,
                  child: RoundedButtonWidget(
                    buttonText: AppLocalizations.of(context).translate('join'),
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      _onJoinMeeting(
                          widget.noti.interview, widget.noti.meetingRoom);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onJoinMeeting(NotificationInterview? interview, MeetingRoom? room) {
    if (interview != null && room != null) {
      _userStore
          .checkRoomAvailability(CheckRoomAvailabilityParams(
              meeting_room_code: room.meetingRoomCode,
              meeting_room_id: room.meetingRoomId))
          .then((value) {
        if (value == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return VideoConferencePage(
                conferenceID: room.meetingRoomId.replaceAll("-", "_"),
                title: interview.title,
              );
            }),
          );
        } else {
          ToastHelper.error("Room not available");
        }
      });
    }
  }
}
