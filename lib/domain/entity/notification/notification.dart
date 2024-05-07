import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/interview/interview.dart';
import 'package:boilerplate/domain/entity/meeting_room/meeting_room.dart';
import 'package:boilerplate/domain/entity/user/user.dart';

enum TypeNotifyFlag { OFFER, INTERVIEW, SUBMITTED, CHAT }

extension TypeNotifyFlagExtension on TypeNotifyFlag {
  int get value {
    switch (this) {
      case TypeNotifyFlag.OFFER:
        return 0;
      case TypeNotifyFlag.INTERVIEW:
        return 1;
      case TypeNotifyFlag.SUBMITTED:
        return 2;
      case TypeNotifyFlag.CHAT:
        return 3;
      default:
        return -1;
    }
  }
}

class AppNotification {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int receiverId;
  final int senderId;
  final int messageId;
  final String title;
  final String notifyFlag;
  final String typeNotifyFlag;
  final String content;
  final NotificationMessage message;
  final User sender;
  final User receiver;

  AppNotification({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.receiverId,
    required this.senderId,
    required this.messageId,
    required this.title,
    required this.notifyFlag,
    required this.typeNotifyFlag,
    required this.content,
    required this.message,
    required this.sender,
    required this.receiver,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      receiverId: json['receiverId'],
      senderId: json['senderId'],
      messageId: json['messageId'],
      title: json['title'],
      notifyFlag: json['notifyFlag'],
      typeNotifyFlag: json['typeNotifyFlag'],
      content: json['content'],
      message: NotificationMessage.fromJson(json['message']),
      sender: User.fromMap(json['sender']),
      receiver: User.fromMap(json['receiver']),
    );
  }
}

class NotificationMessage {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int senderId;
  final int receiverId;
  final int projectId;
  final int? interviewId;
  final String content;
  final int messageFlag;
  final Interview? interview;


  NotificationMessage({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.senderId,
    required this.receiverId,
    required this.projectId,
    required this.interviewId,
    required this.content,
    required this.messageFlag,
    required this.interview,

  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) {
    return NotificationMessage(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      projectId: json['projectId'],
      interviewId: json['interviewId'],
      content: json['content'],
      messageFlag: json['messageFlag'],
      interview: json['interview'] != null ? Interview.fromJson(json['interview']) : null,
    );
  }
}
