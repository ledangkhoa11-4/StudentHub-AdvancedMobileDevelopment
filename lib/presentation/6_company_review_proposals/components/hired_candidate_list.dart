import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/no-candidate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'candidate.dart';
import 'package:boilerplate/domain/entity/project/project.dart';

class HiredCandidateList extends StatefulWidget {
  final Project project;

  HiredCandidateList({Key? key, required this.project}) : super(key: key);

  @override
  _HiredCandidateListState createState() => _HiredCandidateListState();
}

class _HiredCandidateListState extends State<HiredCandidateList> {
  @override
  Widget build(BuildContext context) {
    final hiredCandidateList = widget.project.proposals
        .where((e) => e.statusFlag == ProposalType.HIRED.value)
        .toList();
    return Observer(
        builder: (context) => hiredCandidateList.length > 0
            ? ListView.builder(
                itemCount: hiredCandidateList.length,
                itemBuilder: (context, index) {
                  final proposal = hiredCandidateList[index];
                  return Candidate(
                      studentId: proposal.studentId, proposal: proposal);
                },
              )
            : NoCandidate(title: "There are no hired student in this project"));
  }
}
