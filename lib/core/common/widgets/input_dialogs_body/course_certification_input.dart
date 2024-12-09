import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/date_picker.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class CourseCertificationInputDialog extends StatefulWidget {
  CourseCertificationInputDialog(
      {super.key, required this.screenHeight, required this.screenWidth});
  double screenHeight;
  double screenWidth;

  @override
  State<CourseCertificationInputDialog> createState() =>
      _CourseCertificationInputDialogState();
}

class _CourseCertificationInputDialogState
    extends State<CourseCertificationInputDialog> {
  final secondDateFormKey = GlobalKey<FormState>();
  TextEditingController secondDateInput = TextEditingController();
  TextEditingController firstDateInput = TextEditingController();

  final GlobalKey<FormState> firstDateFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> titleFormKey = GlobalKey<FormState>();

  final TextEditingController titleInputController = TextEditingController();

  // final GlobalKey<FormState> gradeFormKey = GlobalKey<FormState>();

  // final TextEditingController gradeInputController = TextEditingController();

  // final GlobalKey<FormState> schoolFormKey = GlobalKey<FormState>();

  // final TextEditingController schoolInputController = TextEditingController();

  Course educationalCourse = Course(
    title: "",
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  );
  String? selectedValue; // Variable to hold the selected value

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: widget.screenHeight * 0.3,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Course",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              FormSeparator(screenHeight: widget.screenHeight),
              GeneralInputFiled(
                  fieldFormKey: titleFormKey,
                  fieldInput: titleInputController,
                  label: "title",
                  validateMessageFunction: InputValidator.validateRegularField),
              FormSeparator(screenHeight: widget.screenHeight),
              DoubleDatePicker(
                setEndDate: (value) {
                  if (value != null) {
                    setState(() {
                      educationalCourse.endDate = value;
                    });
                  }
                },
                setStartDate: (value) {
                  if (value != null) {
                    setState(() {
                      educationalCourse.startDate = value;
                    });
                  }
                },
                firstDateInput: firstDateInput,
                secondDateInput: secondDateInput,
                screenWidth: widget.screenWidth,
                secondDateFormKey: secondDateFormKey,
                startDateTime: educationalCourse.startDate,
                endDateTime: educationalCourse.endDate,
                firstDateFormKey: firstDateFormKey,
              ),
              FormSeparator(screenHeight: widget.screenHeight),
              // Spacer(),
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
                          if (fdf & sdf & tf) {
                            educationalCourse.title = titleInputController.text;
                            Navigator.of(context).pop(educationalCourse);
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
