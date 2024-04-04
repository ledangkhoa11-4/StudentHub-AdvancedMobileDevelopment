import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_step1.dart';
import 'package:flutter/material.dart';

class PostProject extends StatefulWidget {
  @override
  State<PostProject> createState() => _PostProjectState();
}

class _PostProjectState extends State<PostProject> {
  final FormPostProjectStore _formStore = getIt<FormPostProjectStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PostProjectStep1(formStore: _formStore,),
            ],
          ),
        ),
      ),
    );
  }
}
