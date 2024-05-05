import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_submit_proposal_usecase.g.dart';

@JsonSerializable()
class GetSubmitProposalParams {
  final int studentId;
  final int? statusFlag;

  GetSubmitProposalParams({
    required this.studentId,
    this.statusFlag,
  });

  factory GetSubmitProposalParams.fromJson(Map<String, dynamic> json) =>
      _$GetSubmitProposalParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetSubmitProposalParamsToJson(this);
}

class GetSubmitProposalUseCase implements UseCase<dynamic, GetSubmitProposalParams> {
  final ProjectRepository _projectRepository;

  GetSubmitProposalUseCase(this._projectRepository);

  @override
  Future<List<Proposal>> call({required GetSubmitProposalParams params}) async {
    return _projectRepository.getSubmitProposal(params);
  }
}
