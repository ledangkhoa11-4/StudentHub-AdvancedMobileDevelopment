import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final String createdDate;
  final String title;
  final String timeDuration;
  final int numberOfStudents;
  final String description;
  final String proposal;

  const ProjectItem({
    Key? key,
    required this.createdDate,
    required this.title,
    required this.timeDuration,
    required this.numberOfStudents,
    required this.description,
    required this.proposal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Text('Created: $createdDate'),
            Text('Duration: $timeDuration'),
            Text('Students needed: $numberOfStudents'),
            SizedBox(height: 8.0),
            Text(
              'Students are looking for:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(description),
            SizedBox(height: 8.0),
            Text('Proposal: $proposal'),
          ],
        ),
      ),
    );
  }
}
