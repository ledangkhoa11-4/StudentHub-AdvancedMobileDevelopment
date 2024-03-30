import 'package:boilerplate/presentation/5_browse_project_flow/submit_screen.dart';
import 'package:flutter/material.dart';
import 'project_item.dart';

class ProjectDetail extends StatefulWidget {
  final ProjectItem projectItem;

  const ProjectDetail({
    Key? key,
    required this.projectItem,
  }) : super(key: key);

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  late bool isProjectLiked = false; // Initialize with a default value

  @override
  void initState() {
    super.initState();
    isProjectLiked = widget.projectItem.isLiked; // Assign initial value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Project detail'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project detail',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.projectItem.title,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 23, 158, 27),
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Text(
              'Students are looking for:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.projectItem.descriptions
                  .map((description) => Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('• $description'),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_alarm_rounded, size: 40),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project scope:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('• ${widget.projectItem.timeDuration}'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.people, size: 40),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Students:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                          '• ${widget.projectItem.numberOfStudents} students'),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(), // Add spacer to push buttons to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubmitScreen(),
                      ),
                    );
                  },
                  child: Text('Apply'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isProjectLiked = !isProjectLiked;
                      widget.projectItem
                          .onLikeChanged(!widget.projectItem.isLiked);
                    });
                  },
                  child: Text(isProjectLiked ? 'Unsaved' : 'Saved'),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
