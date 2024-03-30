import 'package:boilerplate/presentation/6_company_review_proposals/components/project_view_item.dart';
import 'package:flutter/material.dart';

class ProjectList extends StatefulWidget {
  ProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
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
    {
      'createdDate': '2024-03-10',
      'title': 'Data Science Enthusiast',
      'timeDuration': '3-6 months',
      'numberOfStudents': 2,
      'descriptions': [
        'Looking for data science students passionate about machine learning.',
        'Experience with Python and basic ML libraries required.'
      ],
      'proposal': '3 to 6 months engagement',
      'isLiked': true,
    },
    {
      'createdDate': '2024-04-05',
      'title': 'UX/UI Design Intern',
      'timeDuration': '1-2 months',
      'numberOfStudents': 1,
      'descriptions': [
        'Seeking a UX/UI design intern with a good eye for modern app design.',
        'Portfolio of past design projects preferred.'
      ],
      'proposal': '1 to 2 months',
      'isLiked': false,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _allProjects.length,
              itemBuilder: (context, index) {
                final project = _allProjects[index];
                return ProjectItem(
                  createdDate: project['createdDate'] as String,
                  title: project['title'] as String,
                  timeDuration: project['timeDuration'] as String,
                  numberOfStudents: project['numberOfStudents'] as int,
                  descriptions:
                      (project['descriptions'] as List).cast<String>(),
                  proposal: project['proposal'] as String,
                  isLiked: project['isLiked'] as bool,
                  onLikeChanged: (bool) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
