import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/date_picker.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class EducationCertificationInputDialog extends StatefulWidget {
  const EducationCertificationInputDialog(
      {super.key, required this.screenHeight, required this.screenWidth});
 final double screenHeight;
 final  double screenWidth;

  @override
  State<EducationCertificationInputDialog> createState() =>
      _EducationCertificationInputDialogState();
}

class _EducationCertificationInputDialogState
    extends State<EducationCertificationInputDialog> {
  final secondDateFormKey = GlobalKey<FormState>();
  TextEditingController secondDateInput = TextEditingController();
  TextEditingController firstDateInput = TextEditingController();

  final GlobalKey<FormState> firstDateFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> titleFormKey = GlobalKey<FormState>();

  final TextEditingController titleInputController = TextEditingController();

  final GlobalKey<FormState> gradeFormKey = GlobalKey<FormState>();

  final TextEditingController gradeInputController = TextEditingController();

  final GlobalKey<FormState> schoolFormKey = GlobalKey<FormState>();

  final TextEditingController schoolInputController = TextEditingController();

  Degree educationalDegree = Degree(
      title: "",
      grade: GradeDegree.ACCEPTED,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      school: "");
  final List<String> options = [
    'Accepted',
    'Good',
    'Very Good',
    'Excellent',
  ];
  String? selectedValue; // Variable to hold the selected value

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: widget.screenHeight * 0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "academical degree",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              FormSeparator(screenHeight: widget.screenHeight),
              GeneralInputFiled(
                  hintText: "Bachelor of Engineering ",
                  fieldFormKey: titleFormKey,
                  fieldInput: titleInputController,
                  label: "title",
                  validateMessageFunction:
                      InputValidator.validateRegularField),
              FormSeparator(screenHeight: widget.screenHeight),
              GeneralInputFiled(
                  hintText: "Cairo university ",
                  fieldFormKey: schoolFormKey,
                  fieldInput: schoolInputController,
                  label: "University/School",
                  validateMessageFunction:
                      InputValidator.validateRegularField),
              FormSeparator(screenHeight: widget.screenHeight),
              DoubleDatePicker(
                setEndDate: (value) {
                  if (value != null) {
                    setState(() {
                      educationalDegree.endDate = value;
                    });
                  }
                },
                setStartDate: (value) {
                  if (value != null) {
                    setState(() {
                      educationalDegree.startDate = value;
                    });
                  }
                },
                firstDateInput: firstDateInput,
                secondDateInput: secondDateInput,
                screenWidth: widget.screenWidth,
                secondDateFormKey: secondDateFormKey,
                startDateTime: educationalDegree.startDate,
                endDateTime: educationalDegree.endDate,
                firstDateFormKey: firstDateFormKey,
              ),
              FormSeparator(screenHeight: widget.screenHeight),
              Form(
                key: gradeFormKey,
                child: DropdownButtonFormField<String>(
                  dropdownColor: ColorManager.backgroundColor,
                  value: selectedValue,
                  borderRadius: BorderRadius.circular(0),
                  hint: Text(
                    'Select a Grade',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ), // Placeholder text
                  isExpanded:
                      true, // Makes the dropdown expand to fill the width
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  validator: InputValidator.validateRegularField,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        gradeInputController.text = newValue;
                        selectedValue = newValue;
                        if (selectedValue == options[0]) {
                          educationalDegree.grade = GradeDegree.ACCEPTED;
                        }
                        if (selectedValue == options[1]) {
                          educationalDegree.grade = GradeDegree.GOOD;
                        }
                        if (selectedValue == options[2]) {
                          educationalDegree.grade = GradeDegree.VERYGOOD;
                        }
                        if (selectedValue == options[3]) {
                          educationalDegree.grade = GradeDegree.EXCELLENT;
                        } // Update the selected value
                      }
                    });
                  },
                ),
              ),
              // Spacer(),
              BigFormSeparator(screenHeight: widget.screenHeight),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(null);
                        },
                        child: Text(
                          AppStrings.close,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.primaryColor),
                        )),
                    OutlinedButton(
                        onPressed: () {
                          bool fdf =
                              firstDateFormKey.currentState!.validate();
                          bool sdf =
                              secondDateFormKey.currentState!.validate();
                      
                          bool tf = titleFormKey.currentState!.validate();
                          bool df = gradeFormKey.currentState!.validate();
                          bool ss = schoolFormKey.currentState!.validate();
                          if (fdf & sdf & tf & df & ss) {
                            educationalDegree.title =
                                titleInputController.text;
                            educationalDegree.school =
                                schoolInputController.text;
                      
                            Navigator.of(context).pop(educationalDegree);
                          }
                        },
                        child: Text(
                          AppStrings.saveChanges,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.primaryColor),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
