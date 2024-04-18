// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_student_profile_usercase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateStudentProfileParams _$CreateUpdateStudentProfileParamsFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateStudentProfileParams(
      uid: json['uid'] as int? ?? null,
      techStackId: json['techStackId'] as int,
      skillSets:
          (json['skillSets'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$CreateUpdateStudentProfileParamsToJson(
        CreateUpdateStudentProfileParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'techStackId': instance.techStackId,
      'skillSets': instance.skillSets,
    };
