import 'package:boilerplate/domain/entity/chat/chat.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_chat_by_projectid_usecase.g.dart';

@JsonSerializable()
class ProjectIdParam {
  final int projectId;

  ProjectIdParam({required this.projectId});

  factory ProjectIdParam.fromJson(Map<String, dynamic> json) =>
      _$ProjectIdParamFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectIdParamToJson(this);
}

class GetAllChatByProjectUseCase implements UseCase<List<ChatEntity>, ProjectIdParam> {
  final UserRepository _userRepository;

  GetAllChatByProjectUseCase(this._userRepository);

  @override
  Future<List<ChatEntity>> call({required ProjectIdParam params}) async {
    return _userRepository.getAllChatByProjectId(params);
  }
}