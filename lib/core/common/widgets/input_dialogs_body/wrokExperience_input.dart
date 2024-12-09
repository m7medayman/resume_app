
import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/date_picker.dart';
import 'package:resume_app/core/common/widgets/enhance_button.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class WorkExperienceInputDialog extends StatefulWidget {
  const WorkExperienceInputDialog(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.enhanceFunction});
  final double screenHeight;
  final double screenWidth;
  final Future<String> Function(String) enhanceFunction;

  @override
  State<WorkExperienceInputDialog> createState() =>
      _EducationCertificationInputDialogState();
}

class _EducationCertificationInputDialogState
    extends State<WorkExperienceInputDialog> {
  final secondDateFormKey = GlobalKey<FormState>();
  TextEditingController secondDateInput = TextEditingController();
  TextEditingController firstDateInput = TextEditingController();

  final GlobalKey<FormState> firstDateFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> titleFormKey = GlobalKey<FormState>();

  final TextEditingController titleInputController = TextEditingController();

  final GlobalKey<FormState> descriptionFormKey = GlobalKey<FormState>();

  final TextEditingController descriptionInputController =
      TextEditingController();

  WorkExperience workExperience = WorkExperience(
    title: "",
    description: "",
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  );
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
                "Work Experience:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              FormSeparator(screenHeight: widget.screenHeight),
              GeneralInputFiled(
                  hintText: "Working  at A company",
                  fieldFormKey: titleFormKey,
                  fieldInput: titleInputController,
                  label: "title",
                  validateMessageFunction: InputValidator.validateRegularField),
              FormSeparator(screenHeight: widget.screenHeight),
              DoubleDatePicker(
                setEndDate: (value) {
                  if (value != null) {
                    setState(() {
                      workExperience.endDate = value;
                    });
                  }
                },
                setStartDate: (value) {
                  if (value != null) {
                    setState(() {
                      workExperience.startDate = value;
                    });
                  }
                },
                firstDateInput: firstDateInput,
                secondDateInput: secondDateInput,
                screenWidth: widget.screenWidth,
                secondDateFormKey: secondDateFormKey,
                startDateTime: workExperience.startDate,
                endDateTime: workExperience.endDate,
                firstDateFormKey: firstDateFormKey,
              ),
              FormSeparator(screenHeight: widget.screenHeight),
              GeneralInputFiled(
                  minLines: 3,
                  hintText:
                      "working as a developer at A company on 'any project name' project ....etc ",
                  fieldFormKey: descriptionFormKey,
                  fieldInput: descriptionInputController,
                  label: "description: ",
                  validateMessageFunction: InputValidator.validateRegularField),
              FormSeparator(screenHeight: widget.screenHeight),
              EnhanceButton(
                  formKey: descriptionFormKey,
                  onPressed: () async {
                    String? response = await widget
                        .enhanceFunction(descriptionInputController.text);
                    descriptionInputController.text = response;
                  }),

              // Spacer(),
              FormSeparator(screenHeight: widget.screenHeight),
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
                          bool fdf = firstDateFormKey.currentState!.validate();
                          bool sdf = secondDateFormKey.currentState!.validate();

                          bool tf = titleFormKey.currentState!.validate();

                          bool ss = descriptionFormKey.currentState!.validate();
                          if (fdf & sdf & tf & ss) {
                            workExperience.title = titleInputController.text;
                            workExperience.description =
                                descriptionInputController.text;
                            Navigator.of(context).pop(workExperience);
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
