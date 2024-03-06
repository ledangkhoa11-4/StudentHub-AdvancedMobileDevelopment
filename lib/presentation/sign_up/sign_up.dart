import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedOption = ''; // To store the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'Join as company for Student',
              style: TextStyle(
                fontSize: 20.0, // Adjust the size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            customRadioListTile(
              icon: Icons.business,
              text: 'I am a company, find engineer for project',
              value: 'company_find_engineer',
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 14),
            customRadioListTile(
              icon: Icons.engineering,
              text: 'I am an engineer, looking for projects',
              value: 'engineer_find_project',
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle sign-up based on the selected option
                if (_selectedOption == 'company_find_engineer') {
                  // Perform actions for the company looking for engineers
                } else if (_selectedOption == 'engineer_find_project') {
                  // Perform actions for the engineer looking for projects
                }
              },
              child: Text('Sign up'),
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
