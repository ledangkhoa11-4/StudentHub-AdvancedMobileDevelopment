import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_item_type2.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/no-project.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class ProposalListArchived extends StatefulWidget {
  ProposalListArchived({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProposalListArchived> {
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
                  child: Observer(builder: (context) {
                    final archivedProposal = _projectStore.submitProposals
                        ?.where((proposal) =>
                            proposal.project.typeFlag ==
                            ProjectType.ARCHIVED.value)
                        .toList();
                    return archivedProposal != null &&
                            archivedProposal!.length > 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...archivedProposal
                                  .map((proposal) =>
                                      ProjectItemType2(proposal: proposal))
                                  .toList()
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Center(
                                child: ClipRRect(
                                  child: Image.asset(
                                    Assets.noData,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "There are no archived project",
                                  style: Theme.of(context).textTheme.labelLarge,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          );
                  }),
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
