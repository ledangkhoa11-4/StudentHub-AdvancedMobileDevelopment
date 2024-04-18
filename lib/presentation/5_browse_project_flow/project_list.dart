import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/filter_table.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'project_item.dart';

class ProjectList extends StatefulWidget {
  ProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final ProjectStore _projectStore = getIt<ProjectStore>();

  List<Project> _filteredProjects = [];
  bool _showLikedOnly = false;
  String _searchQuery = '';
  bool _isSearching = false;
  GetAllProjectParams _param = GetAllProjectParams();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_projectStore.allProjectList == null) {
      GetAllProjectParams prms = GetAllProjectParams();
      _projectStore.getAllProjects(prms);
    }
  }

  void _filterProjects({String query = ''}) {}

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () {
              _projectStore.manualLoading = true;
              return _projectStore.getAllProjects(_param);
            },
            child: Column(
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
                                _filterProjects(query: value);
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.black),
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
                          }
                        },
                        color: _isSearching ? Colors.black : Colors.red,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Observer(
                    builder: (context) => ListView.builder(
                      itemCount:
                          _projectStore.allProjectList?.projects?.length ?? 0,
                      itemBuilder: (context, index) {
                        final project = _projectStore.allProjectList![index];
                        return ProjectItem(
                          project: project,
                          isLiked: false,
                          onLikeChanged: (bool isLiked) {},
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible:
                    _projectStore.isLoading && !_projectStore.manualLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
