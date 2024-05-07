import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_interview_usecase.g.dart';

@JsonSerializable()
class DeleteInterviewParams {
  final int id;

  DeleteInterviewParams({
    required this.id,
  });

  factory DeleteInterviewParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteInterviewParamsFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteInterviewParamsToJson(this);
}

class DeleteInterviewUseCase implements UseCase<dynamic, DeleteInterviewParams> {
  final UserRepository _userRepository;

  DeleteInterviewUseCase(this._userRepository);

  @override
  Future<dynamic> call({required DeleteInterviewParams params}) async {
    return _userRepository.deleteInterview(params);
  }
}
