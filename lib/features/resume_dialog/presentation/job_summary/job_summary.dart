import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/enhance_button.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';

class JobSummary extends StatelessWidget {
  const JobSummary(
      {super.key,
      required this.cubit,
      required this.onFinished,
      required this.screenHeight,
      required this.formKey,
      required this.jobDescriptionTextController});
  final TextEditingController jobDescriptionTextController;
  final GlobalKey<FormState> formKey;
  final double screenHeight;
  final ResumeDialogCubit cubit;
  final void Function() onFinished;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Job Summary",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        FormSeparator(screenHeight: screenHeight),
        GeneralInputFiled(
          fieldFormKey: formKey,
          fieldInput: jobDescriptionTextController,
          label: "",
          validateMessageFunction: InputValidator.validateRegularField,
          hintText:
              "but job summary by writing  it and what you can do  , and AI will enhance it ",
          minLines: 10,
        ),
        FormSeparator(screenHeight: screenHeight),
        EnhanceButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            cubit.getSummary(jobDescriptionTextController.text);
          },
          formKey: formKey,
        ),
        FormSeparator(screenHeight: screenHeight),
        const Divider(),
        FormSeparator(screenHeight: screenHeight),
        GoBackAndForward(
          formKey: formKey,
          cubit: cubit,
          jobDescriptionTextController: jobDescriptionTextController,
        )
      ],
    ));
  }
}

class GoBackAndForward extends StatelessWidget {
  const GoBackAndForward({
    super.key,
    required this.jobDescriptionTextController,
    required this.formKey,
    required this.cubit,
  });
  final TextEditingController jobDescriptionTextController;
  final GlobalKey<FormState> formKey;
  final ResumeDialogCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              if (formKey.currentState!.validate()) {
                cubit.updateJobSummery(jobDescriptionTextController.text);
                cubit.getNextPage();
              }
            },
            child: const Text("Next")),
      ],
    );
  }
}
