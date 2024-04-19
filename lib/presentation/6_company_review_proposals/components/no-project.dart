import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/constants/assets.dart';

class NoProject extends StatefulWidget {
  final String title;

  const NoProject({Key? key, required this.title}) : super(key: key);

  @override
  _NoProjectState createState() => _NoProjectState();
}

class _NoProjectState extends State<NoProject> {
  final _projectStore = getIt<ProjectStore>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (context) {
            return !_projectStore.isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipRRect(
                          child: Image.asset(
                            Assets.noData,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                : SizedBox.shrink();
          },
        ),
        Observer(
          builder: (context) {
            return Visibility(
              visible: _projectStore.isLoading,
              child: CustomProgressIndicatorWidget(),
            );
          },
        )
      ],
    );
  }
}
