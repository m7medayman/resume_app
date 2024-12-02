import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/enhance_button.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class ProjectExperienceInputDialog extends StatefulWidget {
  const ProjectExperienceInputDialog(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.enhanceFunction});
  final double screenHeight;
  final double screenWidth;
  final Future<String> Function(String) enhanceFunction;

  @override
  State<ProjectExperienceInputDialog> createState() =>
      _EducationCertificationInputDialogState();
}

class _EducationCertificationInputDialogState
    extends State<ProjectExperienceInputDialog> {
  final GlobalKey<FormState> titleFormKey = GlobalKey<FormState>();

  final TextEditingController titleInputController = TextEditingController();

  final GlobalKey<FormState> descriptionFormKey = GlobalKey<FormState>();

  final TextEditingController descriptionInputController =
      TextEditingController();
  final GlobalKey<FormState> linkFormKey = GlobalKey<FormState>();

  final TextEditingController linkInputController = TextEditingController();

  ProjectExperience projectExperience = ProjectExperience(
    title: "",
    description: "",
    link: "",
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
                  hintText: "Working  at A project",
                  fieldFormKey: titleFormKey,
                  fieldInput: titleInputController,
                  label: "title",
                  validateMessageFunction: InputValidator.validateRegularField),
              FormSeparator(screenHeight: widget.screenHeight),
              GeneralInputFiled(
                  hintText: "Link of project is possible ",
                  fieldFormKey: linkFormKey,
                  fieldInput: linkInputController,
                  label: "Link",
                  validateMessageFunction: (s) {
                    return null;
                  }),
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
                          AppStrings.cancel,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.primaryColor),
                        )),
                    OutlinedButton(
                        onPressed: () {
                          bool tf = titleFormKey.currentState!.validate();

                          bool ss = descriptionFormKey.currentState!.validate();
                          // bool lv = linkFormKey.currentState!.validate();
                          if (tf & ss) {
                            projectExperience.title = titleInputController.text;
                            projectExperience.description =
                                descriptionInputController.text;
                            projectExperience.link = linkInputController.text;
                            Navigator.of(context).pop(projectExperience);
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
