import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import 'package:json_annotation/json_annotation.dart';

part 'update_project_usecase.g.dart';

@JsonSerializable()
class UpdateProjectParams {
  final int id;
  final int companyId;
  final int projectScopeFlag;
  final int? typeFlag;
  final String title;
  final String description;
  final int numberOfStudents;

  UpdateProjectParams({
    required this.id,
    required this.companyId,
    required this.projectScopeFlag,
    required this.typeFlag,
    required this.title,
    required this.description,
    required this.numberOfStudents,
  });

  factory UpdateProjectParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProjectParamsToJson(this);
}


class UpdateProjectUseCase extends UseCase<dynamic, UpdateProjectParams> {
  final ProjectRepository _projectRepository;

  UpdateProjectUseCase(this._projectRepository);

  @override
  Future<dynamic> call({required UpdateProjectParams params}) {
    return _projectRepository.update(params);
  }
}
