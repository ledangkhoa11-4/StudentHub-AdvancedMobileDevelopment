import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

class FindProjectByIdUseCase extends UseCase<List<Project>, int> {
  final ProjectRepository _projectRepository;

  FindProjectByIdUseCase(this._projectRepository);

  @override
  Future<List<Project>> call({required int params}) {
    return _projectRepository.findProjectById(params);
  }
}
