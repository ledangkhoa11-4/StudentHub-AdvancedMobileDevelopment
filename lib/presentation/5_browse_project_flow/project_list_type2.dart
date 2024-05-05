import 'package:boilerplate/presentation/5_browse_project_flow/filter_table.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/project_item_type2.dart';
import 'package:flutter/material.dart';
import 'project_item.dart';

class ProjectListType2 extends StatefulWidget {
  ProjectListType2({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectListType2> {
  final List<Map<String, dynamic>> _allProjects = [
    {
      'createdDate': '2024-01-01',
      'title': 'Senior Mobile Dev',
      'timeDuration': '1-3 months',
      'numberOfStudents': 4,
      'descriptions': [
        'Looking for experienced mobile developers.',
        'Experience with Flutter is a plus.'
      ],
      'proposal': 'Less than 5 months',
      'isLiked': true,
    },
    {
      'createdDate': '2024-02-15',
      'title': 'Junior Web Developer',
      'timeDuration': '2-4 months',
      'numberOfStudents': 3,
      'descriptions': [
        'Seeking junior web developers with a knack for front-end design.',
        'Familiarity with React or Vue preferred.'
      ],
      'proposal': 'Up to 4 months',
      'isLiked': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _allProjects.length,
        itemBuilder: (context, index) {
          final project = _allProjects[index];
          return ProjectItemType2(
            createdDate: project['createdDate'] as String,
            title: project['title'] as String,
            timeDuration: project['timeDuration'] as String,
            numberOfStudents: project['numberOfStudents'] as int,
            descriptions: (project['descriptions'] as List).cast<String>(),
            proposal: project['proposal'] as String,
            isLiked: project['isLiked'] as bool,
            // Pass a function to handle the like status change
            onLikeChanged: (isLiked) {
              setState(() {
                project['isLiked'] = isLiked;
              });
            },
          );
        },
      ),
    );
  }
}
