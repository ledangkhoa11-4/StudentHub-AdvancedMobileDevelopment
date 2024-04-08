import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class SubmitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuillController _quillController = QuillController.basic();
    final _tooltipController = JustTheController();

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: QuillProvider(
        configurations: QuillConfigurations(
          controller: _quillController,
          sharedConfigurations: const QuillSharedConfigurations(
            locale: Locale('en'),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Project description:",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    JustTheTooltip(
                      controller: _tooltipController,
                      isModal: true,
                      child: IconButton(
                        icon: Icon(
                          Icons.help_outline_outlined,
                          size: 16,
                        ),
                        onPressed: () {
                          _tooltipController.showTooltip();
                        },
                      ),
                      content: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: UnorderedList([
                          "Describe why do you fit to this project",
                          "State your strengths",
                          "Experience that you have had",
                        ], "Hint:"),
                      ),
                    )
                  ],
                ),

              
                SizedBox(height: 10), // Add some space
                const QuillToolbar(
                  configurations: const QuillToolbarConfigurations(
                      fontSizesValues: const {
                        'Small': '8',
                        'Medium': '24.5',
                        'Large': '46',
                        'Clear': '14'
                      }),
                ),
                Expanded(
                  child: QuillEditor.basic(
                    configurations: const QuillEditorConfigurations(
                      readOnly: false,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add some space
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Submit proposal'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
