// chat_message.dart

import 'package:flutter/material.dart';
import 'models.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class ChatMessageObj extends StatelessWidget {
  final ChatMessage message;

  ChatMessageObj(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Icon(
              message.userIcon,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      message.userName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(width: 8),
                    Text(
                      message.timeSent,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(message.content),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
