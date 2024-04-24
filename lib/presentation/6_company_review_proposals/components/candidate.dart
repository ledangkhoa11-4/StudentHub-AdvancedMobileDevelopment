import 'dart:convert';

import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Candidate extends StatefulWidget {
  final ProposalNoProjectVariable proposal;

  Candidate({Key? key, required this.proposal}) : super(key: key);

  @override
  _CandidateState createState() => _CandidateState();
}

class _CandidateState extends State<Candidate> {
  bool isOfferSent = false;

  @override
  Widget build(BuildContext context) {
    QuillController? _controller;

    try {
      final controller = QuillController(
          document: Document.fromJson(jsonDecode(widget.proposal.coverLetter)),
          selection: const TextSelection.collapsed(offset: 0));

      _controller = controller;
    } catch (e) {
      _controller = null;
    }
    return Card(
      color: Colors.white,
      // constraints: BoxConstraints.expand(height: 20),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    width: 60,
                    Assets.studentAvatar,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hung Le',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '4th year student',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fullstack Engineer',
                    style: Theme.of(context).textTheme.labelLarge),
                Text('Excellent',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
            SizedBox(height: 14.0),
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
                widget.proposal.coverLetter,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Message')),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text("Hired offer")),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  "Do you really want to send hired offer for student to do this project?",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isOfferSent = true;
                                      });
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text("Send"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(isOfferSent ? 'Sent hired offer' : 'Hire'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
