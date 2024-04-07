import 'package:boilerplate/core/extensions/cap_extension.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class SignUpStep2 extends StatefulWidget {
  final String selectedOption;

  SignUpStep2({required this.selectedOption});

  @override
  _SignUpStep2State createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  bool _agreeToTerms = false;
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();
  TextEditingController _textField3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var anotherOption =
        widget.selectedOption == "company" ? "student" : "company";

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            Center(
              child: Text(
                'Sign up as ${widget.selectedOption.toTitleCase()}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: _textField1Controller,
              decoration: InputDecoration(labelText: 'Full name'),
            ),
            TextField(
              controller: _textField2Controller,
              decoration: InputDecoration(labelText: 'Work email address'),
            ),
            TextField(
              controller: _textField3Controller,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Yes, I understand and agree to StudentHub',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // navigate
                // Navigator.of(context).pop();
              },
              child: Text('Create my account'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Looking for a project? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  child: Text(
                    'Apply as ${anotherOption}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      fontSize: 13,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpStep2(selectedOption: anotherOption)),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textField1Controller.dispose();
    _textField2Controller.dispose();
    _textField3Controller.dispose();
    super.dispose();
  }
}
