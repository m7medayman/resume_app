import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';

class JobDescription extends StatelessWidget {
  JobDescription(
      {super.key,
      required this.onFinished,
      required this.screenHeight,
      required this.formKey,
      required this.jobDescriptionTextController});
  TextEditingController jobDescriptionTextController;
  GlobalKey<FormState> formKey;
  double screenHeight;
  final void Function()? onFinished;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Job Description",
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
                "but job description by writing it or by copy and paste it in here",
            minLines: 10,
          ),
          FormSeparator(screenHeight: screenHeight),
          ElevatedButton(onPressed: onFinished, child: const Text("Next"))
        ],
      ),
    ));
  }
}
