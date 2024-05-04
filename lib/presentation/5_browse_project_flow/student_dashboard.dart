import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_list_type2.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/proposal_list_all.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/proposal_list_archived.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/proposal_list_working.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'project_list.dart';

class DashBoardStudent extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardStudent>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final _userStore = getIt<UserStore>();
  final ProjectStore _projectStore = getIt<ProjectStore>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text(AppLocalizations.of(context).translate('your_pr')),
          tabBar: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  icon: Icon(Icons.dashboard),
                  text: AppLocalizations.of(context).translate('all_pr')),
              Tab(
                  icon: Icon(Icons.settings),
                  text: AppLocalizations.of(context).translate('working')),
              Tab(
                  icon: Icon(
                    BootstrapIcons.archive_fill,
                    size: 20,
                  ),
                  text: AppLocalizations.of(context).translate('archieved')),
            ],
          )),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: <Widget>[
              ProposalListAll(),
              ProposalListWorking(),
              ProposalListArchived(),
            ],
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
          Observer(
            builder: (context) {
              return !_userStore.isLoading &&
                      _userStore.apiResponseSuccess != null
                  ? popupMessage(_userStore.apiResponseSuccess,
                      _userStore.apiResponseMessage)
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget popupMessage(bool? isSuccess, String msg) {
    if (!msg.isEmpty) {
      if (isSuccess == true) {
        final GetSubmitProposalParams prms =
            GetSubmitProposalParams(studentId: _userStore.user!.student!.id!);
        _projectStore.getSubmitProposal(prms);
        ToastHelper.success(msg);
      } else {
        ToastHelper.error(msg);
      }
    }
    _userStore.resetApiResponse();
    return SizedBox.shrink();
  }
}
