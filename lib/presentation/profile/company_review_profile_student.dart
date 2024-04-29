import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/no-project.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/profile/view_pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CompanyReviewStudentProfile extends StatefulWidget {
  final ProposalNoProjectVariable proposal;

  CompanyReviewStudentProfile({Key? key, required this.proposal});

  @override
  State<CompanyReviewStudentProfile> createState() =>
      _ReviewStudentProfileState();
}

class _ReviewStudentProfileState extends State<CompanyReviewStudentProfile> {
  final UserStore _userStore = getIt<UserStore>();
  int _nextNavigate = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UserAppBar.buildAppBar(context,
            titleWidget: Text(widget.proposal.student.fullname.toString()),
            disableSettingAccount: true),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              '${widget.proposal.student.techStack!.name}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: CustomPaint(
                              painter: PointedLinePainter(
                                  MediaQuery.of(context).size.width - 40,
                                  context),
                            ),
                          ),
                          // Text(
                          //   "Main skillsets: ",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .labelLarge!
                          //       .copyWith(
                          //           color: Theme.of(context)
                          //               .colorScheme
                          //               .primary),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 20, top: 10),
                          //   child: Text(
                          //     '${_userStore.profileStudent!.skillSets!.map((e) => e.name).toList().join(", ")}.',
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .labelLarge,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 20, bottom: 20),
                          //   child: CustomPaint(
                          //     painter: PointedLinePainter(
                          //         MediaQuery.of(context).size.width -
                          //             40,
                          //         context),
                          //   ),
                          // ),
                          // Text(
                          //   "Languages: ",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .labelLarge!
                          //       .copyWith(
                          //           color: Theme.of(context)
                          //               .colorScheme
                          //               .primary),
                          // ),
                          // ..._userStore.profileStudent!.languages!
                          //     .map(
                          //       (e) => Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 20, top: 10),
                          //         child: Text(
                          //           '[${e.level}] - ${e.languageName} ',
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .labelLarge,
                          //         ),
                          //       ),
                          //     )
                          //     .toList(),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 20, bottom: 20),
                          //   child: CustomPaint(
                          //     painter: PointedLinePainter(
                          //         MediaQuery.of(context).size.width -
                          //             40,
                          //         context),
                          //   ),
                          // ),
                          Text(
                            "Education: ",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          ...widget.proposal.student.educations!
                              .map(
                                (e) => Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    '[${e.startYear} - ${e.endYear}] - ${e.schoolName}',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              )
                              .toList(),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: CustomPaint(
                              painter: PointedLinePainter(
                                  MediaQuery.of(context).size.width - 40,
                                  context),
                            ),
                          ),
                          // Text(
                          //   "Experiences: ",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .labelLarge!
                          //       .copyWith(
                          //           color:
                          //               Theme.of(context).colorScheme.primary),
                          // ),
                          // _userStore.profileStudent!.experiences!.length <= 0
                          //     ? Padding(
                          //         padding:
                          //             const EdgeInsets.only(left: 20, top: 10),
                          //         child: Text(
                          //           'Empty',
                          //           style:
                          //               Theme.of(context).textTheme.labelLarge,
                          //         ),
                          //       )
                          //     : SizedBox.shrink(),
                          // ..._userStore.user!.student!.experiences!
                          //     .map(
                          //       (e) => Padding(
                          //         padding:
                          //             const EdgeInsets.only(left: 20, top: 10),
                          //         child: Column(
                          //           mainAxisSize: MainAxisSize.max,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.stretch,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               '[${e.startMonth} / ${e.endMonth}] - ${e.title}',
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .labelLarge,
                          //             ),
                          //             Text(
                          //               'Description: ${e.description}',
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .labelMedium,
                          //             ),
                          //             Text(
                          //               'Skillsets: ${e.skillSets!.map((e) => e.name).toList().join(", ")}.',
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .labelMedium,
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     )
                          //     .toList(),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20, bottom: 20),
                          //   child: CustomPaint(
                          //     painter: PointedLinePainter(
                          //         MediaQuery.of(context).size.width - 40,
                          //         context),
                          //   ),
                          // ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (!_userStore
                                      .studentTranscriptFile.isEmpty) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ViewPdfScreen(
                                                  title: widget.proposal.student
                                                          .fullname
                                                          .toString() +
                                                      " transcript",
                                                  url: _userStore
                                                      .studentTranscriptFile,
                                                )));
                                  } else {
                                    setState(() {
                                      _nextNavigate = 1;
                                      _userStore.getTranscriptFileByStudentId(
                                          widget.proposal.studentId);
                                    });
                                  }
                                },
                                child: Text('View transcript'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // if (!_userStore.studentResumeFile.isEmpty) {
                                  //   Navigator.of(context)
                                  //       .push(MaterialPageRoute(
                                  //           builder: (context) => ViewPdfScreen(
                                  //                 title: widget.proposal.student
                                  //                         .fullname
                                  //                         .toString() +
                                  //                     " resume",
                                  //                 url: _userStore
                                  //                     .studentResumeFile,
                                  //               )));
                                  // } else {
                                  setState(() {
                                    _nextNavigate = 2;
                                    _userStore.getResumeFileByStudentId(
                                        widget.proposal.studentId);
                                  });
                                  // }
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
                return (!_userStore.isLoading)
                    ? navigate(context)
                    : SizedBox.shrink();
              },
            ),
          ],
        ));
  }

  // Widget reloadStudentProfile(BuildContext context) {
  //   _userStore.getStudentProfile(widget.student_id);
  //   return SizedBox.shrink();
  // }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_nextNavigate == 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPdfScreen(
                  title: widget.proposal.student.fullname.toString() +
                      " transcript",
                  url: _userStore.studentTranscriptFile,
                )));
      }

      if (_nextNavigate == 2) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPdfScreen(
                  title: widget.proposal.student.fullname.toString(),
                  url: _userStore.studentResumeFile,
                )));
      }

      _userStore.resetApiResponse();
    });

    return Container();
  }
}
