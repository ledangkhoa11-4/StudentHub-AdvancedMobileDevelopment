import 'package:boilerplate/presentation/6_company_review_proposals/components/send_hire_offer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entity/project/project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final Function(bool) onLikeChanged;

  const ProjectItem({
    Key? key,
    required this.project,
    required this.onLikeChanged,
  }) : super(key: key);

  String formatDate(String? isoDate) {
    if (isoDate == null) {
      return 'No date';
    }
    DateTime dateTime = DateTime.parse(isoDate);
    return DateFormat('yyyy/MM/dd - HH:mm').format(dateTime);
  }

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
                      project!.title,
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
                'Created: ' + formatDate('${project!.createdAt}'),
                style: TextStyle(color: grayColor),
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                " • " + project!.description,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${project.countProposals}'),
                      Text('Proposals'),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    children: [
                      Text('${project.countMessages}'),
                      Text('Messages'),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    children: [
                      Text('${project.countHired}'),
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
