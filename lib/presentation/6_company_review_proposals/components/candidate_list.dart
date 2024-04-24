import 'package:boilerplate/presentation/6_company_review_proposals/components/no-candidate.dart';
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
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => widget.project!.countProposals > 0
            ? ListView.builder(
                itemCount: widget.project!.countProposals,
                itemBuilder: (context, index) {
                  final proposal = widget.project.proposals[index];
                  return Candidate(proposal: proposal);
                },
              )
            : NoCandidate());
  }
}
