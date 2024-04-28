import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_proposal_usecase.g.dart';

@JsonSerializable()
class UpdateProposalParam {
  int projectId;
  int studentId;
  String coverLetter;
  int statusFlag;
  int disableFlag;

  UpdateProposalParam({
    required this.projectId,
    required this.studentId,
    required this.coverLetter,
    required this.statusFlag,
    required this.disableFlag,
  });

  factory UpdateProposalParam.fromJson(Map<String, dynamic> json) =>
      _$UpdateProposalParamFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProposalParamToJson(this);
}

class UpdateProposalUseCase implements UseCase<dynamic, UpdateProposalParam> {
  final UserRepository _userRepository;

  UpdateProposalUseCase(this._userRepository);

  @override
  Future<dynamic> call({required UpdateProposalParam params}) async {
    return _userRepository.updateProposal(params);
  }

  Future<dynamic> updateProposalById(
      {required int proposalId, required UpdateProposalParam params}) async {
    return _userRepository.updateProposalById(proposalId, params);
  }
}
