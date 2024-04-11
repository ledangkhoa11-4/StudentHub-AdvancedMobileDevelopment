import 'dart:convert';
import 'dart:ffi';

import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class PostProjectStep4 extends StatefulWidget {
  final FormPostProjectStore formStore;

  PostProjectStep4({Key? key, required this.formStore}) : super(key: key);
  @override
  State<PostProjectStep4> createState() => _PostProjectStep4State();
}

class _PostProjectStep4State extends State<PostProjectStep4> {
  @override
  void initState() {
    print(widget.formStore);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tooltipController = JustTheController();
    QuillController _controller = QuillController(
        document: Document.fromJson(jsonDecode(widget.formStore.description)),
        selection: const TextSelection.collapsed(offset: 0));

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PostProjectStepper(activeStep: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Project details:",
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
                        "Review the project information carefully, you can return to the previous steps to edit",
                      ], "Note:"),
                    ),
                  )
                ],
              ),
              Text(
                "Project title: ",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${widget.formStore.title}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: CustomPaint(
                  painter: PointedLinePainter(
                      MediaQuery.of(context).size.width - 40, context),
                ),
              ),
              Text(
                "Description: ",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              QuillProvider(
                configurations: QuillConfigurations(
                  controller: _controller,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
                child: QuillEditor.basic(
                  configurations: const QuillEditorConfigurations(
                    readOnly: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: CustomPaint(
                  painter: PointedLinePainter(
                      MediaQuery.of(context).size.width - 40, context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    BootstrapIcons.alarm,
                    size: 16,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Project scope: ",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '${widget.formStore.duration}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    BootstrapIcons.people_fill,
                    size: 16,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Students required: ",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '${widget.formStore.numberStudents} student(s)',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SizedBox(height: 40,),
              RoundedButtonWidget(
                buttonText: "Post project",
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}