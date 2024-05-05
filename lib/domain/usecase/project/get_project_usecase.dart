import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

class GetProjectUseCase extends UseCase<ProjectList, void> {
  final ProjectRepository _projectRepository;

  GetProjectUseCase(this._projectRepository);

  @override
  Future<ProjectList> call({required params}) {
    return _projectRepository.getProjects();
  }
}
