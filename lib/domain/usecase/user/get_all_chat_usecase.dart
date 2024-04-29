import 'package:boilerplate/domain/entity/chat/chat.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_chat_usecase.g.dart';

@JsonSerializable()
class EmptyParam {}

class GetAllChatUseCase implements UseCase<List<ChatEntity>, void> {
  final UserRepository _userRepository;

  GetAllChatUseCase(this._userRepository);

  @override
  Future<List<ChatEntity>> call({required params}) async {
    return _userRepository.getAllChat();
  }
}
