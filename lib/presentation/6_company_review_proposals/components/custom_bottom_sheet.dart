import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/post_project.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetContent extends StatefulWidget {
  final Project project;

  const CustomBottomSheetContent({super.key, required this.project});

  @override
  State<CustomBottomSheetContent> createState() =>
      _CustomBottomSheetContentState();
}

class _CustomBottomSheetContentState extends State<CustomBottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(
              BootstrapIcons.people,
              size: 20,
            ),
            title: Text("View proposals",
                style: TextStyle(
                  fontSize: 16,
                )),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.chat_left_text, size: 20),
            title: Text("View messages",
                style: TextStyle(
                  fontSize: 16,
                )),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.person_workspace, size: 20),
            title: Text("View hired",
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: CustomPaint(
              painter: PointedLinePainter(
                  MediaQuery.of(context).size.width - 30, context),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.eye, size: 20),
            title: Text("View project",
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {},
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.pencil_square, size: 20),
            title: Text("Edit project",
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => PostProject(
                        projectEdit: widget.project,
                      )));
            },
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.x_square, size: 20),
            title: Text("Remove project",
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: CustomPaint(
              painter: PointedLinePainter(
                  MediaQuery.of(context).size.width - 30, context),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.align_start, size: 20),
            title: Text("Start working this project",
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {},
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.archive, size: 20),
            title: Text("Archive this project",
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {},
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          // Text(
          //   'View proposals',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'View messages',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'View hired',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Divider(color: Colors.black, thickness: 1),
          // Text(
          //   'View job posting',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'Edit posting',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Text(
          //   'Remove posting',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          // Divider(color: Colors.black, thickness: 1),
          // Text(
          //   'Start working on this project',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
