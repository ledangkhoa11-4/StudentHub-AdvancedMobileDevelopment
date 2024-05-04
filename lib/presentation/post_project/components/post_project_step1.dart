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
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class PostProjectStep1 extends StatefulWidget {
  final FormPostProjectStore formStore;
  final Project? projectEdit;

  PostProjectStep1({Key? key, required this.formStore, this.projectEdit})
      : super(key: key);

  @override
  State<PostProjectStep1> createState() => _PostProjectStep1State();
}

class _PostProjectStep1State extends State<PostProjectStep1> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    if (widget.projectEdit != null) {
      _titleController.text = widget.projectEdit!.title;
      widget.formStore.setTitle(widget.projectEdit!.title);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tooltipController = JustTheController();

    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostProjectStepper(activeStep: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                    .translate('post_project_step1_text_1'),
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
                    AppLocalizations.of(context)
                        .translate('post_project_step1_text_2'),
                    AppLocalizations.of(context)
                        .translate('post_project_step1_text_3')
                  ], AppLocalizations.of(context).translate('example_til')),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context).translate('post_project_step1_text_4'),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextFieldWidget(
            hint: AppLocalizations.of(context).translate('your_pr_til'),
            padding: EdgeInsets.only(top: 15, bottom: 15),
            icon: BootstrapIcons.alphabet,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _titleController,
            errorText: widget.formStore.formErrorStore.title,
            onChanged: (value) {
              widget.formStore.setTitle(_titleController.text);
            },
          ),
          RoundedButtonWidget(
            buttonText: AppLocalizations.of(context).translate('next_scope'),
            buttonColor: Theme.of(context).colorScheme.primary,
            textColor: _themeStore.darkMode ? Colors.black : Colors.white,
            onPressed: () {
              widget.formStore.validateTitle(_titleController.text);

              if (widget.formStore.formErrorStore.title == null) {
                Navigator.of(context)
                    .pushNamed(Routes.postProjectStep2, arguments: {
                  'formStore': widget.formStore,
                  'project': widget.projectEdit,
                });
              } else {
                ToastHelper.error(
                    AppLocalizations.of(context).translate('pls_en_re_fi'));
              }
              // Navigator.of(context).pushNamed(Routes.companyWelcome);
            },
          )
        ],
      ),
    );
  }
}
