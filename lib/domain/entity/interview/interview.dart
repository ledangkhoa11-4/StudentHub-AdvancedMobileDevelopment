import 'package:boilerplate/domain/entity/meeting_room/meeting_room.dart';

class Interview {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  String title;
  DateTime startTime;
  DateTime endTime;
  int disableFlag;
  int meetingRoomId;
  MeetingRoom meetingRoom;

  Interview({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.disableFlag,
    required this.meetingRoomId,
    required this.meetingRoom,
    this.deletedAt,
  });

  factory Interview.fromJson(Map<String, dynamic> json) {
    return Interview(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      title: json['title'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      disableFlag: json['disableFlag'],
      meetingRoomId: json['meetingRoomId'],
      meetingRoom: MeetingRoom.fromJson(json['meetingRoom'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'title': title,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'disableFlag': disableFlag,
      'meetingRoomId': meetingRoomId,
      'meetingRoom': meetingRoom.toJson(),
    };
  }
}