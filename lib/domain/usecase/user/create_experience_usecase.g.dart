// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_experience_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceParam _$ExperienceParamFromJson(Map<String, dynamic> json) =>
    ExperienceParam(
      title: json['title'] as String,
      startMonth: json['startMonth'] as String,
      endMonth: json['endMonth'] as String,
      description: json['description'] as String,
      skillSets:
          (json['skillSets'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ExperienceParamToJson(ExperienceParam instance) =>
    <String, dynamic>{
      'title': instance.title,
      'startMonth': instance.startMonth,
      'endMonth': instance.endMonth,
      'description': instance.description,
      'skillSets': instance.skillSets,
    };

CreateExperiencesParams _$CreateExperiencesParamsFromJson(
        Map<String, dynamic> json) =>
    CreateExperiencesParams(
      experience: (json['experience'] as List<dynamic>)
          .map((e) => ExperienceParam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateExperiencesParamsToJson(
        CreateExperiencesParams instance) =>
    <String, dynamic>{
      'experience': instance.experience,
    };
