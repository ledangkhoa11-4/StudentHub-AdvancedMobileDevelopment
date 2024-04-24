import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/filter_table.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'project_item.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
class ProjectList extends StatefulWidget {
  ProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final ProjectStore _projectStore = getIt<ProjectStore>();
  TextEditingController _controller = new TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_projectStore.allProjectList == null) {
      _projectStore.getAllProjects(_projectStore.globalGetAllProjectParams);
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
            _projectStore.setFilter(
                studentsNeeded, projectLength, proposalsLessThan);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text(AppLocalizations.of(context).translate('dis_pr'))),
      bottomNavigationBar:
          UserNavigationBar.buildNavigationBar(context, setState: setState),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () {
              _projectStore.manualLoading = true;
              return _projectStore
                  .getAllProjects(_projectStore.globalGetAllProjectParams);
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
                          child: Form(
                            child: InputHistoryTextField(
                              textEditingController: _controller,
                              textInputAction: TextInputAction.search,
                              historyKey: "01",
                              listStyle: ListStyle.List,
                              listRowDecoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 8),
                                ),
                              ),
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.black),
                                hintText: AppLocalizations.of(context).translate('search'),
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                              ),
                              style: TextStyle(color: Colors.black),
                              onSubmitted: (value) {
                                _projectStore.setSearch(value);
                              },
                            ),
                          ),
                        ),
                      ),
                      Observer(builder: (context) {
                        return IconButton(
                          icon: Icon(
                            _projectStore.globalGetAllProjectParams.title !=
                                    null
                                ? Icons.filter_alt_outlined
                                : _projectStore.showLikedOnly
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                          ),
                          onPressed: () {
                            if (_projectStore.globalGetAllProjectParams.title !=
                                null) {
                              _showFilterDialog(context);
                            } else {
                              _projectStore
                                  .setShowLike(!_projectStore.showLikedOnly);
                            }
                          },
                          color:
                              _projectStore.globalGetAllProjectParams.title !=
                                      null
                                  ? Colors.black
                                  : Colors.red,
                        );
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: Observer(
                    builder: (context) => _projectStore.showLikedOnly
                        ? _projectStore.onlyLikeProject != null &&
                                _projectStore
                                        .onlyLikeProject!.projects!.length >
                                    0
                            ? ListView.builder(
                                itemCount: _projectStore
                                        .onlyLikeProject?.projects?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final project =
                                      _projectStore.onlyLikeProject![index];
                                  return ProjectItem(
                                    project: project,
                                    isLiked: project.isFavorite ?? false,
                                    onLikeChanged: (bool isLiked) {
                                       _projectStore.updateLikeProkect(project, isLiked);
                                    },
                                  );
                                },
                              )
                            : Center(
                                child: Text(_projectStore.isLoading
                                    ? ""
                                    : "No project found"),
                              )
                        : _projectStore.allProjectList != null &&
                                _projectStore.allProjectList!.projects!.length >
                                    0
                            ? ListView.builder(
                                itemCount: _projectStore
                                        .allProjectList?.projects?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final project =
                                      _projectStore.allProjectList![index];
                                  return ProjectItem(
                                    project: project,
                                    isLiked: project.isFavorite ?? false,
                                    onLikeChanged: (bool isLiked) {
                                      _projectStore.updateLikeProkect(project, isLiked);
                                    },
                                  );
                                },
                              )
                            : Center(
                                child: Text(_projectStore.isLoading
                                    ? ""
                                    : "No project found"),
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
