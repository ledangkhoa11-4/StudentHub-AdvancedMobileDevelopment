// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_favorite_project_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFavoriteProjectParams _$UpdateFavoriteProjectParamsFromJson(
        Map<String, dynamic> json) =>
    UpdateFavoriteProjectParams(
      projectId: json['projectId'] as int,
      disableFlag: json['disableFlag'] as int,
    );

Map<String, dynamic> _$UpdateFavoriteProjectParamsToJson(
        UpdateFavoriteProjectParams instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'disableFlag': instance.disableFlag,
    };
