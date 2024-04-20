import 'dart:async';

import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/post/post.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../entity/project/project.dart';

class RemoveProjectUseCase extends UseCase<dynamic, int> {
  final ProjectRepository _postRepository;

  RemoveProjectUseCase(this._postRepository);

  @override
  Future<dynamic> remove({required int id}) {
    return _postRepository.remove(id);
  }

  @override
  FutureOr call({required int params}) {
    return _postRepository.remove(params);
  }
}
