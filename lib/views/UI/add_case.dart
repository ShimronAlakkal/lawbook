import 'package:flutter/material.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

class CasePage extends StatefulWidget {
  const CasePage({super.key});

  @override
  State<CasePage> createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    List<Step> steps = [
      // the case number, court,importance
      Step(
        title: Text('Case Info.'),
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the Clinet info
      Step(
        title: Text('Client Info.'),
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the oppot. info
      Step(
        title: Text('Opposition Info.'),
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the  section details, description
      Step(
        title: Text('Section details'),
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the hearing dates & stuff
      Step(
        title: Text('Hearing details'),
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the files upload & and other overview.
      Step(
        title: Text('file attachments'),
        state: currentStep > 5 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 5,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the fpreview before saving
      Step(
        title: Text('Preview'),
        state: currentStep > 6 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 6,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),
    ];

    return Scaffold(
      body: ListView(
        children: [
          // the custom app bar
          CustomWidget().backArrowAppBar(context: context),

          // the main steooer
          Stepper(
            type: StepperType.vertical,
            currentStep: currentStep,
            steps: steps,

            // on step continue
            onStepContinue: () {
              if (currentStep < steps.length - 1) {}
              setState(() {
                currentStep++;
              });
            },

            // onstep cancel
            onStepCancel: () {
              if (currentStep >= 0) {
                setState(() {
                  currentStep--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
