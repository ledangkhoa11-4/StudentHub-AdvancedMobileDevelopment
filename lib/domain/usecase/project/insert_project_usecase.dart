import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_project_usecase.g.dart';

@JsonSerializable()
class InsertProjectParams {
  final int companyId;
  final int projectScopeFlag;
  final int typeFlag;
  final String title;
  final String description;
  final int numberOfStudents;

  InsertProjectParams({
    required this.companyId,
    required this.projectScopeFlag,
    required this.typeFlag,
    required this.title,
    required this.description,
    required this.numberOfStudents,
  });

  factory InsertProjectParams.fromJson(Map<String, dynamic> json) =>
      _$InsertProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProjectParamsToJson(this);
}

class InsertProjectUseCase implements UseCase<dynamic, InsertProjectParams> {
  final ProjectRepository _projectRepository;

  InsertProjectUseCase(this._projectRepository);

  @override
  Future<Project> call({required InsertProjectParams params}) {
    return _projectRepository.insert(params);
  }
}
