import 'package:flutter/material.dart';
import 'components/chat_screen.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

void main() {
  runApp(Chat());
}

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalizations.of(context).translate('chat_app'),
      home: ChatScreen(),
    );
  }
}
