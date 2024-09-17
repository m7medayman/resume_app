abstract class InputField<T> {
  String? value;
  String _message = "";
  InputField({
    required this.value,
  });
  bool publicValidation() {
    if (value == null) {
      _message = "Field is null ";
      return false;
    }
    if (value == "") {
      _message = "Field is empty";
      return false;
    }

    return privateValidation();
  }

  bool privateValidation();
  get validationMessage => _message;
}

class EmailInputFiled extends InputField {
  EmailInputFiled({required super.value});

  @override
  bool privateValidation() {
    if (value!.length < 3) {
      super._message = "inValid email";
      return false;
    }
    if (!value!.contains("@")) {
      super._message = "email must contains @";
      return false;
    }
    return true;
  }
}

class PassWordInputField extends InputField {
  PassWordInputField({required super.value});

  @override
  bool privateValidation() {
    if (value!.length < 3) {
      super._message = "invalid password";
      return false;
    }
    return true;
  }
}

class RegularInputFiled extends InputField {
  RegularInputFiled({required super.value});

  @override
  bool privateValidation() {
    return true;
  }
}
