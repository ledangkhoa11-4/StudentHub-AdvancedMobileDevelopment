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

class CompanyArchievedProjectList extends StatefulWidget {
  CompanyArchievedProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<CompanyArchievedProjectList> {
  // late ProjectList _allProjects = ProjectList(projects: []);
  final ProjectStore _projectStore = getIt<ProjectStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_projectStore.projectList == null && _userStore.user!.company != null) {
      _projectStore.getProjects();
    }
  }

  // final List<Project> _allProjects2 = [
  //   Project(
  //     companyId: 1,
  //     projectScopeFlag: 0,
  //     typeFlag: 1,
  //     id: null,
  //     createdAt: '2024-01-01',
  //     updatedAt: null,
  //     deletedAt: null,
  //     title: 'UI/UX Dev',
  //     description:
  //         'Looking for experienced mobile developers. Experience with Flutter is a plus.',
  //     numberOfStudents: 4,
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final archievedProjects = _projectStore.projectList!.projects!
        .where((e) => e.typeFlag == 1)
        .toList();
    return Scaffold(
      body: Observer(
          builder: (context) => archievedProjects.length > 0
              ? Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Observer(builder: (context) {
                            return ListView.builder(
                              itemCount: archievedProjects.length ?? 0,
                              itemBuilder: (context, index) {
                                final project = archievedProjects![index];
                                // print(project.toMap());
                                // print("+++++++++++");
                                return ProjectItem(
                                  project: project,
                                  onLikeChanged: (bool) {},
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    Observer(builder: (context) {
                      return Visibility(
                        visible: _projectStore.isLoading,
                        child: CustomProgressIndicatorWidget(),
                      );
                    }),
                  ],
                )
              : NoProject(
                  title:
                      "No project found. \nLet's close your first project. Closed projects will be here.")),
    );
  }
}
