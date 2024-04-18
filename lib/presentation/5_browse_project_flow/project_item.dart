import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:flutter/material.dart';
import 'project_detail.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final bool isLiked;
  final Function(bool) onLikeChanged;

  const ProjectItem({
    Key? key,
    required this.project,
    required this.isLiked,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color greenColor = Color.fromARGB(255, 48, 121, 51);
    final Color grayColor = const Color.fromARGB(255, 134, 132, 132);

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProjectDetail(projectItem: this),
        //   ),
        // );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Created: ${project.createdAt ?? 'Unknown'}',
                style: TextStyle(
                  color: grayColor,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.right,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
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
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: grayColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                  text: 'Time: ',
                  children: <TextSpan>[
                    TextSpan(
                      text: '${project.createdAt}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: '${project.numberOfStudents} students',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' needed '),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Students are looking for:',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 14),
              ),
              Text(
                project.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 8.0),
              // RichText(
              //   text: TextSpan(
              //     style: Theme.of(context).textTheme.bodyText2!.copyWith(
              //           color: grayColor,
              //           fontWeight: FontWeight.w100,
              //           fontSize: 14,
              //         ),
              //     text: 'Proposal: ',
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '${project.proposal}',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
