import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({super.key, this.readyText = "", required this.title});
  final String readyText;
  final String title;
  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = widget.readyText;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Dialog(
      child: SizedBox(
        height: screenHeight * 0.3,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.005, horizontal: screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GeneralInputFiled(
                  fieldFormKey: keyForm,
                  fieldInput: textEditingController,
                  label: widget.title,
                  validateMessageFunction: InputValidator.validateRegularField),
              FormSeparator(screenHeight: screenHeight),
              ElevatedButton(
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      Navigator.of(context).pop(textEditingController.text);
                    }
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}

Future showInputDialog(context,
    {required String title, String readyText = ''}) {
  return showDialog(
      context: context,
      builder: (_) => InputDialog(
            title: title,
            readyText: readyText,
          ));
}
