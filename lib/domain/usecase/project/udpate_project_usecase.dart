import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

class UpdateProjectUseCase extends UseCase<int, Project> {
  final ProjectRepository _projectRepository;

  UpdateProjectUseCase(this._projectRepository);

  @override
  Future<int> call({required Project params}) {
    return _projectRepository.update(params);
  }
}
