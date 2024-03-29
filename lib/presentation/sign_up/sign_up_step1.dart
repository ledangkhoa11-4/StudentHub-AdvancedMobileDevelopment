import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/sign_up/sign_up_step2.dart';
import 'package:flutter/material.dart';

class SignUpStep1 extends StatefulWidget {
  @override
  _SignUpStep1State createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  String _selectedOption = ''; // To store the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            Text(
              'Join as Company or Student',
              style: TextStyle(
                fontSize: 20.0, // Adjust the size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            customRadioListTile(
              icon: Icons.business,
              text: 'I am a company, find engineer for project',
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
              text: 'I am an student, looking for projects',
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
                            content: Text('Please choose an option.'),
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
                    child: Text('Create account'),
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
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black, // Set the color as needed
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue, // Set the color as needed
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
