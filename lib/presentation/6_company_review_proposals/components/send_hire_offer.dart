import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/custom_bottom_sheet.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

import 'candidate_list.dart';
import 'detail.dart';

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

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                text: "Proposals",
              ),
              Tab(
                text: "Detail",
              ),
              Tab(
                text: "Message",
              ),
              Tab(
                text: "Hired",
              ),
            ],
            labelStyle: TextStyle(fontSize: 12),
          )),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CandidateList(),
          Detail(),
          Center(child: Text('Content of Tab 3')),
          Center(child: Text('Content of Tab 4')),
        ],
      ),
      // bottomSheet: CustomBottomSheetContent(
      //   switchTab: switchTab,
      //   project: widget.project,
      // ),
    );
  }
}
