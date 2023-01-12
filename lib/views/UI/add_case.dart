// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/models/file_model.dart';
import 'package:lawbook/models/hearing_model.dart';
import 'package:lawbook/widgets/custom_widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class CasePage extends StatefulWidget {
  CasePage({super.key, required this.isEdit, this.file});

  bool isEdit;
  FileModel? file;

  @override
  State<CasePage> createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  int currentStep = 0;
  List<Hearing> hearingDnT = [];

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

  // hearing dsc
  TextEditingController hearingDateController = TextEditingController();
  TextEditingController hearingDescController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    courtController.dispose();
    caseNumberController.dispose();
    sectionController.dispose();
    sectionDescriptionController.dispose();

    clientNameController.dispose();
    clientPhoneController.dispose();
    clientRepController.dispose();

    oppnNameController.dispose();
    oppnPhoneController.dispose();
    oppnRepController.dispose();

    hearingDescController.dispose();
    hearingDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          height: height * 0.65,
          child: ListView(
            shrinkWrap: true,
            children: [
              // The court controller
              TopLabelTextField(
                      controller: courtController,
                      label: 'Court ',
                      hintText: 'Eg. CJM, DLSA, TLSC',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      requiredField: true,
                      maxLength: 40,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The case number controller
              TopLabelTextField(
                      controller: caseNumberController,
                      label: 'Case Number ',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLength: 30,
                      requiredField: true,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The section Section
              TopLabelTextField(
                      controller: sectionController,
                      label: 'Sections ',
                      hintText: 'Under which section does this case fall into.',
                      keyboardType: TextInputType.name,
                      borderRadius: 12,
                      maxLength: 40,
                      requiredField: true,
                      maxLines: 1,
                      obscureText: false)
                  .topLabelTextField(),

              // The section desc
              TopLabelTextField(
                      controller: sectionDescriptionController,
                      label: 'Description',
                      hintText: 'describe the case (optional)',
                      keyboardType: TextInputType.name,
                      borderRadius: 12,
                      maxLength: 500,
                      maxLines: 4,
                      requiredField: false,
                      obscureText: false)
                  .topLabelTextField(),
            ],
          ),
        ),
      ),

      // the Clinet info
      Step(
        title: const Text(
          'Client Details',
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
                      label: 'Client Name ',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLines: 1,
                      requiredField: true,
                      obscureText: false)
                  .topLabelTextField(),

              // The cclient rep
              TopLabelTextField(
                      controller: clientRepController,
                      label: 'Client Rep ',
                      hintText: 'Adv. representing the client',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLines: 1,
                      requiredField: true,
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
                      requiredField: true,
                      obscureText: false)
                  .topLabelTextField(),
            ],
          ),
        ),
      ),

      // the opposition details
      Step(
        title: const Text(
          'Opposition Details',
          overflow: TextOverflow.ellipsis,
        ),
        state: currentStep > 2
            ? StepState.complete
            : currentStep == 2
                ? StepState.editing
                : StepState.indexed,
        isActive: currentStep >= 2,
        content: SizedBox(
          height: height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              // The clinet name
              TopLabelTextField(
                      controller: oppnNameController,
                      label: 'Opposition Name ',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLines: 1,
                      requiredField: true,
                      obscureText: false)
                  .topLabelTextField(),

              // The cclient rep
              TopLabelTextField(
                      controller: oppnRepController,
                      label: 'Oppositions Rep ',
                      hintText: 'Adv. representing the opposition party',
                      keyboardType: TextInputType.text,
                      borderRadius: 12,
                      maxLines: 1,
                      requiredField: true,
                      obscureText: false)
                  .topLabelTextField(),

              // The client phone
              TopLabelTextField(
                      controller: oppnPhoneController,
                      label: "Opposition's Phone No. ",
                      hintText: '',
                      keyboardType: TextInputType.phone,
                      borderRadius: 12,
                      maxLength: 10,
                      maxLines: 1,
                      requiredField: false,
                      obscureText: false)
                  .topLabelTextField(),
            ],
          ),
        ),
      ),

      // the hearing and files upload before saving
      Step(
        title: const Text('Hearings & Attachments'),
        state: currentStep > 3
            ? StepState.complete
            : currentStep == 3
                ? StepState.editing
                : StepState.indexed,
        isActive: currentStep >= 3,
        content: SizedBox(
          height: height * 0.35,
          child: ListView(
            children: [
              // add hearing date.
              InkWell(
                onTap: () async {
                  // var dp = await pickDate();
                  // if (dp != null) {
                  // if a date is picked, then show the desecription dialog;
                  hearingDescDialog(height: height);
                  //   // if a desc is given, the flag is set to 1,
                  //   // the hearing desc controller has text in it, add it to the model.
                  //   // else, make sure there is no text and then add it to model;
                  //   setState(() {
                  //     hearingDnT.add(Hearing(
                  //         date: dp, description: hearingDescController.text));
                  //     hearingDescController.clear();
                  //   });
                  // }
                },
                child: Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: hearingDnT.isEmpty
                          ? const Radius.circular(12)
                          : const Radius.circular(0),
                      bottomRight: hearingDnT.isEmpty
                          ? const Radius.circular(12)
                          : const Radius.circular(0),
                    ),
                    color: ColorPalette().accentGreen,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: ColorPalette().primaryGreen,
                        ),
                        SizedBox(
                          width: width * 0.08,
                        ),
                        Text(
                          'Hearing dates & details',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorPalette().mainTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: width * 0.08,
                        ),
                        hearingDnT.length > 3
                            ? const Icon(Icons.arrow_drop_down_rounded)
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),

              // The list view of picked dates
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.grey.shade300)),
                height: hearingDnT.isEmpty
                    ? height * 0.0
                    : hearingDnT.length < 3
                        ? height * 0.08 * hearingDnT.length
                        : height * 0.08 * 3,
                child: hearingDnT == []
                    ? null
                    : hearingDateAndTimeListView(hearingDnT, height),
              ),

              // // Custom button to get files picked
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     height: height * 0.06,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: ColorPalette().accentGreen,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       mainAxisSize: MainAxisSize.max,
              //       children: [
              //         Icon(
              //           Icons.attach_file_rounded,
              //           color: ColorPalette().primaryGreen,
              //         ),
              //         Text(
              //           'Add related files',
              //           overflow: TextOverflow.ellipsis,
              //           style: TextStyle(
              //               color: ColorPalette().mainTitleColor,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ];

    // the UI
    return Scaffold(
      // appbar
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        title: Text(
          'Case Entry',
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorPalette().mainTitleColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // body
      body: Theme(
        data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: ColorPalette().primaryGreen, secondary: Colors.green)),
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
                            ? '   Preview   '
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
                if (currentStep != 3) {
                  // if first step, check for empty strings
                  if (currentStep == 0 &&
                      courtController.text.isNotEmpty &&
                      caseNumberController.text.isNotEmpty &&
                      sectionController.text.isNotEmpty) {
                    setState(() {
                      currentStep++;
                    });
                  }
                  // if the step is client page
                  else if (currentStep == 1 &&
                      clientNameController.text.isNotEmpty &&
                      clientPhoneController.text.isNotEmpty &&
                      clientRepController.text.isNotEmpty) {
                    setState(() {
                      currentStep++;
                    });
                  }
                  // this is for the oppn page
                  else if (currentStep == 2 &&
                      oppnNameController.text.isNotEmpty &&
                      oppnRepController.text.isNotEmpty) {
                    setState(() {
                      currentStep++;
                    });
                  }
                  // what happens if not
                  else {
                    CustomWidget().customSnackBarWithText(
                        content:
                            'Please fill out the required fields with * sign.',
                        context: context);
                  }
                } else if (currentStep == 3) {
                  if (hearingDnT.isNotEmpty) {
                    // upload model to firebase after hashing and encrypting
                  }
                }
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

  // // the date picker
  // pickDate() async {
  //   final DateTime? dp = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(DateTime.now().year + 10),
  //   );
  //   return dp;
  // }

  // the list view generator
  hearingDateAndTimeListView(List hdntList, double height) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  hearingDnT.removeAt(index);
                });
              },
              icon: Icon(
                Icons.delete_outline,
                color: ColorPalette().primaryGreen,
              )),
          leading: Icon(
            Icons.date_range_outlined,
            color: ColorPalette().primaryGreen,
          ),
          title: Text(
            hdntList[index].date,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            hdntList[index].description,
            overflow: TextOverflow.ellipsis,
          ),
          onLongPress: () => showHearingDetail(
              date: hdntList[index].date,
              details: hdntList[index].description,
              height: height),
        );
      },
      itemCount: hdntList.length,
    );
  }

  // hearing date & description
  hearingDescDialog({required double height}) {
    // alert dialog with desc options
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hearing Details',
              style: TextStyle(color: ColorPalette().mainTitleColor),
              overflow: TextOverflow.ellipsis),
          scrollable: true,
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          content: SizedBox(
            height: height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                // hearing date field
                TopLabelTextField(
                  controller: hearingDateController,
                  label: 'Hearing Date',
                  hintText: 'Date of the next hearing',
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  requiredField: true,
                  borderRadius: 12,
                  maxLength: 10,
                  borderColor: ColorPalette().primaryGreen,
                ).topLabelTextField(),

                // description field for a hearing date
                TopLabelTextField(
                        controller: hearingDescController,
                        label: 'Hearing Description',
                        hintText: '',
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        requiredField: false,
                        borderRadius: 12,
                        maxLength: 100,
                        maxLines: 3,
                        borderColor: ColorPalette().primaryGreen)
                    .topLabelTextField(),
              ],
            ),
          ),

          // alert box actions
          actions: [
            // cancel button
            OutlinedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.cyan.shade50),
              ),
              onPressed: () {
                hearingDateController.clear();
                hearingDescController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: currentStep == 0
                      ? Colors.grey.shade400
                      : ColorPalette().mainTitleColor,
                ),
              ),
            ),

            // // The button in adding hearing
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorPalette().secondaryGreen),
              ),
              onPressed: () async {
                if (hearingDateController.text.isEmpty) {
                  CustomWidget().customSnackBarWithText(
                      content: 'Please enter a date to add it. It is optional.',
                      context: context);
                } else {
                  // add the new hearing
                  setState(() {
                    hearingDnT.add(
                      Hearing(
                          date: hearingDateController.text.trim(),
                          description: hearingDescController.text),
                    );
                    hearingDateController.clear();
                    hearingDescController.clear();
                  });

                  Navigator.pop(context, true);
                }
              },
              child: const Text(
                'Add description',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // on long press
  showHearingDetail(
      {required String date, required String details, required double height}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Details of $date',
              style: TextStyle(color: ColorPalette().mainTitleColor),
              overflow: TextOverflow.ellipsis),
          scrollable: true,
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          content: SizedBox(
              height: height * 0.3,
              child: Center(
                child: Text(
                  details == ''
                      ? 'You have no description for this hearing'
                      : details,
                  textAlign: TextAlign.center,
                ),
              )),
        );
      },
    );
  }
}
