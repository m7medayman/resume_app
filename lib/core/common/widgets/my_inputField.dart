import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/resources/helpers/input_fields.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_size_wight_manager.dart';

class GeneralInputFiled extends StatelessWidget {
  const GeneralInputFiled(
      {super.key,
      this.minLines,
      this.hintText,
      this.keyboardType,
      this.onTap,
      this.readonly = false,
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
  final bool readonly;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? minLines;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _emailFormKey,
      child: TextFormField(
        maxLines: minLines,
        keyboardType: keyboardType,
        readOnly: readonly,
        onTap: onTap,
        controller: fieldInput,
        validator: (value) => validateMessageFunction(value),
        decoration: InputDecoration(
            hintText: hintText,
            errorMaxLines: 2,
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
            validateMessageFunction: InputValidator.validateEmail,
            keyboardType: TextInputType.emailAddress);
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
        keyboardType: TextInputType.visiblePassword,
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
    return GeneralInputFiled(
        keyboardType: TextInputType.phone,
        fieldFormKey: widget.formKey,
        fieldInput: widget.fieldInputController,
        label: "phone",
        validateMessageFunction: InputValidator.validateRegularField);
  }
}

class ReenterPasswordInputFiled extends StatefulWidget {
  const ReenterPasswordInputFiled({
    super.key,
    required this.passwordINputController,
    required GlobalKey<FormState> FormKey,
    required this.inputController,
    this.label = AppStrings.password,
    this.validateMessageFunction = InputValidator.validatePassword,
  }) : _emailFormKey = FormKey;

  final GlobalKey<FormState> _emailFormKey;
  final TextEditingController inputController;
  final String label;
  final TextEditingController passwordINputController;
  final String? Function(String?) validateMessageFunction;

  @override
  State<ReenterPasswordInputFiled> createState() =>
      _ReenterPasswordInputFiledState();
}

class _ReenterPasswordInputFiledState extends State<ReenterPasswordInputFiled> {
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
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscureText,
        controller: widget.inputController,
        validator: (value) {
          if (widget.inputController.text.trim() !=
              widget.passwordINputController.text.trim()) {
            return "password doesn't match ";
          }
        },
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
