// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/models/file_model.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

class CasePage extends StatefulWidget {
  CasePage({super.key, required this.isEdit, this.file});

  bool isEdit;
  FileModel? file;

  @override
  State<CasePage> createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  int currentStep = 0;

  // section 1 details
  TextEditingController courtController = TextEditingController();
  TextEditingController caseNumberController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController sectionDescriptionController = TextEditingController();

  // section 2 details
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientPhoneController = TextEditingController();
  TextEditingController clientRepController = TextEditingController();

  TextEditingController oppnNameController = TextEditingController();
  TextEditingController oppnPhoneController = TextEditingController();
  TextEditingController oppnRepController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    courtController.dispose();
    caseNumberController.dispose();
    sectionController.dispose();
    sectionController.dispose();

    clientNameController.dispose();
    clientPhoneController.dispose();
    clientRepController.dispose();

    oppnNameController.dispose();
    oppnPhoneController.dispose();
    oppnRepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    List<Step> steps = [
      // the case number, court,importance
      Step(
        title: const Text(
          'Case Details',
          overflow: TextOverflow.ellipsis,
        ),
        state: currentStep > 0
            ? StepState.complete
            : currentStep == 0
                ? StepState.editing
                : StepState.indexed,
        isActive: currentStep >= 0,
        content: SizedBox(
          height: height * 0.6,
          child: ListView(
            shrinkWrap: true,
            children: [
              // The court controller
              TopLabelTextField(
                      controller: courtController,
                      label: 'Court',
                      hintText: 'Eg. CJM, DLSA, TLSC',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLength: 40,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The case number controller
              TopLabelTextField(
                      controller: caseNumberController,
                      label: 'Case Number',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLength: 20,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The section Section
              TopLabelTextField(
                      controller: sectionController,
                      label: 'Sections',
                      hintText: 'Under which section does this case fall into.',
                      keyboardType: TextInputType.name,
                      borderRadius: 12,
                      maxLength: 20,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The section desc
              TopLabelTextField(
                      controller: sectionDescriptionController,
                      label: 'Section Description',
                      hintText: 'describe (optional)',
                      keyboardType: TextInputType.name,
                      borderRadius: 12,
                      maxLength: 80,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),
            ],
          ),
        ),
      ),

      // the Clinet info
      Step(
        title: const Text(
          'Client & Opposition Details',
          overflow: TextOverflow.ellipsis,
        ),
        state: currentStep > 1
            ? StepState.complete
            : currentStep == 1
                ? StepState.editing
                : StepState.indexed,
        isActive: currentStep >= 1,
        content: SizedBox(
          height: height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              // The clinet name
              TopLabelTextField(
                      controller: clientNameController,
                      label: 'Client Name',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The cclient rep
              TopLabelTextField(
                      controller: clientNameController,
                      label: 'Client Rep',
                      hintText: 'Adv. representing the client',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The client phone
              TopLabelTextField(
                      controller: clientPhoneController,
                      label: "Client's Phone No. ",
                      hintText: '',
                      keyboardType: TextInputType.phone,
                      borderRadius: 12,
                      maxLength: 10,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),
            ],
          ),
        ),
      ),

      // the files upload & and other overview.
      Step(
        title: const Text(
          'Attachments & Hearings',
          overflow: TextOverflow.ellipsis,
        ),
        state: currentStep > 2
            ? StepState.complete
            : currentStep == 2
                ? StepState.editing
                : StepState.indexed,
        isActive: currentStep >= 2,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),

      // the fpreview before saving
      Step(
        title: Text('Preview'),
        state: currentStep > 3
            ? StepState.complete
            : currentStep == 3
                ? StepState.editing
                : StepState.indexed,
        isActive: currentStep >= 3,
        content: Container(
          height: height * 0.2,
          child: Column(children: []),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorPalette().mainTitleColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: ColorPalette().primaryGreen,
                secondary: Colors.green,
              ),
        ),
        child: ListView(
          children: [
            // the main steooer
            Stepper(
              type: StepperType.vertical,
              currentStep: currentStep,
              steps: steps,
              physics: const BouncingScrollPhysics(),

              // the two buttons that lie at the bottom
              controlsBuilder: (context, details) {
                return ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  alignment: MainAxisAlignment.center,
                  overflowButtonSpacing: 10,
                  children: [
                    //  The button stating back or edit
                    OutlinedButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.cyan.shade50),
                      ),
                      onPressed: currentStep == 0
                          ? null
                          : () => details.onStepCancel!(),
                      child: Text(
                        currentStep == steps.length - 1
                            ? '   Edit   '
                            : '   Back   ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: currentStep == 0
                              ? Colors.grey.shade400
                              : ColorPalette().mainTitleColor,
                        ),
                      ),
                    ),

                    // // The button in on continue
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorPalette().secondaryGreen),
                      ),
                      onPressed: () async {
                        details.onStepContinue!();
                      },
                      child: Text(
                        currentStep == steps.length - 1
                            ? widget.isEdit
                                ? '   Update   '
                                : '   Save   '
                            : '   Next   ',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },

              // on step tap
              onStepTapped: (value) {
                null;
              },

              // on step continue
              onStepContinue: () {
                if (currentStep < steps.length - 1) {}
                setState(() {
                  currentStep++;
                });
              },

              // onstep cancel
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
