import 'dart:convert';

import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:moment_dart/moment_dart.dart';
// import 'project_detail.dart'; // Import the ProjectDetail page
import '../../domain/entity/project/project.dart';

class ProjectItemType2 extends StatelessWidget {
  final Proposal proposal;

  const ProjectItemType2({
    Key? key,
    required this.proposal,
  }) : super(key: key);

  UpdateProposalParam constructUpdateProposalParam(
      int statusFlag, int disableFlag) {
    return UpdateProposalParam(
      // proposalId: widget.proposal.id,
      projectId: this.proposal.projectId,
      studentId: this.proposal.studentId,
      coverLetter: this.proposal.coverLetter,
      statusFlag: statusFlag,
      disableFlag: disableFlag,
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserStore _userStore = getIt<UserStore>();

    QuillController? _controller;
    final _tooltipController = JustTheController();

    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(proposal.project.description)),
          selection: const TextSelection.collapsed(offset: 0));
      _controller = controller;
    } catch (e) {
      _controller = null;
    }

    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Submitted ${Moment(DateTime.parse(proposal.createdAt)).fromNow()}', // Placeholder for created date
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      proposal.project.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: 14),
              ),
              if (_controller != null)
                IgnorePointer(
                  ignoring: true,
                  child: QuillProvider(
                    configurations: QuillConfigurations(
                      controller: _controller,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('en'),
                      ),
                    ),
                    child: QuillEditor.basic(
                      configurations: const QuillEditorConfigurations(
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
              if (_controller == null)
                Text(
                  proposal.project.description,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                ),
              if (proposal.statusFlag == ProposalType.OFFER.value)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButtonWidget(
                          buttonText: "Accept hire request",
                          buttonColor: Theme.of(context).colorScheme.primary,
                          textColor: Colors.white,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(
                                      child: Text("Accept hire request")),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Do you really want to accept this hire request?",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              UpdateProposalParam
                                                  updatedProposal =
                                                  constructUpdateProposalParam(
                                                      ProposalType.OFFER.value,
                                                      0);
                                              _userStore.updateProposalById(
                                                  this.proposal.id,
                                                  updatedProposal);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Yes"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        JustTheTooltip(
                          controller: _tooltipController,
                          isModal: true,
                          child: IconButton(
                            icon: Icon(
                              Icons.help_outline_outlined,
                              size: 16,
                            ),
                            onPressed: () {
                              try {
                                _tooltipController.showTooltip();
                              } catch (e) {}
                            },
                          ),
                          content: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: UnorderedList([
                              "Congratulations, you have been invited by the company to join the project, click this button to agree to participate",
                            ], "Note:"),
                          ),
                        )
                      ],
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
