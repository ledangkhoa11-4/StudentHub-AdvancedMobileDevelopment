import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_project_usecase.g.dart';


@JsonSerializable()
class GetAllProjectParams {
  final String? title;
  final int? projectScopeFlag;
  final int? numberOfStudents;
  final int? proposalsLessThan;
  int? page;
  int? perPage;

  GetAllProjectParams({
    this.title,
    this.projectScopeFlag,
    this.numberOfStudents,
    this.proposalsLessThan,
    this.page,
    this.perPage,
  });

  factory GetAllProjectParams.fromJson(Map<String, dynamic> json) =>
      _$GetAllProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProjectParamsToJson(this);
}

class GetAllProjectUseCase extends UseCase<ProjectList, GetAllProjectParams> {
  final ProjectRepository _projectRepository;

  GetAllProjectUseCase(this._projectRepository);

  @override
  Future<ProjectList> call({required GetAllProjectParams params}) {
    return _projectRepository.getAllProject(params);
  }
}
