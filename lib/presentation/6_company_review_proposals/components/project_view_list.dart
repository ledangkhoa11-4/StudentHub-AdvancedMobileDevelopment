import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/project_view_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CompanyProjectList extends StatefulWidget {
  CompanyProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<CompanyProjectList> {
  // late ProjectList _allProjects = ProjectList(projects: []);
  final ProjectStore _projectStore = getIt<ProjectStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_projectStore.isLoading) {
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
    return Scaffold(
      body: Column(
        children: [
          // Text(_userStore.user!.company!.id.toString()),
          // Observer(builder: (context) {
          //   return Visibility(
          //     visible: _projectStore.isLoading,
          //     child: CustomProgressIndicatorWidget(),
          //   );
          // }),
          Expanded(
            child: Observer(builder: (context) {
              return ListView.builder(
                itemCount: _projectStore.projectList?.length ?? 0,
                itemBuilder: (context, index) {
                  final project = _projectStore.projectList![index];
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
    );
  }
}
