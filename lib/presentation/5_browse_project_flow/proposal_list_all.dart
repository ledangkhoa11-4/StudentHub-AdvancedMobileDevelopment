import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_item_type2.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class ProposalListAll extends StatefulWidget {
  ProposalListAll({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProposalListAll> {
  final ProjectStore _projectStore = getIt<ProjectStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_projectStore.submitProposals == null &&
        _userStore.user!.student != null) {
      final GetSubmitProposalParams prms =
          GetSubmitProposalParams(studentId: _userStore.user!.student!.id!);
      _projectStore.getSubmitProposal(prms);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () {
              _projectStore.manualLoading = true;
              final GetSubmitProposalParams prms = GetSubmitProposalParams(
                  studentId: _userStore.user!.student!.id!);
              return _projectStore.getSubmitProposal(prms);
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ))
                  ],
                ),
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Observer(builder: (context) {
                        return IgnorePointer(
                          ignoring: _projectStore.submitProposals != null
                              ? _projectStore.submitProposals!
                                          .where((proposal) =>
                                              proposal.statusFlag ==
                                                  ProposalType.ACTIVE.value ||
                                              proposal.statusFlag ==
                                                  ProposalType.OFFER.value)
                                          .length >
                                      0
                                  ? false
                                  : true
                              : true,
                          child: ExpansionTile(
                            leading: Icon(BootstrapIcons.person_workspace),
                            collapsedShape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            title: Text(
                              "Active Proposal (${_projectStore.submitProposals != null ? _projectStore.submitProposals!.where((proposal) => proposal.statusFlag == ProposalType.ACTIVE.value || proposal.statusFlag == ProposalType.OFFER.value).length : 0})",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            children: [
                              if (_projectStore.submitProposals != null)
                                ..._projectStore.submitProposals!
                                    .where((proposal) =>
                                        proposal.statusFlag ==
                                            ProposalType.ACTIVE.value ||
                                        proposal.statusFlag ==
                                            ProposalType.OFFER.value)
                                    .map((proposal) =>
                                        ProjectItemType2(proposal: proposal))
                                    .toList()
                            ],
                          ),
                        );
                      }),
                      Observer(builder: (context) {
                        return IgnorePointer(
                          ignoring: _projectStore.submitProposals != null
                              ? _projectStore.submitProposals!
                                          .where((proposal) =>
                                              proposal.statusFlag !=
                                                  ProposalType.ACTIVE.value &&
                                              proposal.statusFlag !=
                                                  ProposalType.OFFER.value)
                                          .length >
                                      0
                                  ? false
                                  : true
                              : true,
                          child: ExpansionTile(
                            leading: Icon(BootstrapIcons.bookmark_star),
                            collapsedShape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            title: Text(
                              "Submitted Proposal (${_projectStore.submitProposals != null ? _projectStore.submitProposals!.where((proposal) => proposal.statusFlag != ProposalType.ACTIVE.value && proposal.statusFlag != ProposalType.OFFER.value).length : 0})",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            children: [
                              if (_projectStore.submitProposals != null)
                                ..._projectStore.submitProposals!
                                    .where((proposal) =>
                                        proposal.statusFlag !=
                                            ProposalType.ACTIVE.value &&
                                        proposal.statusFlag !=
                                            ProposalType.OFFER.value)
                                    .map((proposal) =>
                                        ProjectItemType2(proposal: proposal))
                                    .toList()
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Observer(builder: (context) {
            return Visibility(
              visible: _projectStore.isLoading && !_projectStore.manualLoading,
              child: CustomProgressIndicatorWidget(),
            );
          }),
          // Observer(builder: (context) {
          //   return !_projectStore.isLoading && _projectStore.deleted == true
          //       ? reloadProject(context)
          //       : SizedBox.shrink();
          // }),
        ],
      ),
    );
  }

  Widget reloadProject(BuildContext context) {
    final GetSubmitProposalParams prms =
        GetSubmitProposalParams(studentId: _userStore.user!.student!.id!);
    _projectStore.getSubmitProposal(prms);
    return SizedBox.shrink();
  }
}
