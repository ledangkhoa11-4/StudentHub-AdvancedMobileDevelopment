import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_interview_usecase.g.dart';

@JsonSerializable()
class SendInterviewParams {
  final int projectId;
  final int receiverId;
  final int senderId;
  final String content;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String meeting_room_code;
  final String meeting_room_id;

  SendInterviewParams(
      {required this.projectId,
      required this.receiverId,
      required this.senderId,
      required this.content,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.meeting_room_code,
      required this.meeting_room_id});

  factory SendInterviewParams.fromJson(Map<String, dynamic> json) =>
      _$SendInterviewParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SendInterviewParamsToJson(this);
}

class SendInterviewUseCase
    implements UseCase<dynamic, SendInterviewParams> {
  final UserRepository _userRepository;

  SendInterviewUseCase(this._userRepository);

  @override
  Future<dynamic> call({required SendInterviewParams params}) async {
    return _userRepository.sendInterview(params);
  }
}
