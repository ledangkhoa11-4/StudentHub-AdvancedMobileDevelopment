import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/no-candidate.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'candidate.dart';
import 'package:boilerplate/domain/entity/project/project.dart';

class CandidateList extends StatefulWidget {
  final Project project;

  CandidateList({Key? key, required this.project}) : super(key: key);

  @override
  _CandidateListState createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  final ProjectStore _projectStore = getIt<ProjectStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final hiredCandidateList = widget.project.proposals
          .where((e) => e.statusFlag != ProposalType.HIRED.value)
          .toList();
      return _projectStore.projectList != null && hiredCandidateList.length > 0
          ? ListView.builder(
              itemCount: hiredCandidateList.length,
              itemBuilder: (context, index) {
                final proposal = hiredCandidateList[index];
                print(proposal.toJson());
                return Candidate(
                    studentId: proposal.studentId, proposal: proposal);
              },
            )
          : NoCandidate(title: "There are no proposals in this project");
    });
  }
}
