import 'package:flutter/material.dart';
import 'project_item.dart'; // Ensure this import is correct based on your project structure

class ProjectList extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'createdDate': '2024-01-01',
      'title': 'Senior Mobile Dev',
      'timeDuration': '1-3 months',
      'numberOfStudents': 4,
      'description': 'Looking for experienced mobile developers.',
      'proposal': 'Less than 5 months',
    },
    // Add more projects here
  ];

  ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project List'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ProjectItem(
            createdDate: project['createdDate'] as String,
            title: project['title'] as String,
            timeDuration: project['timeDuration'] as String,
            numberOfStudents: project['numberOfStudents'] as int,
            description: project['description'] as String,
            proposal: project['proposal'] as String,
          );
        },
      ),
    );
  }
}
