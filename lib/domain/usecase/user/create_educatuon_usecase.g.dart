// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_educatuon_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationParam _$EducationParamFromJson(Map<String, dynamic> json) =>
    EducationParam(
      schoolName: json['schoolName'] as String,
      startYear: json['startYear'] as int,
      endYear: json['endYear'] as int,
    );

Map<String, dynamic> _$EducationParamToJson(EducationParam instance) =>
    <String, dynamic>{
      'schoolName': instance.schoolName,
      'startYear': instance.startYear,
      'endYear': instance.endYear,
    };

CreateEducationsParams _$CreateEducationsParamsFromJson(
        Map<String, dynamic> json) =>
    CreateEducationsParams(
      education: (json['education'] as List<dynamic>)
          .map((e) => EducationParam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateEducationsParamsToJson(
        CreateEducationsParams instance) =>
    <String, dynamic>{
      'education': instance.education,
    };
