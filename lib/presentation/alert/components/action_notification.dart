import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/notification/notification.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/send_hire_offer.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:moment_dart/moment_dart.dart';

class SubmittedNotification extends StatefulWidget {
  final AppNotification noti;

  const SubmittedNotification({Key? key, required this.noti}) : super(key: key);

  @override
  State<SubmittedNotification> createState() => _SubmittedNotificationState();
}

class _SubmittedNotificationState extends State<SubmittedNotification> {
  final ProjectStore _projectStore = getIt<ProjectStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _projectStore
            .getProjectById(widget.noti.proposal!.projectId)
            .then((value) {
          if (value != null) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SendHireOffer(
                project: value,
                initialTabIndex:
                    0, // Pass initialTabIndex indicating the index tab
              ),
            ));
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                width: 40,
                Assets.projectImage,
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
                    Moment(widget.noti.createdAt)
                        .toLocal()
                        .formatDateTimeShort(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                  Text(widget.noti.content,
                      style: Theme.of(context).textTheme.labelSmall!),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(""),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
