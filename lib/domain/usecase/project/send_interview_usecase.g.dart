// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_interview_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendInterviewParams _$SendInterviewParamsFromJson(Map<String, dynamic> json) =>
    SendInterviewParams(
      projectId: json['projectId'] as int,
      receiverId: json['receiverId'] as int,
      senderId: json['senderId'] as int,
      content: json['content'] as String,
      title: json['title'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      meeting_room_code: json['meeting_room_code'] as String,
      meeting_room_id: json['meeting_room_id'] as String,
    );

Map<String, dynamic> _$SendInterviewParamsToJson(
        SendInterviewParams instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'content': instance.content,
      'title': instance.title,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'meeting_room_code': instance.meeting_room_code,
      'meeting_room_id': instance.meeting_room_id,
    };
