import 'dart:convert';

import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/dashboard.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../../domain/entity/project/project.dart';
import '../store/post_project_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class PostProjectStep4 extends StatefulWidget {
  final FormPostProjectStore formStore;
  final Project? projectEdit;

  PostProjectStep4({Key? key, required this.formStore, this.projectEdit})
      : super(key: key);
  @override
  State<PostProjectStep4> createState() => _PostProjectStep4State();
}

class _PostProjectStep4State extends State<PostProjectStep4> {
  final ProjectStore _projectStore = getIt<ProjectStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // check to see if already called api
    if (!_projectStore.isLoading) {
      // _projectStore.getProjects();
    }
  }

  Project _constructProjectFromFormData() {
    return Project(
      title: widget.formStore.title,
      description:
          widget.formStore.description, // controller.document.toPlainText(),
      numberOfStudents: widget.formStore.numberOfStudents,
      updatedAt: "",
      createdAt: "",
      companyId: _userStore.user!.company!.id!,
      typeFlag:
          widget.projectEdit != null ? widget.projectEdit!.typeFlag : null,
      projectScopeFlag: widget.formStore.projectScopeFlag,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeStore _themeStore = getIt<ThemeStore>();
    final _tooltipController = JustTheController();
    QuillController _controller = QuillController(
        document: Document.fromJson(jsonDecode(widget.formStore.description)),
        selection: const TextSelection.collapsed(offset: 0));

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: widget.projectEdit != null
              ? Text(AppLocalizations.of(context).translate('edit') +
                  "\"${widget.projectEdit!.title}\"" +
                  AppLocalizations.of(context).translate('project'))
              : Text(AppLocalizations.of(context).translate('post_new_pr'))),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('PRJ_DETAILS'),
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
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
                                .translate('post_project_step4_text_1'),
                          ], AppLocalizations.of(context).translate('note')),
                        ),
                      )
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context).translate('Proj_title') + ": ",
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
                    AppLocalizations.of(context).translate('Description') +
                        ": ",
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
                        AppLocalizations.of(context).translate('Proj_scope') +
                            ": ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '${ProjectScopeType.fromValue(widget.formStore.projectScopeFlag)}',
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
                        AppLocalizations.of(context).translate('Stu_req') +
                            ": ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '${widget.formStore.numberOfStudents} ' +
                            AppLocalizations.of(context).translate('stu_s'),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RoundedButtonWidget(
                    buttonText: widget.projectEdit != null
                        ? AppLocalizations.of(context).translate('Upd_proj')
                        : AppLocalizations.of(context).translate('post_proj'),
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor:
                        _themeStore.darkMode ? Colors.black : Colors.white,
                    onPressed: () {
                      DeviceUtils.hideKeyboard(context);
                      if (_userStore.user?.company != null) {
                        Project project = _constructProjectFromFormData();
                        if (widget.projectEdit != null) {
                          _projectStore.update(
                              widget.projectEdit!.id!, project);
                        } else {
                          _projectStore.insert(project);
                        }
                      } else {
                        ToastHelper.error(AppLocalizations.of(context)
                            .translate('com_pro_dash_text'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _projectStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
          Observer(
            builder: (context) {
              return !_projectStore.isLoading && _projectStore.success == true
                  ? navigate(context)
                  : _showError(_projectStore.errorStore.errorMessage);
            },
          ),
        ],
      ),
    );
  }

  Widget navigate(BuildContext context) {
    _projectStore.resetProjectList();
    _projectStore.resetSuccess();
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DashBoardCompany()),
        (Route<dynamic> route) =>
            false, // This removes all routes below the new route
      );
    });
    if (widget.projectEdit != null) {
      ToastHelper.success(
          AppLocalizations.of(context).translate('update_proj_suc'));
    } else {
      ToastHelper.success(
          AppLocalizations.of(context).translate('create_proj_suc'));
    }
    return SizedBox.shrink();
  }

  Widget _showError(String message) {
    if (!message.isEmpty) {
      ToastHelper.error(message);
    }
    _projectStore.resetSuccess();
    return SizedBox.shrink();
  }
}
