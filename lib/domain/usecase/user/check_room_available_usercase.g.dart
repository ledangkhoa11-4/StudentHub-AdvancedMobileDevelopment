// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_room_available_usercase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckRoomAvailabilityParams _$CheckRoomAvailabilityParamsFromJson(
        Map<String, dynamic> json) =>
    CheckRoomAvailabilityParams(
      meeting_room_code: json['meeting_room_code'] as String,
      meeting_room_id: json['meeting_room_id'] as String,
    );

Map<String, dynamic> _$CheckRoomAvailabilityParamsToJson(
        CheckRoomAvailabilityParams instance) =>
    <String, dynamic>{
      'meeting_room_code': instance.meeting_room_code,
      'meeting_room_id': instance.meeting_room_id,
    };
