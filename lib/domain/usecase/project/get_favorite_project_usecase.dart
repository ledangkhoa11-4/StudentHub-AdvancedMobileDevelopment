import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_favorite_project_usecase.g.dart';

@JsonSerializable()
class GetFavoriteProjectParam {
}

class GetFavoriteProjectUseCase implements UseCase<dynamic, void> {
  final ProjectRepository _projectRepository;

  GetFavoriteProjectUseCase(this._projectRepository);

  @override
  Future<ProjectList?> call({required params}) async {
    return _projectRepository.getFavoriteProjects();
  }
}
