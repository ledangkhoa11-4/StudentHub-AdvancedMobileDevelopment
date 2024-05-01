import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../../../domain/entity/project/project.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class Detail extends StatelessWidget {
  final Project project;

  Detail({required this.project});

  @override
  Widget build(BuildContext context) {
    QuillController? _controller;

    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(project.description)),
          selection: const TextSelection.collapsed(offset: 0));

      _controller = controller;
    } catch (e) {
      _controller = null;
    }

    final projectScopeEnum = ProjectScope.values[project.projectScopeFlag];
    final formattedProjectScope = projectScopeEnum.nameFormatted;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider(color: Colors.black),
            SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).translate('stu_look_for'),
              style: TextStyle(
                fontSize: 18,
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
                project.description,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            SizedBox(height: 16),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_alarm_rounded, size: 40),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('pr_scope'),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(formattedProjectScope),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.people, size: 40),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('num_s'),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${project.numberOfStudents}'),
                  ],
                ),
              ],
            ),
            // Spacer(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         // Apply button pressed
            //       },
            //       child: Text('Post job'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
