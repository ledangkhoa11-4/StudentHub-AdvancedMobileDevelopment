import 'package:flutter/material.dart';
// import 'project_detail.dart'; // Import the ProjectDetail page
import '../../domain/entity/project/project.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
class ProjectItemType2 extends StatelessWidget {
  final Project project;
  final bool isLiked;
  final Function(bool) onLikeChanged;

  const ProjectItemType2({
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
                ],
              ),
              Text(
                AppLocalizations.of(context).translate('sub_on') + ' ${project.createdAt ?? "date"}',// Placeholder for created date
                style: TextStyle(color: grayColor),
              ),
              SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context).translate('pr_de'),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                project.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context).translate('num_s')+ '${project.numberOfStudents}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
