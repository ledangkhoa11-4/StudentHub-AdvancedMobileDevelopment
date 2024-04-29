import 'package:boilerplate/domain/entity/chat/chatUser.dart';
import 'package:boilerplate/domain/entity/project/project.dart';

class ChatEntity {
  final int id;
  final DateTime createdAt;
  final String content;
  final ChatUser sender;
  final ChatUser receiver;
  final String? interview;
  final Project? project;

  ChatEntity({
    required this.id,
    required this.createdAt,
    required this.content,
    required this.sender,
    required this.receiver,
    this.interview,
    this.project,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'content': content,
      'sender': sender.toMap(),
      'receiver': receiver.toMap(),
      'interview': interview,
      'project': project != null ? project!.toMap() : null,
    };
  }

  static ChatEntity fromMap(Map<String, dynamic> map) {
    return ChatEntity(
      id: map['id'],
      createdAt: DateTime.parse(map['createdAt']),
      content: map['content'],
      sender: ChatUser.fromMap(map['sender']),
      receiver: ChatUser.fromMap(map['receiver']),
      interview: map['interview'],
      project: map['project'] != null ? Project.fromMap(map['project']) : null,
    );
  }
}