import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class PostProjectStepper extends StatefulWidget {
  PostProjectStepper({required this.activeStep});

  final int activeStep;
  @override
  State<PostProjectStepper> createState() => _PostProjectStepperState();
}

class _PostProjectStepperState extends State<PostProjectStepper> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: widget.activeStep,
      lineStyle: LineStyle(
        lineLength: 95,
        lineSpace: 0,
        lineType: LineType.normal,
        defaultLineColor: Colors.white,
        finishedLineColor: Theme.of(context).colorScheme.primary,
      ),
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Colors.black87,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 8,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 0
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
          ),
          title: AppLocalizations.of(context).translate('Title'),
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 1
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
          ),
          title: AppLocalizations.of(context).translate('Scope'),
          topTitle: true,
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 2
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
          ),
          title: AppLocalizations.of(context).translate('Description'),
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 3
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
          ),
          title: AppLocalizations.of(context).translate('Overall'),
          topTitle: true,
        ),
      ],
    );
  }
}
