import 'package:flutter/material.dart';
import 'project_detail.dart'; // Import the ProjectDetail page

class ProjectItem extends StatelessWidget {
  final String createdDate;
  final String title;
  final String timeDuration;
  final int numberOfStudents;
  final List<String> descriptions;
  final String proposal;
  final bool isLiked;
  final Function(bool) onLikeChanged;

  const ProjectItem({
    Key? key,
    required this.createdDate,
    required this.title,
    required this.timeDuration,
    required this.numberOfStudents,
    required this.descriptions,
    required this.proposal,
    required this.isLiked,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color greenColor = Color.fromARGB(255, 48, 121, 51);
    final Color grayColor = const Color.fromARGB(255, 134, 132, 132);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetail(projectItem: this),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Created: $createdDate',
                style: TextStyle(color: grayColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: greenColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      // Toggle the like status and notify the parent widget
                      onLikeChanged(!isLiked);
                    },
                  ),
                ],
              ),
              Text(
                'Time: $timeDuration, $numberOfStudents students needed',
                style: TextStyle(color: grayColor),
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: descriptions
                    .map((description) => Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('• $description'),
                        ))
                    .toList(),
              ),
              SizedBox(height: 8.0),
              Text(
                'Proposal: $proposal',
                style: TextStyle(color: grayColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
