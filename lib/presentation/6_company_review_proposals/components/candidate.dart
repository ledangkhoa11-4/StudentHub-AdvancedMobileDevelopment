import 'dart:convert';

import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
// import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/usecase/project/update_project_usecase.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/message/message_detail.dart';
import 'package:boilerplate/presentation/profile/company_review_profile_student.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Candidate extends StatefulWidget {
  final int studentId;
  final ProposalNoProjectVariable proposal;

  Candidate({Key? key, required this.studentId, required this.proposal})
      : super(key: key);

  @override
  _CandidateState createState() => _CandidateState();
}

class _CandidateState extends State<Candidate> {
  final UserStore _userStore = getIt<UserStore>();
  final ThemeStore _themeStore = getIt<ThemeStore>();
  bool isOfferSent = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if (_userStore.profileStudent == null) {
    //   _userStore.getTranscriptFileByStudentId(widget.studentId);
    // }
  }

  UpdateProposalParam constructUpdateProposalParam(
      int statusFlag, int disableFlag) {
    return UpdateProposalParam(
      // proposalId: widget.proposal.id,
      projectId: widget.proposal.projectId,
      studentId: widget.studentId,
      coverLetter: widget.proposal.coverLetter,
      statusFlag: statusFlag,
      disableFlag: disableFlag,
    );
  }

  @override
  Widget build(BuildContext context) {
    QuillController? _controller;
    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(widget.proposal.coverLetter)),
          selection: const TextSelection.collapsed(offset: 0));

      _controller = controller;
    } catch (e) {
      _controller = null;
    }
    return GestureDetector(
      // Wrap with GestureDetector
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CompanyReviewStudentProfile(proposal: widget.proposal),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.onBackground,
        // constraints: BoxConstraints.expand(height: 20),
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      width: 60,
                      Assets.studentAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.proposal.student.fullname.toString(),
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18),
                      ),
                      Text(
                        (widget.proposal.student.educations?.length ?? 0) > 0 ? widget.proposal.student.educations![widget.proposal.student.educations!.length - 1].schoolName : "", // 4th year student
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.proposal.student.techStack!.name.toString(),
                      style: Theme.of(context).textTheme.labelLarge),
                  Text(AppLocalizations.of(context).translate('excellent'),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontStyle: FontStyle.italic)),
                ],
              ),
              // SizedBox(height: 14.0),
              // Text("statusFlag: " + widget.proposal.statusFlag.toString()),
              SizedBox(height: 14.0),
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
                  widget.proposal.coverLetter,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              SizedBox(height: 14.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          foregroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessageDetail(
                              projectId: widget.proposal.projectId,
                              userId: widget.proposal.student.userId,
                              userName: widget.proposal.student.fullname!,
                            ),
                          ),
                        );
                      },
                      child: Text(
                          AppLocalizations.of(context).translate('message'))),
                  if (widget.proposal.statusFlag != ProposalType.HIRED.value)
                    ElevatedButton(
                      style: widget.proposal.statusFlag ==
                              ProposalType.OFFER.value
                          ? ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              foregroundColor: Colors.grey)
                          : ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        if (widget.proposal.statusFlag ==
                            ProposalType.OFFER.value) {
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Text(AppLocalizations.of(context)
                                      .translate('hired_offer'))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('candi_q'),
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
                                        child: Text(AppLocalizations.of(context)
                                            .translate('cancel')),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          UpdateProposalParam updatedProposal =
                                              constructUpdateProposalParam(
                                                  ProposalType.OFFER.value, 0);
                                          _userStore.updateProposalById(
                                              widget.proposal.id,
                                              updatedProposal);
                                          setState(() {
                                            isOfferSent = true;
                                          });
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text(AppLocalizations.of(context)
                                            .translate('send')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                          widget.proposal.statusFlag == ProposalType.OFFER.value
                              ? AppLocalizations.of(context)
                                  .translate('sent_hired_offer')
                              : AppLocalizations.of(context)
                                  .translate('hired_offer')),
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
