import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/no-project.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/profile/student_new_profile.dart';
import 'package:boilerplate/presentation/profile/view_pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CompanyReviewStudentProfile extends StatefulWidget {
  int student_id;

  CompanyReviewStudentProfile({Key? key, required this.student_id});

  @override
  State<CompanyReviewStudentProfile> createState() =>
      _ReviewStudentProfileState();
}

class _ReviewStudentProfileState extends State<CompanyReviewStudentProfile> {
  final UserStore _userStore = getIt<UserStore>();
  int _nextNavigate = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if (_userStore.profileStudent == null) {
    //   _userStore.getStudentProfile(widget.student_id);
    // }

    if (_userStore.studentResumeFile.isEmpty &&
        _userStore.studentTranscriptFile.isEmpty) {
      _userStore.getStudentResumeFile();
      _userStore.getStudentTranscriptFile();
    }
    // print("44444444444444444444444444444444444");
    // print(_userStore.studentResumeFile);
    // print(_userStore.apiStudentResponseSuccess);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => _userStore.profileStudent != null
            ? Scaffold(
                appBar: UserAppBar.buildAppBar(context,
                    titleWidget:
                        Text(_userStore.profileStudent!.fullname.toString()),
                    disableSettingAccount: true),
                body: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Main techstack: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                      '${_userStore.profileStudent!.techStack!.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: CustomPaint(
                                      painter: PointedLinePainter(
                                          MediaQuery.of(context).size.width -
                                              40,
                                          context),
                                    ),
                                  ),
                                  Text(
                                    "Main skillsets: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                      '${_userStore.profileStudent!.skillSets!.map((e) => e.name).toList().join(", ")}.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: CustomPaint(
                                      painter: PointedLinePainter(
                                          MediaQuery.of(context).size.width -
                                              40,
                                          context),
                                    ),
                                  ),
                                  Text(
                                    "Languages: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  ..._userStore.profileStudent!.languages!
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            '[${e.level}] - ${e.languageName} ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: CustomPaint(
                                      painter: PointedLinePainter(
                                          MediaQuery.of(context).size.width -
                                              40,
                                          context),
                                    ),
                                  ),
                                  Text(
                                    "Education: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  ..._userStore.profileStudent!.educations!
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            '[${e.startYear} - ${e.endYear}] - ${e.schoolName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: CustomPaint(
                                      painter: PointedLinePainter(
                                          MediaQuery.of(context).size.width -
                                              40,
                                          context),
                                    ),
                                  ),
                                  Text(
                                    "Experiences: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  _userStore.profileStudent!.experiences!
                                              .length <=
                                          0
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            'Empty',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  ..._userStore.user!.student!.experiences!
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '[${e.startMonth} / ${e.endMonth}] - ${e.title}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                              Text(
                                                'Description: ${e.description}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              ),
                                              Text(
                                                'Skillsets: ${e.skillSets!.map((e) => e.name).toList().join(", ")}.',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: CustomPaint(
                                      painter: PointedLinePainter(
                                          MediaQuery.of(context).size.width -
                                              40,
                                          context),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (!_userStore
                                              .studentTranscriptFile.isEmpty) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewPdfScreen(
                                                          title: "Transcript",
                                                          url: _userStore
                                                              .studentTranscriptFile,
                                                        )));
                                          } else {
                                            setState(() {
                                              _nextNavigate = 1;
                                              _userStore
                                                  .getStudentTranscriptFile();
                                            });
                                          }
                                        },
                                        child: Text('View transcript'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (!_userStore
                                              .studentResumeFile.isEmpty) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewPdfScreen(
                                                          title: "Resume",
                                                          url: _userStore
                                                              .studentResumeFile,
                                                        )));
                                          } else {
                                            setState(() {
                                              _nextNavigate = 2;
                                              _userStore.getStudentResumeFile();
                                            });
                                          }
                                        },
                                        child: Text('View resume'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Observer(
                      builder: (context) {
                        return Visibility(
                          visible: _userStore.isLoading,
                          child: CustomProgressIndicatorWidget(),
                        );
                      },
                    ),
                    Observer(
                      builder: (context) {
                        return !_userStore.isLoading &&
                                _userStore.apiResponseSuccess == true
                            ? navigate(context)
                            : SizedBox.shrink();
                      },
                    ),
                  ],
                ))
            : NoProject(title: "Data is loading...."));
  }

  Widget reloadStudentProfile(BuildContext context) {
    _userStore.getStudentProfile(widget.student_id);
    return SizedBox.shrink();
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_nextNavigate == 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPdfScreen(
                  title: _userStore.profileStudent!.fullname.toString() +
                      " Transcript",
                  url: _userStore.studentTranscriptFile,
                )));
      }

      if (_nextNavigate == 2) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPdfScreen(
                  title: _userStore.profileStudent!.fullname.toString() +
                      " Resume",
                  url: _userStore.studentResumeFile,
                )));
      }

      _userStore.resetApiResponse();
    });

    return Container();
  }
}
