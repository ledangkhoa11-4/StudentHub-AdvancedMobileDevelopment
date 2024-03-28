import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class StudentFormStepper extends StatefulWidget{
  StudentFormStepper({required this.activeStep});

  final int activeStep;
  @override
  State<StudentFormStepper> createState() => _StudentFormStepperState();
}

class _StudentFormStepperState extends State<StudentFormStepper> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
        activeStep: widget.activeStep,
        lineStyle: LineStyle(
          lineLength: 120,
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
                backgroundColor:
                    widget.activeStep >= 0 ? Theme.of(context).colorScheme.primary : Colors.white,
              ),
            ),
            title: 'Information',
          
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                     widget.activeStep >= 1 ? Theme.of(context).colorScheme.primary : Colors.white,
              ),
            ),
            title: 'Experience',
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                  widget.activeStep >= 2 ? Theme.of(context).colorScheme.primary : Colors.white,
              ),
            ),
            title: 'Resume',
          ),
        ],
    );
  }
}