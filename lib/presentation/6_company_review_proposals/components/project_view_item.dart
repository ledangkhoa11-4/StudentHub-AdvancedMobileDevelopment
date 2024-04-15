import 'package:boilerplate/presentation/6_company_review_proposals/components/send_hire_offer.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/project/project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final Function(bool) onLikeChanged;

  const ProjectItem({
    Key? key,
    required this.project,
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
            builder: (context) => SendHireOffer(project: project),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: greenColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.segment_rounded),
                    onPressed: () {
                      // Implement your logic here
                    },
                  ),
                ],
              ),
              Text(
                'Created: ${project.createdAt}',
                style: TextStyle(color: grayColor),
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                project.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('2'), // Replace with actual data
                      Text('Proposals'),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    children: [
                      Text('8'), // Replace with actual data
                      Text('Messages'),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    children: [
                      Text('2'), // Replace with actual data
                      Text('Hired'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
