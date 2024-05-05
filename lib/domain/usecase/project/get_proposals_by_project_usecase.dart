import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_proposals_by_project_usecase.g.dart';

@JsonSerializable()
class GetProposalsByProjectParams {
  final int projectId;

  GetProposalsByProjectParams({
    required this.projectId,
  });

  factory GetProposalsByProjectParams.fromJson(Map<String, dynamic> json) =>
      _$GetProposalsByProjectParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetProposalsByProjectParamsToJson(this);
}

class GetProposalsByProjectUseCase implements UseCase<dynamic, GetProposalsByProjectParams> {
  final ProjectRepository _projectRepository;

  GetProposalsByProjectUseCase(this._projectRepository);

  @override
  Future<List<ProposalNoProjectVariable>> call({required GetProposalsByProjectParams params}) async {
    return _projectRepository.getProposalsByProject(params);
  }
}
