import 'dart:convert';

import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/submit_screen.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectDetail extends StatefulWidget {
  final Project project;

  const ProjectDetail({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuillController? _controller;
    final ProjectStore _projectStore = getIt<ProjectStore>();
    bool isLiked = widget.project.isFavorite == true ? true : false;

    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(widget.project.description)),
          selection: const TextSelection.collapsed(offset: 0));

      _controller = controller;
    } catch (e) {
      _controller = null;
    }

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: Text("Project ${widget.project.title}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Project name: ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.project.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: CustomPaint(
                painter: PointedLinePainter(
                    MediaQuery.of(context).size.width - 40, context),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Students are looking for:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            if (_controller != null)
              IgnorePointer(
                ignoring: true,
                child: QuillProvider(
                  configurations: QuillConfigurations(
                    controller: _controller,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('en'),
                    ),
                  ),
                  child: QuillEditor.basic(
                    configurations: const QuillEditorConfigurations(
                      readOnly: true,
                    ),
                  ),
                ),
              ),
            if (_controller == null)
              Text(
                widget.project.description,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(),
              ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: CustomPaint(
                painter: PointedLinePainter(
                    MediaQuery.of(context).size.width - 40, context),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(BootstrapIcons.calendar2_week, size: 25),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project scope:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                          '• ${ProjectScopeType.fromValue(widget.project.projectScopeFlag)}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(BootstrapIcons.people_fill, size: 25),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of students:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child:
                          Text('• ${widget.project.numberOfStudents} students',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(), // Add spacer to push buttons to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButtonWidget(
                  buttonText: "Apply proposal",
                  buttonColor: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubmitScreen(
                          project: widget.project,
                        ),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _projectStore.updateLikeProkect(widget.project, !isLiked);
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Text(widget.project.isFavorite == true
                      ? 'Unlike it'
                      : 'Like it'),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
