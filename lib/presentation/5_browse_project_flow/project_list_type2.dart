import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_item_type2.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
class ProjectListType2 extends StatefulWidget {
  ProjectListType2({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectListType2> {
  final List<Project> _allProjects = [
    Project(
      companyId: 1,
      projectScopeFlag: 0,
      typeFlag: 1,
      id: 1,
      createdAt: '2024-01-01',
      updatedAt: null,
      deletedAt: null,
      title: 'Senior Mobile Dev',
      description:
          'Looking for experienced mobile developers. Experience with Flutter is a plus.',
      numberOfStudents: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _allProjects.length,
        itemBuilder: (context, index) {
          final project = _allProjects[index];
          return SizedBox.shrink();
        },
      ),
    );
  }
}
