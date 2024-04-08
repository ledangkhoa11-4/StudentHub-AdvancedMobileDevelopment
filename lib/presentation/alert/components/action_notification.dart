import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActionNotification extends StatefulWidget {
  const ActionNotification({Key? key}) : super(key: key);

  @override
  State<ActionNotification> createState() => _ActionNotificationState();
}

class _ActionNotificationState extends State<ActionNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  "06/12/2023",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
                Text(
                    "You have Invited to Intervlew for project \"Javls - AI Copllot\" at 14:00 March 20, Thursday",
                    style: Theme.of(context).textTheme.labelSmall!),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 150,
                  child: RoundedButtonWidget(
                    buttonText: "Join",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
