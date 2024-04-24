import 'package:boilerplate/presentation/6_company_review_proposals/components/send_hire_offer.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/post_project/components/gradient_divider.dart';
import 'package:boilerplate/presentation/post_project/post_project.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/project/project.dart';
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
            title: Text(AppLocalizations.of(context).translate('view_proposals'),
                style: TextStyle(
                  fontSize: 16,
                )),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 0);
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.chat_left_text, size: 20),
            title: Text(AppLocalizations.of(context).translate('view_messages'),
                style: TextStyle(
                  fontSize: 16,
                )),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 2);
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.person_workspace, size: 20),
            title: Text(AppLocalizations.of(context).translate('view_hired'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 3);
            },
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
            title: Text(AppLocalizations.of(context).translate('view_project'),
                style: TextStyle(
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              navigateToSendHireOffer(context, 1);
            },
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          ListTile(
            leading: Icon(BootstrapIcons.pencil_square, size: 20),
            title: Text(AppLocalizations.of(context).translate('edit_project'),
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
            title: Text(AppLocalizations.of(context).translate('remove_project'),
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
            title: Text(AppLocalizations.of(context).translate('start_pr'),
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
            title: Text(AppLocalizations.of(context).translate('archive_pr'),
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

  void navigateToSendHireOffer(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SendHireOffer(
        project: widget.project,
        initialTabIndex: index, // Pass initialTabIndex indicating the index tab
      ),
    ));
  }
}
