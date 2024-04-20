import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import 'package:json_annotation/json_annotation.dart';

part 'update_favorite_project_usecase.g.dart';

@JsonSerializable()
class UpdateFavoriteProjectParams {
  final int projectId;
  final int disableFlag; //0-LIKE 1-UNLIKE

  UpdateFavoriteProjectParams({
    required this.projectId,
    required this.disableFlag,
  });

  factory UpdateFavoriteProjectParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateFavoriteProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFavoriteProjectParamsToJson(this);
}


class UpdateFavoriteProjectUseCase extends UseCase<dynamic, UpdateFavoriteProjectParams> {
  final ProjectRepository _projectRepository;

  UpdateFavoriteProjectUseCase(this._projectRepository);

  @override
  Future<dynamic> call({required UpdateFavoriteProjectParams params}) {
    return _projectRepository.updateFavorite(params);
  }
}
