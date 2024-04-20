import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import 'package:json_annotation/json_annotation.dart';

part 'start_working_project_usecase.g.dart';

@JsonSerializable()
class StartWorkingProjectParams {
  final int id;
  final int companyId;
  final int projectScopeFlag;
  final int? typeFlag;
  final String title;
  final String description;
  final int numberOfStudents;

  StartWorkingProjectParams({
    required this.id,
    required this.companyId,
    required this.projectScopeFlag,
    required this.typeFlag,
    required this.title,
    required this.description,
    required this.numberOfStudents,
  });

  factory StartWorkingProjectParams.fromJson(Map<String, dynamic> json) =>
      _$StartWorkingProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$StartWorkingProjectParamsToJson(this);
}

class UpdateProjectUseCase extends UseCase<dynamic, StartWorkingProjectParams> {
  final ProjectRepository _projectRepository;

  UpdateProjectUseCase(this._projectRepository);

  @override
  Future<dynamic> call({required StartWorkingProjectParams params}) {
    return _projectRepository.startWorkingProject(params);
  }
}
