import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/profile/company_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyNewProfile extends StatefulWidget {
  @override
  State<CompanyNewProfile> createState() => _CompanyNewProfileState();
}

class _CompanyNewProfileState extends State<CompanyNewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                  child: Text(
                "Welcome to StudentHub",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 18),
              )),
              SizedBox(height: 10),
              Center(
                  child: Text(
                      "Tell us about your company and you will be on your way connect with high-skilled students",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14))),
              CompanyProfileForm(),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
