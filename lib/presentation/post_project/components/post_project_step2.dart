import 'dart:ffi';

import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class PostProjectStep2 extends StatefulWidget {
  final FormPostProjectStore formStore;

  PostProjectStep2({Key? key, required this.formStore}) : super(key: key);

  @override
  State<PostProjectStep2> createState() => _PostProjectStep2State();
}

class _PostProjectStep2State extends State<PostProjectStep2> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final TextEditingController _numberStudents = TextEditingController();

  // String currentOption = options[0];
  ProjectScope currentOption = ProjectScope.LessThanOneMonth;

  @override
  Widget build(BuildContext context) {
    final _tooltipController = JustTheController();

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
              Observer(
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PostProjectStepper(activeStep: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Estimate the scope of your job",
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
                              "Consider the size of your project and the timeline",
                            ], "Guidelines"),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "How long will your project take?",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (var option in ProjectScope.values)
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentOption = option;
                            widget.formStore.setProjectScopeFlag(option.value);
                          });
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          title: Text(option.nameFormatted),
                          leading: Radio(
                            value: option,
                            groupValue: currentOption,
                            onChanged: ((value) {
                              setState(() {
                                // currentOption = value.toString();
                                if (value != null) {
                                  currentOption = value;
                                }
                              });
                            }),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How many students do you want for this project?",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextFieldWidget(
                      hint: "Number of students",
                      inputType: TextInputType.number,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      icon: BootstrapIcons.people,
                      iconColor: _themeStore.darkMode
                          ? Colors.white70
                          : Colors.black54,
                      textController: _numberStudents,
                      errorText: widget.formStore.formErrorStore.numberStudents,
                      onChanged: (value) {
                        widget.formStore.setNumberStudents(
                            int.tryParse(_numberStudents.text) ?? 0);
                      },
                    ),
                    RoundedButtonWidget(
                      buttonText: "Next: Description",
                      buttonColor: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                      onPressed: () {
                        widget.formStore
                            .setDuration(currentOption.value.toString());
                        widget.formStore.validateNumberStudents(
                            int.tryParse(_numberStudents.text) ?? 0);

                        if (widget.formStore.formErrorStore.numberStudents ==
                            null) {
                          Navigator.of(context)
                              .pushNamed(Routes.postProjectStep3, arguments: {
                            'formStore': widget.formStore,
                          });
                        } else {
                          ToastHelper.error("Please enter required fields");
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
