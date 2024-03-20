import 'package:flutter/material.dart';
import 'project_item.dart';
import 'project_detail.dart';

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

  List<Map<String, dynamic>> _filteredProjects = [];
  bool _showLikedOnly = false;

  @override
  void initState() {
    super.initState();
    _filteredProjects = _allProjects;
  }

  void _toggleShowLiked() {
    setState(() {
      _showLikedOnly = !_showLikedOnly;
      _filterProjects();
    });
  }

  void _filterProjects({String query = ''}) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      if (_showLikedOnly) {
        _filteredProjects = _allProjects.where((project) {
          final titleLower = project['title'].toLowerCase();
          final matchesQuery = titleLower.contains(lowerCaseQuery);
          return project['isLiked'] && matchesQuery;
        }).toList();
      } else {
        _filteredProjects = _allProjects.where((project) {
          final titleLower = project['title'].toLowerCase();
          return titleLower.contains(lowerCaseQuery);
        }).toList();
      }
    });
  }

  // void _viewProjectDetail(String title, String description) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ProjectDetail(
  //         title: title,
  //         description: description,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Project List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      onChanged: (value) => _filterProjects(query: value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                      _showLikedOnly ? Icons.favorite : Icons.favorite_border),
                  onPressed: _toggleShowLiked,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProjects.length,
              itemBuilder: (context, index) {
                final project = _filteredProjects[index];
                return ProjectItem(
                  createdDate: project['createdDate'] as String,
                  title: project['title'] as String,
                  timeDuration: project['timeDuration'] as String,
                  numberOfStudents: project['numberOfStudents'] as int,
                  descriptions:
                      (project['descriptions'] as List).cast<String>(),
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
          ),
        ],
      ),
    );
  }
}
