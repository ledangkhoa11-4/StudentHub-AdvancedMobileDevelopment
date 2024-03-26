// models.dart

import 'package:flutter/material.dart';

class ChatMessage {
  final String dateSent;
  final String timeSent;
  final String content;
  final IconData userIcon;
  final String userName;

  ChatMessage({
    required this.dateSent,
    required this.timeSent,
    required this.content,
    this.userIcon = Icons.account_circle, // Default icon
    required this.userName,
  });
}

class Meeting {
  final String dateSent;
  final String timeSent;
  final String title;
  late final bool isCancelled;
  final DateTime startTime;
  final DateTime endTime;

  Meeting({
    required this.title,
    required this.dateSent,
    required this.timeSent,
    required this.isCancelled,
    required this.startTime,
    required this.endTime,
  });
}
