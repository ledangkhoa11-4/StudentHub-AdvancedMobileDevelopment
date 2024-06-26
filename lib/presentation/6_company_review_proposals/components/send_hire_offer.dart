import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/hired_candidate_list.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/project_message_list.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'candidate_list.dart';
import 'detail.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
class SendHireOffer extends StatefulWidget {
  final Project project;
  final int initialTabIndex;

  const SendHireOffer({
    Key? key,
    required this.project,
    required this.initialTabIndex,
  }) : super(key: key);

  @override
  _SendHireOffer createState() => _SendHireOffer();
}

class _SendHireOffer extends State<SendHireOffer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _userStore = getIt<UserStore>();

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
    _userStore.setCurrentChat(widget.project.id, null);

    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _userStore.setCurrentChat(null, null);

    super.dispose();
  }

  void switchTab(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text(widget.project.title),
          tabBar: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: AppLocalizations.of(context).translate('proposals'),
              ),
              Tab(
                text: AppLocalizations.of(context).translate('Detail'),
              ),
              Tab(
                text: AppLocalizations.of(context).translate('message'),
              ),
              Tab(
                text: AppLocalizations.of(context).translate('hired'),
              ),
            ],
            labelStyle: TextStyle(fontSize: 12),
          )),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: <Widget>[
              CandidateList(project: widget.project),
              Detail(
                project: widget.project,
              ),
              ProjectMessageList(),
              HiredCandidateList(project: widget.project),
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
      // bottomSheet: CustomBottomSheetContent(
      //   switchTab: switchTab,
      //   project: widget.project,
      // ),
    );
  }

  Widget popupMessage(bool? isSuccess, String msg) {
    if (!msg.isEmpty) {
      if (isSuccess == true) {
        ToastHelper.success(msg);
      } else {
        ToastHelper.error(msg);
      }
    }
    return SizedBox.shrink();
  }
}
