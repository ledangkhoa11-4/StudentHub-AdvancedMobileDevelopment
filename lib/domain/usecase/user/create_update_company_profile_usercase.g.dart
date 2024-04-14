// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_company_profile_usercase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateCompanyProfileParams _$CreateUpdateCompanyProfileParamsFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateCompanyProfileParams(
      uid: json['uid'] as int? ?? null,
      companyName: json['companyName'] as String,
      website: json['website'] as String,
      description: json['description'] as String,
      size: json['size'] as int,
    );

Map<String, dynamic> _$CreateUpdateCompanyProfileParamsToJson(
        CreateUpdateCompanyProfileParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'companyName': instance.companyName,
      'website': instance.website,
      'description': instance.description,
      'size': instance.size,
    };
