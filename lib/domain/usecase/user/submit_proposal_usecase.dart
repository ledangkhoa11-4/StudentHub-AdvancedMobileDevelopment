import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_proposal_usecase.g.dart';

@JsonSerializable()
class SubmitProposalParams {
  final int studentId;
  final int projectId;
  final String coverLetter;

  SubmitProposalParams({
    required this.studentId,
    required this.projectId,
    required this.coverLetter,
  });

  factory SubmitProposalParams.fromJson(Map<String, dynamic> json) =>
      _$SubmitProposalParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitProposalParamsToJson(this);
}

class SubmitProposalUseCase implements UseCase<dynamic, SubmitProposalParams> {
  final UserRepository _userRepository;

  SubmitProposalUseCase(this._userRepository);

  @override
  Future<dynamic> call({required SubmitProposalParams params}) async {
    return _userRepository.submitProposal(params);
  }
}
