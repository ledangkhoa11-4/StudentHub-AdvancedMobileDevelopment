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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Created: $createdDate',
                style: TextStyle(
                    color: grayColor,
                    fontSize: 14,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.right,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
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
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: grayColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 14),
                  text: 'Time: ',
                  children: <TextSpan>[
                    TextSpan(
                        text: '$timeDuration',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ', '),
                    TextSpan(
                        text: '$numberOfStudents students',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' needed '),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14),
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
             RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: grayColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 14),
                  text: 'Proposal: ',
                  children: <TextSpan>[
                    TextSpan(
                        text: '$proposal',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
