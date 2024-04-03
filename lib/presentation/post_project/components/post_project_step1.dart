import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_stepper.dart';
import 'package:boilerplate/presentation/post_project/components/unordered_list.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class PostProjectStep1 extends StatefulWidget {
  final FormPostProjectStore formStore;

  PostProjectStep1({Key? key, required this.formStore}) : super(key: key);

  @override
  State<PostProjectStep1> createState() => _PostProjectStep1State();
}

class _PostProjectStep1State extends State<PostProjectStep1> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _tooltipController = JustTheController();

    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostProjectStepper(activeStep: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Let's start with a strong title.",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              JustTheTooltip(
                controller: _tooltipController,
                isModal: true,
                child: IconButton(
                  icon: Icon(
                    Icons.help_outline_outlined,
                    size: 16,
                  ),
                  onPressed: () {
                    _tooltipController.showTooltip();
                  },
                ),
                content: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: UnorderedList([
                    "Build responsive WordPress site with booking/payment functionality",
                    "Facebook ad specialist need for product launch"
                  ], "Example title"),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "This helps your post stand out to the right students. It's the first thing they'll see, so make it impressive!",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextFieldWidget(
            hint: "Your project title",
            padding: EdgeInsets.only(top: 15, bottom: 15),
            icon: BootstrapIcons.alphabet,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _titleController,
            errorText: widget.formStore.formErrorStore.title,
            onChanged: (value) {
              widget.formStore.setTitle(_titleController.text);
            },
          ),
          RoundedButtonWidget(
            buttonText: "Next: Scope",
            buttonColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            onPressed: () {
              // Navigator.of(context).pushNamed(Routes.companyWelcome);
              Navigator.of(context)
                  .pushNamed(Routes.postProjectStep2, arguments: {
                'formStore': widget.formStore,
              });
            },
          )
        ],
      ),
    );
  }
}
