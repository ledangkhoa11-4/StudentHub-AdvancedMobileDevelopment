// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_file_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileFileParams _$GetProfileFileParamsFromJson(
        Map<String, dynamic> json) =>
    GetProfileFileParams(
      studentId: json['studentId'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$GetProfileFileParamsToJson(
        GetProfileFileParams instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'type': instance.type,
    };
