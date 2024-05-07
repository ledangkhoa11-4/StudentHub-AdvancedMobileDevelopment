// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_interview_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInterviewParams _$UpdateInterviewParamsFromJson(
        Map<String, dynamic> json) =>
    UpdateInterviewParams(
      id: json['id'] as int,
      title: json['title'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$UpdateInterviewParamsToJson(
        UpdateInterviewParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
    };
