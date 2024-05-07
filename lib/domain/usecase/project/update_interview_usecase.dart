import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_interview_usecase.g.dart';

@JsonSerializable()
class UpdateInterviewParams {
  final int id;
  final String title;
  final DateTime startTime;
  final DateTime endTime;

  UpdateInterviewParams(
      {required this.id,
      required this.title,
      required this.startTime,
      required this.endTime,});

  factory UpdateInterviewParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateInterviewParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInterviewParamsToJson(this);
}

class UpdateInterviewUseCase implements UseCase<dynamic, UpdateInterviewParams> {
  final UserRepository _userRepository;

  UpdateInterviewUseCase(this._userRepository);

  @override
  Future<dynamic> call({required UpdateInterviewParams params}) async {
    return _userRepository.updateInterview(params);
  }
}
