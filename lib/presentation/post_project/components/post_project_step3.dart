import 'dart:convert';
import 'dart:ffi';

import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class PostProjectStep3 extends StatefulWidget {
  final FormPostProjectStore formStore;

  PostProjectStep3({Key? key, required this.formStore}) : super(key: key);

  @override
  State<PostProjectStep3> createState() => _PostProjectStep3State();
}

class _PostProjectStep3State extends State<PostProjectStep3> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  QuillController _quillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PostProjectStepper(activeStep: 2),
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
                        "Clear expectation about your project or dellverables",
                        "The skills required for your project",
                        "Detall about your project",
                      ], "Example: Students are looking for:"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const QuillToolbar(configurations:  const QuillToolbarConfigurations(
                fontSizesValues: const {'Small': '8', 'Medium': '24.5', 'Large': '46', 'Clear': '14'}
              ),),
              Expanded(
                child: QuillEditor.basic(
                  configurations: const QuillEditorConfigurations(
                    readOnly: false,
                  ),
                ),
              ),
              RoundedButtonWidget(
                buttonText: "Final: Review your post",
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {
                  widget.formStore.setDescription(
                      jsonEncode(_quillController.document.toDelta().toJson()));
                  Navigator.of(context)
                      .pushNamed(Routes.postProjectStep4, arguments: {
                    'formStore': widget.formStore,
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
