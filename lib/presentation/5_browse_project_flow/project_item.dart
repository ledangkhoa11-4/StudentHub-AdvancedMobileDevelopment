import 'package:flutter/material.dart';

class ProjectItem extends StatefulWidget {
  final String createdDate;
  final String title;
  final String timeDuration;
  final int numberOfStudents;
  final List<String> descriptions; // Now a list of descriptions
  final String proposal;
  final bool isLiked;

  const ProjectItem({
    Key? key,
    required this.createdDate,
    required this.title,
    required this.timeDuration,
    required this.numberOfStudents,
    required this.descriptions, // Update here
    required this.proposal,
    required this.isLiked,
  }) : super(key: key);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color greenColor = Color.fromARGB(255, 48, 121, 51); // Green color
    final Color grayColor = const Color.fromARGB(255, 134, 132, 132);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Created: ${widget.createdDate}',
              style: TextStyle(
                // fontStyle: FontStyle.italic,
                color: grayColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: greenColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(
                      widget.isLiked ? Icons.favorite : Icons.favorite_border),
                  color: widget.isLiked ? Colors.red : null,
                  onPressed: toggleLike,
                ),
              ],
            ),
            Text(
                'Time: ${widget.timeDuration}' +
                    ', ${widget.numberOfStudents} students needed',
                style: TextStyle(color: grayColor)),
            SizedBox(height: 8.0),
            Text(
              'Students are looking for:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.descriptions
                  .map((description) => Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('• $description'),
                      ))
                  .toList(),
            ),
            SizedBox(height: 8.0),
            Text('Proposal: ${widget.proposal}',
                style: TextStyle(color: grayColor)),
          ],
        ),
      ),
    );
  }
}
