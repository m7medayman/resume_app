import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/my_inputField.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';

class DoubleDatePicker extends StatelessWidget {
  DoubleDatePicker({
    super.key,
    required this.setEndDate,
    required this.setStartDate,
    required this.firstDateInput,
    required this.secondDateInput,
    required this.startDateTime,
    required this.endDateTime,
    required this.firstDateFormKey,
    required this.secondDateFormKey,
    required this.screenWidth,
  });
  DateTime startDateTime;
  DateTime endDateTime;
  TextEditingController firstDateInput;
  final GlobalKey<FormState> firstDateFormKey;
  TextEditingController secondDateInput;
  final GlobalKey<FormState> secondDateFormKey;
  final double screenWidth;
  final Function(DateTime?) setStartDate;
  final Function(DateTime?) setEndDate;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
        flex: 1,
        child: GeneralInputFiled(
            readonly: true,
            onTap: () {
              showDatePicker(
                      context: context,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2030))
                  .then((value) {
                setStartDate(value);
                if (value != null) {
                  startDateTime = DateTime(value.year, value.month);
                  firstDateInput.text =
                      "${startDateTime.year}-${startDateTime.month}";
                }
              });
            },
            fieldFormKey: firstDateFormKey,
            fieldInput: firstDateInput,
            label: "From: ",
            validateMessageFunction: InputValidator.validateRegularField),
      ),
      SizedBox(
        width: screenWidth * .05,
      ),
      Expanded(
        flex: 1,
        child: GeneralInputFiled(
            readonly: true,
            onTap: () {
              showDatePicker(
                      context: context,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2030))
                  .then((value) {
                setEndDate(value);
                if (value != null) {
                  endDateTime = DateTime(value.year, value.month);
                  secondDateInput.text =
                      "${endDateTime.year}-${endDateTime.month}";
                }
              });
            },
            fieldFormKey: secondDateFormKey,
            fieldInput: secondDateInput,
            label: "To: ",
            validateMessageFunction: (value) {
              print(startDateTime);
              print(endDateTime);
              if (startDateTime.isAfter(endDateTime) ||
                  startDateTime.isAtSameMomentAs(endDateTime)) {
                return "the end time should be after the start time";
              }

              return InputValidator.validateRegularField(value);
            }),
      )
    ]);
  }
}
