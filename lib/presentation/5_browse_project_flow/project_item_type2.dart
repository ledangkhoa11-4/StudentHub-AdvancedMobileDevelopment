import 'package:flutter/material.dart';
import 'project_detail.dart'; // Import the ProjectDetail page

class ProjectItemType2 extends StatelessWidget {
  final String createdDate;
  final String title;
  final String timeDuration;
  final int numberOfStudents;
  final List<String> descriptions;
  final String proposal;
  final bool isLiked;
  final Function(bool) onLikeChanged;

  const ProjectItemType2({
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
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                ],
              ),
              Text(
                'Sumited 3 days ago',
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
            ],
          ),
        ),
      ),
    );
  }
}
