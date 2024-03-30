import 'package:boilerplate/presentation/5_browse_project_flow/project_detail.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/project_view_item.dart';
import 'package:flutter/material.dart';

import 'candidate_list.dart';
import 'detail.dart';

class SendHireOffer extends StatefulWidget {
  final ProjectItem projectItem;

  const SendHireOffer({
    Key? key,
    required this.projectItem,
  }) : super(key: key);

  @override
  _SendHireOffer createState() => _SendHireOffer();
}

class _SendHireOffer extends State<SendHireOffer>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  // late final ProjectItem projectItem;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
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
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CandidateList(),
          Detail(),
          Center(child: Text('Content of Tab 3')),
          Center(child: Text('Content of Tab 4')),
        ],
      ),
    );
  }
}
