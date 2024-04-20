// import 'package:boilerplate/presentation/5_browse_project_flow/submit_screen.dart';
// import 'package:boilerplate/presentation/app_bar/app_bar.dart';
// import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
// import 'package:bootstrap_icons/bootstrap_icons.dart';
// import 'package:flutter/material.dart';
// import 'project_item.dart';

// class ProjectDetail extends StatefulWidget {
//   final ProjectItem projectItem;

//   const ProjectDetail({
//     Key? key,
//     required this.projectItem,
//   }) : super(key: key);

//   @override
//   _ProjectDetailState createState() => _ProjectDetailState();
// }

// class _ProjectDetailState extends State<ProjectDetail> {
//   late bool isProjectLiked = false; // Initialize with a default value

//   @override
//   void initState() {
//     super.initState();
//     isProjectLiked = widget.projectItem.isLiked; // Assign initial value
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: UserAppBar.buildAppBar(context),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Project detail',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.only(left: 16),
//               child: Text(
//                 widget.projectItem.title,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Theme.of(context).colorScheme.primary,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: CustomPaint(
//                 painter: PointedLinePainter(
//                     MediaQuery.of(context).size.width - 40, context),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Students are looking for:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             // Column(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: widget.projectItem.descriptions
//             //       .map((description) => Padding(
//             //             padding: const EdgeInsets.only(left: 16.0),
//             //             child: Text('• $description'),
//             //           ))
//             //       .toList(),
//             // ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: CustomPaint(
//                 painter: PointedLinePainter(
//                     MediaQuery.of(context).size.width - 40, context),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(BootstrapIcons.calendar2_week, size: 30),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Project scope:',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16.0),
//                       child: Text('• ${widget.projectItem.timeDuration}'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(BootstrapIcons.people_fill, size: 30),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Number of Students:',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16.0),
//                       child: Text(
//                           '• ${widget.projectItem.numberOfStudents} students'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Spacer(), // Add spacer to push buttons to the bottom
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SubmitScreen(),
//                       ),
//                     );
//                   },
//                   child: Text('Apply'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isProjectLiked = !isProjectLiked;
//                       widget.projectItem
//                           .onLikeChanged(!widget.projectItem.isLiked);
//                     });
//                   },
//                   child: Text(isProjectLiked ? 'Unlike it' : 'Like it'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
