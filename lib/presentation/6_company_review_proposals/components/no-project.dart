import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/components/project_view_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class NoProject extends StatefulWidget {
  NoProject({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<NoProject> {
  final _projectStore = getIt<ProjectStore>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (context) {
            return !_projectStore.isLoading ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    child: Image.asset(
                      height: 200,
                      Assets.noData,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "No project found. \nLet's start posting your first project",
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ) : SizedBox.shrink();
          }
        ),
        Observer(builder: (context) {
          return Visibility(
            visible: _projectStore.isLoading,
            child: CustomProgressIndicatorWidget(),
          );
        })
      ],
    );
  }
}
