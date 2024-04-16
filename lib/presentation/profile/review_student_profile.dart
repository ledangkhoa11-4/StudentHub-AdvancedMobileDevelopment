import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/profile/student_new_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ReviewStudentProfile extends StatefulWidget {
  @override
  State<ReviewStudentProfile> createState() => _ReviewStudentProfileState();
}

class _ReviewStudentProfileState extends State<ReviewStudentProfile> {
  final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UserAppBar.buildAppBar(context,
            titleWidget: Text("Your profile"), disableSettingAccount: true),
        body: Column(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(""),
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: RoundedButtonWidget(
                              buttonText: "Edit",
                              buttonColor:
                                  Theme.of(context).colorScheme.primary,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StudentNewProfile()));
                              },
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Main techstack: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          '${_userStore.user!.student!.techStack!.name}.',
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
                        "Main skillsets: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          '${_userStore.user!.student!.skillSets!.map((e) => e.name).toList().join(", ")}.',
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
                        "Languages: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      ..._userStore.user!.student!.languages!
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                '[${e.level}] - ${e.languageName} ',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          )
                          .toList(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CustomPaint(
                          painter: PointedLinePainter(
                              MediaQuery.of(context).size.width - 40, context),
                        ),
                      ),
                      Text(
                        "Education: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      ..._userStore.user!.student!.educations!
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                '[${e.startYear} - ${e.endYear}] - ${e.schoolName}',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          )
                          .toList(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CustomPaint(
                          painter: PointedLinePainter(
                              MediaQuery.of(context).size.width - 40, context),
                        ),
                      ),
                      Text(
                        "Experiences: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      ..._userStore.user!.student!.experiences!
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '[${e.startMonth} / ${e.endMonth}] - ${e.title}',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Text(
                                    'Description: ${e.description}',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    'Skillsets: ${e.skillSets!.map((e) => e.name).toList().join(", ")}.',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CustomPaint(
                          painter: PointedLinePainter(
                              MediaQuery.of(context).size.width - 40, context),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('View resume'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('View transcript'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
