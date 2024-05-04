import 'dart:convert';

import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/submit_screen.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class ProjectDetail extends StatefulWidget {
  final Project project;
  final ProjectStore _projectStore = getIt<ProjectStore>();
  final UserStore _userStore = getIt<UserStore>();
  ProjectDetail({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget._projectStore.submitProposals == null &&
        widget._userStore.user!.student != null) {
      final GetSubmitProposalParams prms = GetSubmitProposalParams(
          studentId: widget._userStore.user!.student!.id!);
      widget._projectStore.getSubmitProposal(prms);
    }
  }

  @override
  Widget build(BuildContext context) {
    QuillController? _controller;

    bool isLiked = widget.project.isFavorite == true ? true : false;

    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(widget.project.description)),
          selection: const TextSelection.collapsed(offset: 0));

      _controller = controller;
    } catch (e) {
      _controller = null;
    }

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text( AppLocalizations.of(context).translate('project') + " ${widget.project.title}")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('Proj_name') + ": ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4,),
                      Expanded(
                        child: Text(
                          widget.project.title,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: CustomPaint(
                      painter: PointedLinePainter(
                          MediaQuery.of(context).size.width - 40, context),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).translate('stu_look_for'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
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
                      widget.project.description,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                    ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: CustomPaint(
                      painter: PointedLinePainter(
                          MediaQuery.of(context).size.width - 40, context),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(BootstrapIcons.calendar2_week, size: 25),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('pr_scope') + ": ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                                '• ${ProjectScopeType.fromValue(widget.project.projectScopeFlag)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(BootstrapIcons.people_fill, size: 25),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('num_s') +": ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                                '• ${widget.project.numberOfStudents} '+ AppLocalizations.of(context).translate('students'),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Observer(builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundedButtonWidget(
                          buttonText:
                              widget._projectStore.submitProposals != null &&
                                      widget._projectStore.submitProposals!.any(
                                          (proposal) =>
                                              proposal.project.id ==
                                              widget.project.id)
                                  ?  AppLocalizations.of(context).translate('alr_sub')
                                  :  AppLocalizations.of(context).translate('apl_pro'),
                          buttonColor: widget._projectStore.submitProposals !=
                                      null &&
                                  widget._projectStore.submitProposals!.any(
                                      (proposal) =>
                                          proposal.project.id ==
                                          widget.project.id)
                              ? Colors.grey
                              : Theme.of(context).colorScheme.primary,
                          textColor: Colors.white,
                          onPressed: () {
                            if (widget._projectStore.submitProposals != null &&
                                widget._projectStore.submitProposals!.any(
                                    (proposal) =>
                                        proposal.project.id ==
                                        widget.project.id)) {
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubmitScreen(
                                    project: widget.project,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget._projectStore
                                .updateLikeProkect(widget.project, !isLiked);
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Text(widget.project.isFavorite == true
                              ? AppLocalizations.of(context).translate('unk_like')
                              : AppLocalizations.of(context).translate('Like')),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Observer(builder: (context) {
            return Visibility(
              visible: widget._projectStore.isLoading,
              child: CustomProgressIndicatorWidget(),
            );
          }),
        ],
      ),
    );
  }
}
