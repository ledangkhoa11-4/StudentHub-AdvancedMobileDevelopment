// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_language_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageParams _$LanguageParamsFromJson(Map<String, dynamic> json) =>
    LanguageParams(
      languageName: json['languageName'] as String,
      level: json['level'] as String,
    );

Map<String, dynamic> _$LanguageParamsToJson(LanguageParams instance) =>
    <String, dynamic>{
      'languageName': instance.languageName,
      'level': instance.level,
    };

CreateLanguageParams _$CreateLanguageParamsFromJson(
        Map<String, dynamic> json) =>
    CreateLanguageParams(
      languages: (json['languages'] as List<dynamic>)
          .map((e) => LanguageParams.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateLanguageParamsToJson(
        CreateLanguageParams instance) =>
    <String, dynamic>{
      'languages': instance.languages,
    };
