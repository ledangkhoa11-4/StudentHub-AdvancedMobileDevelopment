import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_usecase.g.dart';

@JsonSerializable()
class SendMessageParams {
  final int projectId;
  final int receiverId;
  final int senderId;
  final String content;
  final int messageFlag;

  SendMessageParams({
    required this.projectId,
    required this.receiverId,
    required this.senderId,
    required this.content,
    required this.messageFlag,
  });

  factory SendMessageParams.fromJson(Map<String, dynamic> json) =>
      _$SendMessageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageParamsToJson(this);
}

class SendMessageUseCase implements UseCase<dynamic, SendMessageParams> {
  final UserRepository _userRepository;

  SendMessageUseCase(this._userRepository);

  @override
  Future<dynamic> call({required SendMessageParams params}) async {
    return _userRepository.sendMessage(params);
  }
}
