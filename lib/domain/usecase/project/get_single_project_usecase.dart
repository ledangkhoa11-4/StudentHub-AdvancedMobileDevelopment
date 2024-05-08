import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_single_project_usecase.g.dart';

@JsonSerializable()
class GetSingleProjectParams {
  final int id;

  GetSingleProjectParams({
    required this.id,
  });

  factory GetSingleProjectParams.fromJson(Map<String, dynamic> json) =>
      _$GetSingleProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetSingleProjectParamsToJson(this);
}

class GetSingleProjectUseCase extends UseCase<Project?, GetSingleProjectParams> {
  final ProjectRepository _projectRepository;

  GetSingleProjectUseCase(this._projectRepository);

  @override
  Future<Project?> call({required GetSingleProjectParams params}) {
    return _projectRepository.getSingleProject(params);
  }
}
