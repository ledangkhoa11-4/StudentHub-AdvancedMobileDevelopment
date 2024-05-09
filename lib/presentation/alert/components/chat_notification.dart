import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/notification/notification.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/message/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:transparent_image/transparent_image.dart';

class ChatNotification extends StatefulWidget {
  final AppNotification noti;
  const ChatNotification({Key? key, required this.noti}) : super(key: key);

  @override
  State<ChatNotification> createState() => _ChatNotificationState();
}

class _ChatNotificationState extends State<ChatNotification> {
  final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageDetail(
              projectId: widget.noti.message!.projectId,
              userId: widget.noti.senderId,
              userName: widget.noti.sender.fullname ?? "Chat",
            ),
          ),
        )
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      currentProfile == UserRole.COMPANY.value
                          ? Assets.studentAvatar
                          : Assets.companyAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Moment(widget.noti.message!.createdAt)
                        .toLocal()
                        .formatDateTimeShort(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                  Text(widget.noti.sender.fullname!,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(widget.noti.message!.content,
                      style: Theme.of(context).textTheme.labelSmall!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
