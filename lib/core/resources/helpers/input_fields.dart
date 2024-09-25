class InputValidator {
  // Static method to validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (value.length < 3) {
      return "Invalid email: too short";
    }
    if (!value.contains("@")) {
      return "Email must contain '@'";
    }
    return validateRegularField(value);
  }

  // Static method to validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return validateRegularField(value);
  }

  // Static method to validate a regular (generic) input field
  static String? validateRegularField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null; // valid input
  }
}
