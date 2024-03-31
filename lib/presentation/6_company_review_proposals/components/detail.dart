import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final descriptions = [
    'Seeking a UX/UI design intern with a good eye for modern app design.',
    'Portfolio of past design projects preferred.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Text(
              'Students are looking for:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descriptions
                  .map((description) => Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('• $description'),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_alarm_rounded, size: 40),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project scope:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('• 4 - 5 months'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.people, size: 40),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Students:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('• 3 - 5 students'),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(), // Add spacer to push buttons to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Apply button pressed
                  },
                  child: Text('Post job'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
