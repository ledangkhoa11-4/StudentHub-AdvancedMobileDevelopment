import 'dart:convert';

import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:moment_dart/moment_dart.dart';
// import 'project_detail.dart'; // Import the ProjectDetail page
import '../../domain/entity/project/project.dart';

class ProjectItemType2 extends StatelessWidget {
  final Proposal proposal;

  const ProjectItemType2({
    Key? key,
    required this.proposal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuillController? _controller;
    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(proposal.project.description)),
          selection: const TextSelection.collapsed(offset: 0));
      _controller = controller;
    } catch (e) {
      _controller = null;
    }

    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Submitted ${Moment(DateTime.parse(proposal.createdAt)).fromNow()}', // Placeholder for created date
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      proposal.project.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
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
                  proposal.project.description,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
