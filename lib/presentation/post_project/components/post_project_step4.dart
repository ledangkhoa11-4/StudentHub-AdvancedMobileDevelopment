import 'dart:convert';
import 'dart:ffi';

import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';

class PostProjectStep4 extends StatefulWidget {
  final FormPostProjectStore formStore;

  PostProjectStep4({Key? key, required this.formStore}) : super(key: key);
  @override
  State<PostProjectStep4> createState() => _PostProjectStep4State();
}

class _PostProjectStep4State extends State<PostProjectStep4> {
  late QuillController _quillController;

  @override
  void initState() {
    print(widget.formStore);
    super.initState();
  }

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
            children: [],
          ),
        ),
      ),
    );
  }
}
