import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/sign_up/sign_up_step2.dart';
import 'package:flutter/material.dart';
import '../../utils/locale/app_localization.dart';
class SignUpStep1 extends StatefulWidget {
  @override
  _SignUpStep1State createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  String _selectedOption = ''; // To store the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            Text(
              AppLocalizations.of(context).translate('join_com_stu'),
              style: TextStyle(
                fontSize: 20.0, // Adjust the size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            customRadioListTile(
              icon: Icons.business,
              text:AppLocalizations.of(context).translate('find_engin'),
              value: 'company',
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 14),
            customRadioListTile(
              icon: Icons.engineering,
              text: AppLocalizations.of(context).translate('look_for_proj'),
              value: 'student',
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // ignore: unnecessary_null_comparison
                      if (_selectedOption == null || _selectedOption!.isEmpty) {
                        // Show a message indicating that the user must choose an option
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalizations.of(context).translate('choose_op')),
                          ),
                        );
                      } else {
                        // Navigate to SignUpStep2 page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpStep2(selectedOption: _selectedOption)),
                        );
                      }
                    },
                    child: Text(AppLocalizations.of(context).translate('cre_acc')),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // Navigate to the login screen
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('have_acc'),
                    style: TextStyle(
                      color: Colors.black, // Set the color as needed
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).translate('login_btn_login_in'),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customRadioListTile({
    required IconData icon,
    required String text,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged(value); // Notify the parent widget about the selection
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                ],
              ),
              Radio<String>(
                value: value,
                groupValue: _selectedOption,
                onChanged: (selectedValue) {
                  onChanged(
                      selectedValue!); // Notify the parent widget about the selection
                },
              ),
            ],
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14.0),
          ),
        ]),
      ),
    );
  }
}
