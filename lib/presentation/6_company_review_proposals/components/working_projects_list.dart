import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/no-project.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/project_view_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CompanyWorkingProjectList extends StatefulWidget {
  CompanyWorkingProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<CompanyWorkingProjectList> {
  final ProjectStore _projectStore = getIt<ProjectStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_projectStore.projectList == null && _userStore.user!.company != null) {
      _projectStore.getProjects();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          final workingProjects = _projectStore.projectList?.projects
                  ?.where((e) => e.typeFlag == 1)
                  .toList() ??
              [];

          return workingProjects.isNotEmpty
              ? Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (context) {
                              return ListView.builder(
                                itemCount: workingProjects.length,
                                itemBuilder: (context, index) {
                                  final project = workingProjects[index];
                                  return ProjectItem(
                                    project: project,
                                    onLikeChanged: (bool) {},
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Observer(
                      builder: (context) {
                        return Visibility(
                          visible: _projectStore.isLoading,
                          child: CustomProgressIndicatorWidget(),
                        );
                      },
                    ),
                    Observer(
                      builder: (context) {
                        return !_projectStore.isLoading &&
                                _projectStore.success == true
                            ? reloadProject(context)
                            : SizedBox.shrink();
                      },
                    ),
                  ],
                )
              : NoProject(
                  title:
                      "No project found. \nLet's kick off your first project",
                );
        },
      ),
    );
  }

  Widget reloadProject(BuildContext context) {
    _projectStore.getProjects();
    _projectStore.resetSuccess();
    return SizedBox.shrink();
  }
}
