import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_size_wight_manager.dart';

class GeneralInputFiled extends StatelessWidget {
  const GeneralInputFiled(
      {super.key,
      required GlobalKey<FormState> fieldFormKey,
      required this.fieldInput,
      required this.label,
      required this.validateMessageFunction,
      this.icon})
      : _emailFormKey = fieldFormKey;

  final GlobalKey<FormState> _emailFormKey;
  final TextEditingController fieldInput;
  final String label;
  final String? Function(String?) validateMessageFunction;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _emailFormKey,
      child: TextFormField(
        controller: fieldInput,
        validator: (value) => validateMessageFunction(value),
        decoration: InputDecoration(
            suffixIcon: icon,
            filled: true,
            fillColor: ColorManager.textColorInputBackGround,
            label: Text(label),
            labelStyle: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}

class EmailInputFiled extends GeneralInputFiled {
  const EmailInputFiled(
      {super.key,
      required super.fieldFormKey,
      required super.fieldInput,
      super.label = AppStrings.email})
      : super(
            icon: const Icon(Icons.email),
            validateMessageFunction: InputValidator.validateEmail);
}

class PasswordInputFiled extends StatefulWidget {
  const PasswordInputFiled({
    super.key,
    required GlobalKey<FormState> FormKey,
    required this.inputController,
    this.label = AppStrings.password,
    this.validateMessageFunction = InputValidator.validatePassword,
  }) : _emailFormKey = FormKey;

  final GlobalKey<FormState> _emailFormKey;
  final TextEditingController inputController;
  final String label;
  final String? Function(String?) validateMessageFunction;

  @override
  State<PasswordInputFiled> createState() => _PasswordInputFiledState();
}

class _PasswordInputFiledState extends State<PasswordInputFiled> {
  bool _obscureText = true;

  // Method to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._emailFormKey,
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.inputController,
        validator: (value) => InputValidator.validatePassword(value),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: _togglePasswordVisibility,
            ),
            filled: true,
            fillColor: ColorManager.textColorInputBackGround,
            label: Text(widget.label),
            labelStyle: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}

class PhoneInputField extends StatefulWidget {
  const PhoneInputField(
      {super.key,
      required this.formKey,
      required this.fieldInputController,
      required this.validateMessageFunction});
  final GlobalKey<FormState> formKey;
  final TextEditingController fieldInputController;
  final String? Function(String?) validateMessageFunction;
  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
        key: widget.key,
        keyboardType: TextInputType.numberWithOptions(),
        validator: (value) {
          return widget.validateMessageFunction(value.toString());
        },
        decoration: InputDecoration(),
        pickerDialogStyle: PickerDialogStyle(
            countryCodeStyle: Theme.of(context).textTheme.bodyMedium,
            countryNameStyle: Theme.of(context).textTheme.bodyMedium),
        dropdownTextStyle: Theme.of(context).textTheme.bodyMedium,
        controller: widget.fieldInputController,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: FontSize.s20));
  }
}
