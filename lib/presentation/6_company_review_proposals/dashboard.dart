import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/archieved_projects_list.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/project_view_list.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/working_projects_list.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class DashBoardCompany extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardCompany>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late final FormPostProjectStore formStore;
  final UserStore _userStore = getIt<UserStore>();

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
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context).translate('dashboard')),
            ],
          ),
          tabBar: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text:AppLocalizations.of(context).translate('all_pr')),
              Tab(
                  icon: Icon(BootstrapIcons.gear_wide_connected),
                  text: AppLocalizations.of(context).translate('working')),
              Tab(icon: Icon(BootstrapIcons.archive), text: AppLocalizations.of(context).translate('archieved')),
            ],
          )),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          BootstrapIcons.plus,
          size: 30,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () {
          if (_userStore.user?.company != null) {
            Navigator.pushNamed(context, Routes.postProject);
          } else {
            ToastHelper.error(AppLocalizations.of(context).translate('com_pro_dash_text'));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Observer(builder: (context) {
        return TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(child: CompanyProjectList()),
            Center(child: CompanyWorkingProjectList()),
            Center(child: CompanyArchievedProjectList()),
          ],
        );
      }),
    );
  }
}
