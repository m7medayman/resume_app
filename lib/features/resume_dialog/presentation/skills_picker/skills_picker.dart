import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/input_dialog.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';

class JobSkillPicker extends StatelessWidget {
  const JobSkillPicker(
      {super.key,
      required this.onFinished,
      required this.screenWidth,
      required this.screenHeight,
      required this.fieldFormKey,
      required this.fieldInput,
      required this.cubit,
      required this.state});
  final GlobalKey<FormState> fieldFormKey;
  final TextEditingController fieldInput;
  final ResumeDialogCubit cubit;
  final ResumeDialogState state;
  final double screenHeight;
  final double screenWidth;
  final void Function()? onFinished;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GeneralInputFiled(
                fieldFormKey: fieldFormKey,
                fieldInput: fieldInput,
                label: "job title",
                validateMessageFunction: InputValidator.validateRegularField),
            FormSeparator(screenHeight: screenHeight),
            // Hard skill section
            Text(
              "Select Hard Skills:",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            FormSeparator(screenHeight: screenHeight),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight * 0.2,
                  minWidth: double.maxFinite,
                ),
                child: Container(
                  color: ColorManager.textColorInputBackGround,
                  child: Wrap(
                    children: [
                      HardSkillsWrap(
                          state: state,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          cubit: cubit),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                            vertical: screenHeight * 0.01),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    ColorManager.backgroundColor)),
                            // add hard skill button
                            onPressed: () {
                              showInputDialog(context, title: "Add Skill: ")
                                  .then((value) {
                                if (value is String) {
                                  cubit.addAiJobHardSkill(value);
                                  cubit.addHardSkill(value);
                                }
                              });
                            },
                            child: const Text("+ Add skill")),
                      )
                    ],
                  ),
                )),
            FormSeparator(screenHeight: screenHeight),
            // soft skill section
            Text(
              "Select Soft Skills:",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            FormSeparator(screenHeight: screenHeight),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight * 0.2,
                  minWidth: double.maxFinite,
                ),
                child: Container(
                  color: ColorManager.textColorInputBackGround,
                  child: Wrap(
                    children: [
                      SoftSkillWrap(
                          state: state,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          cubit: cubit),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                            vertical: screenHeight * 0.01),
                        // soft skill  add button
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    ColorManager.backgroundColor)),
                            onPressed: () {
                              showInputDialog(context, title: "Add Skill: ")
                                  .then((value) {
                                if (value is String) {
                                  cubit.addAiJobsSoftSkill(value);
                                  cubit.addSoftSkill(value);
                                }
                              });
                            },
                            child: const Text("+ Add skill")),
                      )
                    ],
                  ),
                )),
            FormSeparator(screenHeight: screenHeight),
            // end of skill picker
            const Divider(),
            FormSeparator(screenHeight: screenHeight),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      cubit.goBack();
                    },
                    child: const Text("Back")),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (fieldFormKey.currentState!.validate()) {
                        cubit.updateJobTitle(fieldInput.text);
                        cubit.getNextPage();
                      }
                    },
                    child: const Text("Next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SoftSkillWrap extends StatelessWidget {
  const SoftSkillWrap({
    super.key,
    required this.state,
    required this.screenWidth,
    required this.screenHeight,
    required this.cubit,
  });

  final ResumeDialogState state;
  final double screenWidth;
  final double screenHeight;
  final ResumeDialogCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: state.jobInfoAi.softSkills.map((softSkill) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      state.selectedSoftSkills[softSkill] ?? false
                          ? ColorManager.buttonColor
                          : ColorManager.backgroundColor)),
              onPressed: () {
                if (state.selectedSoftSkills[softSkill] ?? false) {
                  cubit.removeSoftSkill(softSkill);
                } else {
                  cubit.addSoftSkill(softSkill);
                }
              },
              child: Text(
                softSkill,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
        );
      }).toList(),
    );
  }
}

class HardSkillsWrap extends StatelessWidget {
  const HardSkillsWrap({
    super.key,
    required this.state,
    required this.screenWidth,
    required this.screenHeight,
    required this.cubit,
  });

  final ResumeDialogState state;
  final double screenWidth;
  final double screenHeight;
  final ResumeDialogCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: state.jobInfoAi.hardSkills.map((hardSkill) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01, vertical: screenHeight * 0.005),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      state.selectedHardSkills[hardSkill] ?? false
                          ? ColorManager.buttonColor
                          : ColorManager.backgroundColor)),
              onPressed: () {
                if (state.selectedHardSkills[hardSkill] ?? false) {
                  cubit.removeHardSkill(hardSkill);
                } else {
                  cubit.addHardSkill(hardSkill);
                }
              },
              child: Text(
                hardSkill,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
        );
      }).toList(),
    );
  }
}
