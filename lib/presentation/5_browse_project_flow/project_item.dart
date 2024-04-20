import 'dart:convert';

import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:intl/intl.dart';
import 'project_detail.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final bool isLiked;
  final Function(bool) onLikeChanged;

  const ProjectItem({
    Key? key,
    required this.project,
    required this.isLiked,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatDate(String? isoDate) {
      if (isoDate == null) {
        return 'No date';
      }
      DateTime dateTime =
          DateFormat(("yyyy-MM-ddTHH:mm:ssZ")).parseUTC(isoDate).toLocal();
      return DateFormat('yyyy/MM/dd - HH:mm').format(dateTime);
    }

    QuillController? _controller;

    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(project.description)),
          selection: const TextSelection.collapsed(offset: 0));

      _controller = controller;
    } catch (e) {
      _controller = null;
    }

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProjectDetail(projectItem: this),
        //   ),
        // );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Created: ${formatDate(project.createdAt)}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.right,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      // Toggle the like status and notify the parent widget
                      onLikeChanged(!isLiked);
                    },
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                  text: 'Time: ',
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${ProjectScopeType.fromValue(project.projectScopeFlag)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: '${project.numberOfStudents} students',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' needed '),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'The project requires candidates:',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 14),
              ),
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
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                ),

              SizedBox(height: 8.0),
              // RichText(
              //   text: TextSpan(
              //     style: Theme.of(context).textTheme.bodyText2!.copyWith(
              //           color: grayColor,
              //           fontWeight: FontWeight.w100,
              //           fontSize: 14,
              //         ),
              //     text: 'Proposal: ',
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '${project.proposal}',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
