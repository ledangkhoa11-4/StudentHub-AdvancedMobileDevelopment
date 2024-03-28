import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class CompanyWelcome extends StatefulWidget {
  @override
  State<CompanyWelcome> createState() => _CompanyWelcomeState();
}

class _CompanyWelcomeState extends State<CompanyWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            BootstrapIcons.ui_checks,
            size: 50,
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Text('''Welcome Khoa!,\nLet's start with your first project post ''',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: RoundedButtonWidget(
              buttonText: "Get started!",
              buttonColor: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      )),
    );
  }
}
