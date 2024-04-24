import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_list_type2.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'project_list.dart';

class DashBoardStudent extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardStudent>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
              Tab(icon: Icon(Icons.dashboard), text: AppLocalizations.of(context).translate('all_pr')),
              Tab(icon: Icon(Icons.settings), text: AppLocalizations.of(context).translate('working')),
              Tab(icon: Icon(Icons.sticky_note_2), text: AppLocalizations.of(context).translate('archieved')),
            ],
          )),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(10.0), // Example border radius
                ),
                child: Text(
                  AppLocalizations.of(context).translate('ac_proposal'),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // ProjectListType2(),
            ],
          ),
          Center(child: Text('Content of Tab 2')),
          Center(child: Text('Content of Tab 3')),
        ],
      ),
    );
  }
}
