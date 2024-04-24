import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/send_hire_offer.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/post_project.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/project/project.dart';
int WORKING_MODE = 1;
int ACHIEVED_MODE = 2;

class CustomBottomSheetContent extends StatefulWidget {
  final Project project;

  const CustomBottomSheetContent({super.key, required this.project});

  @override
  State<CustomBottomSheetContent> createState() =>
      _CustomBottomSheetContentState();
}

class _CustomBottomSheetContentState extends State<CustomBottomSheetContent> {
  final ProjectStore _projectStore = getIt<ProjectStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(
              BootstrapIcons.people,
              size: 20,
            ),
            title: Text(AppLocalizations.of(context).translate('view_proposals'),
                style: TextStyle(
                  fontSize: 16,
                )),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 0);
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.chat_left_text, size: 20),
            title: Text(AppLocalizations.of(context).translate('view_messages'),
                style: TextStyle(
                  fontSize: 16,
                )),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 2);
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.person_workspace, size: 20),
            title: Text(AppLocalizations.of(context).translate('view_hired'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 3);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: CustomPaint(
              painter: PointedLinePainter(
                  MediaQuery.of(context).size.width - 30, context),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.eye, size: 20),
            title: Text(AppLocalizations.of(context).translate('view_project'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 1);
            },
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.pencil_square, size: 20),
            title: Text(AppLocalizations.of(context).translate('edit_project'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => PostProject(
                        projectEdit: widget.project,
                      )));
            },
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.x_square, size: 20),
            title: Text(AppLocalizations.of(context).translate('remove_project'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Warning!",
                      style: TextStyle(color: Colors.red),
                    ),
                    content:
                        Text("Are you sure you want to remove this project?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          _projectStore
                              .remove(int.parse(widget.project.id.toString()));
                          Navigator.pop(context); // Close the dialog
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Text("Remove"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: CustomPaint(
              painter: PointedLinePainter(
                  MediaQuery.of(context).size.width - 30, context),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.align_start, size: 20),
            title: Text(AppLocalizations.of(context).translate('start_pr'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Start Working Project",
                    ),
                    content: widget.project.countHired >=
                            widget.project.numberOfStudents
                        ? Text("Are you sure you want to start " +
                            widget.project.title.toString() +
                            " project?")
                        : Text("There are not enough students! Still start " +
                            widget.project.title.toString() +
                            " project?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Project newStatusProject = _constructProjectStatus(
                              widget.project, WORKING_MODE);
                          _projectStore.update(
                              widget.project!.id!, newStatusProject);
                          _projectStore.setSlideToIndex(1);

                          Navigator.pop(context); // Close the dialog
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.archive, size: 20),
            title: Text(AppLocalizations.of(context).translate('archive_pr'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Close Project",
                    ),
                    content: Text("Are you sure you want to close " +
                        widget.project.title.toString() +
                        " project?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Project newStatusProject = _constructProjectStatus(
                              widget.project, ACHIEVED_MODE);
                          _projectStore.update(
                              widget.project!.id!, newStatusProject);
                          _projectStore.setSlideToIndex(2);
                          Navigator.pop(context); // Close the dialog
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          // Text(
          //   'View proposals',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'View messages',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'View hired',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Divider(color: Colors.black, thickness: 1),
          // Text(
          //   'View job posting',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'Edit posting',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'Remove posting',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Divider(color: Colors.black, thickness: 1),
          // Text(
          //   'Start working on this project',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
        ],
      ),
    );
  }

  void navigateToSendHireOffer(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SendHireOffer(
        project: widget.project,
        initialTabIndex: index, // Pass initialTabIndex indicating the index tab
      ),
    ));
  }

  Project _constructProjectStatus(Project project, int newTypeFlag) {
    return Project(
      title: project.title,
      description: project.description,
      numberOfStudents: project.numberOfStudents,
      updatedAt: "",
      createdAt: "",
      companyId: project.companyId,
      typeFlag: newTypeFlag,
      projectScopeFlag: project.projectScopeFlag,
    );
  }
}
