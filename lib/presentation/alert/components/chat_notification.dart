import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class ChatNotification extends StatefulWidget {
  const ChatNotification({Key? key}) : super(key: key);

  @override
  State<ChatNotification> createState() => _ChatNotificationState();
}

class _ChatNotificationState extends State<ChatNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
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
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9')),
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
                  "06/12/2023",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
                Text("Khoa Le",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Text("Hello Khoa",
                    style: Theme.of(context).textTheme.labelSmall!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
