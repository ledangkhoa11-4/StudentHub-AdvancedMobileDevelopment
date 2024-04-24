import 'dart:convert';

import 'package:boilerplate/presentation/6_company_review_proposals/components/custom_bottom_sheet.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/send_hire_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:intl/intl.dart';
import '../../../domain/entity/project/project.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final Function(bool) onLikeChanged;

  const ProjectItem({
    Key? key,
    required this.project,
    required this.onLikeChanged,
  }) : super(key: key);

  String formatDate(String? isoDate) {
    if (isoDate == null) {
      return 'No date';
    }
    DateTime dateTime = DateTime.parse(isoDate);
    return DateFormat('yyyy/MM/dd - HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // final Color greenColor = Color.fromARGB(255, 48, 121, 51);
    final Color grayColor = const Color.fromARGB(255, 134, 132, 132);

    // print("///////////////////");
    // print(isJsonString(project.description));
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SendHireOffer(
              project: project,
              initialTabIndex: 0,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4, bottom: 16.0, left: 16, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.segment_rounded),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomBottomSheetContent(
                            project: project,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context).translate('Created') + ' : ' + formatDate('${project!.createdAt}'),
                style: TextStyle(
                    color: grayColor,
                    fontSize: 12,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context).translate('find') + ' ${project.numberOfStudents} '+ AppLocalizations.of(context).translate('students_cre'),
                style: Theme.of(context).textTheme.titleSmall,
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
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${project.countProposals}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        AppLocalizations.of(context).translate('Proposals'),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    children: [
                      Text('${project.countMessages}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        AppLocalizations.of(context).translate('messages'),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    children: [
                      Text('${project.countHired}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        AppLocalizations.of(context).translate('hired'),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
