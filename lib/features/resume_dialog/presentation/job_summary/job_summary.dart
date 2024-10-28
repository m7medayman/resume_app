import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';

class JobSummary extends StatelessWidget {
  JobSummary(
      {super.key,
      required this.cubit,
      required this.onFinished,
      required this.screenHeight,
      required this.formKey,
      required this.jobDescriptionTextController});
  TextEditingController jobDescriptionTextController;
  GlobalKey<FormState> formKey;
  double screenHeight;
  ResumeDialogCubit cubit;
  final void Function()? onFinished;
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
        ElevatedButton(
            onPressed: () {
              cubit.getSummary(jobDescriptionTextController.text);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.auto_fix_high), Text("Enhnce")],
            )),
        FormSeparator(screenHeight: screenHeight),
        Row(
          children: [
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text("Next")),
          ],
        )
      ],
    ));
  }
}
