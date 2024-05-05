import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 20),
              SizedBox(
                height: 400,
                child: Image.asset(
                  Assets.welcomeImage,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                  child: Text(
                "Build your product with high-skilled student",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 16),
              )),
              SizedBox(height: 10),
              Center(
                  child: Text(
                      "Find and onboard best-skilled  student for your product Student works to gain experience & skills form real-world projects",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButtonWidget(
                    buttonText: "Company",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.login);
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  RoundedButtonWidget(
                    buttonText: "Student",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.login);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Center(
                  child: Text(
                      "StudentHub is university market place to connect high-skilled student and company on a real-world project",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14))),
            ],
          ),
        ),
      ),
    );
  }
}
