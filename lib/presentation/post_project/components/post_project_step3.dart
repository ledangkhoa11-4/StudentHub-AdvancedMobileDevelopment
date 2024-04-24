import 'dart:convert';
import 'dart:ffi';

import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class PostProjectStep3 extends StatefulWidget {
  final FormPostProjectStore formStore;
  final Project? projectEdit;

  PostProjectStep3({Key? key, required this.formStore, this.projectEdit})
      : super(key: key);

  @override
  State<PostProjectStep3> createState() => _PostProjectStep3State();
}

class _PostProjectStep3State extends State<PostProjectStep3> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  QuillController _quillController = QuillController.basic();

  @override
  void initState() {
    if (widget.projectEdit != null) {
      try {
        QuillController editedValue = QuillController(
            document:
                Document.fromJson(jsonDecode(widget.projectEdit!.description)),
            selection: const TextSelection.collapsed(offset: 0));
        _quillController = editedValue;
        widget.formStore.setDescription(widget.projectEdit!.description);
      } catch (e) {}
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
                    AppLocalizations.of(context).translate('pr_des'),
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
                        AppLocalizations.of(context).translate('post_project_step3_text_1'),
                        AppLocalizations.of(context).translate('post_project_step3_text_2'),
                        AppLocalizations.of(context).translate('post_project_step3_text_3'),
                      ],AppLocalizations.of(context).translate('post_project_step3_text_4')),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
              RoundedButtonWidget(
                buttonText: AppLocalizations.of(context).translate('final_pre_post'),
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {
                  widget.formStore.setDescription(
                      jsonEncode(_quillController.document.toDelta().toJson()));
                  DeviceUtils.hideKeyboard(context);
                  Navigator.of(context)
                      .pushNamed(Routes.postProjectStep4, arguments: {
                    'formStore': widget.formStore,
                    'project': widget.projectEdit,
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
