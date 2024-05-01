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
import 'package:boilerplate/utils/locale/app_localization.dart';

class PostProjectStep2 extends StatefulWidget {
  final FormPostProjectStore formStore;
  final Project? projectEdit;

  PostProjectStep2({Key? key, required this.formStore, this.projectEdit})
      : super(key: key);

  @override
  State<PostProjectStep2> createState() => _PostProjectStep2State();
}

class _PostProjectStep2State extends State<PostProjectStep2> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final TextEditingController _numberStudents = TextEditingController();

  // String currentOption = options[0];
  ProjectScope currentOption = ProjectScope.LessThanOneMonth;

  @override
  void initState() {
    print(widget.projectEdit);
    if (widget.projectEdit != null) {
      _numberStudents.text = widget.projectEdit!.numberOfStudents.toString();
      widget.formStore.setNumberStudents(widget.projectEdit!.numberOfStudents);
      widget.formStore
          .setProjectScopeFlag(widget.projectEdit!.projectScopeFlag);
      currentOption = ProjectScopeType.getScropeFromValue(
          widget.projectEdit!.projectScopeFlag);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tooltipController = JustTheController();

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: widget.projectEdit != null
              ? Text(AppLocalizations.of(context).translate('edit')+ "\"${widget.projectEdit!.title}\""+ AppLocalizations.of(context).translate('project'))
              : Text(AppLocalizations.of(context).translate('post_new_pr'))),
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
                          AppLocalizations.of(context).translate('es_scope'),
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
                              AppLocalizations.of(context).translate('con_timeline'),
                            ], AppLocalizations.of(context).translate('Guidelines')),
                          ),
                        )
                      ],
                    ),
                    Text(
                      AppLocalizations.of(context).translate('time_pr_question'),
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
                      AppLocalizations.of(context).translate('many_stu_pr_question'),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextFieldWidget(
                      hint: AppLocalizations.of(context).translate('num_s'),
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
                      buttonText: AppLocalizations.of(context).translate('next_des'),
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
                            'project': widget.projectEdit,
                          });
                        } else {
                          ToastHelper.error(AppLocalizations.of(context).translate('pls_en_re_fi'));
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
