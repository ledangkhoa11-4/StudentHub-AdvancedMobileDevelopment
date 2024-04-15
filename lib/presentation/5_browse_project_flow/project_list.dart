import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/filter_table.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'project_item.dart';

class ProjectList extends StatefulWidget {
  ProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final List<Project> _allProjects = [
    Project(
      companyId: 1,
      projectScopeFlag: 0,
      typeFlag: 1,
      id: 1,
      createdAt: '2024-01-01',
      updatedAt: null,
      deletedAt: null,
      title: 'Senior ABC Banking Dev',
      description:
          'Looking for experienced mobile developers. Experience with Flutter is a plus.',
      numberOfStudents: 4,
    ),
  ];

  List<Project> _filteredProjects = [];
  bool _showLikedOnly = false;
  String _searchQuery = '';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredProjects = _allProjects;
  }

  void _toggleShowLiked() {
    setState(() {
      _showLikedOnly = !_showLikedOnly;
      // _filterProjects();
    });
  }

  // void _filterProjects({String query = ''}) {
  //   final lowerCaseQuery = query.toLowerCase();
  //   setState(() {
  //     if (query.isNotEmpty) {
  //       _isSearching = true;
  //     } else {
  //       _isSearching = false;
  //     }
  //     if (_showLikedOnly) {
  //       _filteredProjects = _allProjects.where((project) {
  //         final titleLower = project.title.toLowerCase();
  //         // return project.isLiked && titleLower.contains(lowerCaseQuery);
  //       }).toList();
  //     } else {
  //       _filteredProjects = _allProjects.where((project) {
  //         final titleLower = project.title.toLowerCase();
  //         return titleLower.contains(lowerCaseQuery);
  //       }).toList();
  //     }
  //   });
  // }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FilterTable(
          onFilter: (projectLength, studentsNeeded, proposalsLessThan) {
            // Apply filter logic here
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text("Discovery Projects")),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
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
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          // _filterProjects(query: value);
                        });
                      },
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
                    _isSearching
                        ? Icons.filter_alt_outlined
                        : _showLikedOnly
                            ? Icons.favorite
                            : Icons.favorite_border,
                  ),
                  onPressed: () {
                    if (_isSearching) {
                      _showFilterDialog(context);
                    } else {
                      _toggleShowLiked();
                    }
                  },
                  color: _isSearching ? Colors.black : Colors.red,
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
                  project: project,
                  isLiked: false,
                  onLikeChanged: (bool isLiked) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
