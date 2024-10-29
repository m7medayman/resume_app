import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class LanguageSelectionDialog extends StatefulWidget {
  const LanguageSelectionDialog({super.key});

  @override
  State<LanguageSelectionDialog> createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  final GlobalKey<FormState> languageLevelFormKey = GlobalKey<FormState>();
  final TextEditingController languageInputLevelController =
      TextEditingController();
  final GlobalKey<FormState> languageFormKey = GlobalKey<FormState>();
  final TextEditingController languageInputController = TextEditingController();

  final List<String> languageLevels = [
    'Basic',
    'Elementary',
    'Novice',
    'A1 ',
    'Limited working proficiency',
    'Rudimentary',
    'Conversational',
    'Limited proficiency',
    'Working knowledge',
    'Intermediate',
    'A2 - B1 ',
    'Functional',
    'Fluent conversational',
    'Professional working proficiency',
    'B2 ',
    'Advanced intermediate',
    'Good command',
    'Fluent',
    'Full working proficiency',
    'C1 ',
    'Advanced',
    'Proficient',
    'High command',
    'Native-like',
    'Bilingual',
    'Native proficiency',
    'C2 ',
    'Complete fluency',
    'Mother tongue',
  ];

  String? selectedLanguageLevel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenHeight * 0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FormSeparator(screenHeight: screenHeight),
              GeneralInputFiled(
                  fieldFormKey: languageFormKey,
                  fieldInput: languageInputController,
                  label: "Language:",
                  validateMessageFunction: InputValidator.validateRegularField),
              FormSeparator(screenHeight: screenHeight),
              Form(
                key: languageLevelFormKey,
                child: DropdownButtonFormField<String>(
                  dropdownColor: ColorManager.backgroundColor,
                  borderRadius: BorderRadius.circular(0),
                  value: selectedLanguageLevel,
                  hint: Text(
                    'Select a Language Level',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  isExpanded: true,
                  items: languageLevels.map((String level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Please select a level' : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        languageInputLevelController.text = newValue;
                        selectedLanguageLevel = newValue;
                      }
                    });
                  },
                ),
              ),
              FormSeparator(screenHeight: screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    child: Text("Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: ColorManager.primaryColor)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (languageLevelFormKey.currentState!.validate() &&
                          languageFormKey.currentState!.validate()) {
                        Navigator.of(context).pop({
                          languageInputController.text:
                              languageInputLevelController.text
                        } as Map<String, String>);
                      }
                    },
                    child: Text(
                      "Save",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorManager.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
