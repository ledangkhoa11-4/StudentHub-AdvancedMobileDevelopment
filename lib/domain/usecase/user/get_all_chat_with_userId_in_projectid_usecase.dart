import 'package:boilerplate/domain/entity/chat/chat.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_chat_with_userId_in_projectid_usecase.g.dart';

@JsonSerializable()
class ProjectUserIdParam {
  final int projectId;
  final int userId;

  ProjectUserIdParam({required this.projectId, required this.userId});

  factory ProjectUserIdParam.fromJson(Map<String, dynamic> json) =>
      _$ProjectUserIdParamFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectUserIdParamToJson(this);
}

class GetAllChatWithUserInProjectUseCase implements UseCase<List<ChatEntity>, ProjectUserIdParam> {
  final UserRepository _userRepository;

  GetAllChatWithUserInProjectUseCase(this._userRepository);

  @override
  Future<List<ChatEntity>> call({required ProjectUserIdParam params}) async {
    return _userRepository.getAllWithUserIdChatByProjectId(params);
  }
}