import 'regex_patterns.dart';

class AuthValidator {

  /// EMAIL
  static String? email(String? value) {

    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    if (!RegexPatterns.email.hasMatch(value.trim())) {
      return "Invalid email address";
    }

    return null;
  }

  /// PHONE
  static String? phone(String? value) {

    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }

    if (!RegexPatterns.phone.hasMatch(value.trim())) {
      return "Invalid phone number";
    }

    return null;
  }

  /// EMAIL OR PHONE
  static String? emailOrPhone(String? value) {

    if (value == null || value.trim().isEmpty) {
      return "Email or phone is required";
    }

    final v = value.trim();

    if (!RegexPatterns.email.hasMatch(v) &&
        !RegexPatterns.phone.hasMatch(v)) {

      return "Enter a valid email or phone number";
    }

    return null;
  }

  /// PASSWORD
  static String? password(String? value) {

    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (!RegexPatterns.password.hasMatch(value)) {
      return "Password must be at least 8 characters and contain a number";
    }

    return null;
  }

  /// CONFIRM PASSWORD
  static String? confirmPassword(
      String? password,
      String? confirmPassword,
      ) {

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    }

    if (password != confirmPassword) {
      return "Passwords do not match";
    }

    return null;
  }

  /// OTP
  static String? otp(String? value) {

    if (value == null || value.isEmpty) {
      return "OTP is required";
    }

    if (!RegexPatterns.otp.hasMatch(value)) {
      return "OTP must be 6 digits";
    }

    return null;
  }

  /// PIN
  static String? pin(String? value) {

    if (value == null || value.isEmpty) {
      return "PIN is required";
    }

    if (!RegexPatterns.pin.hasMatch(value)) {
      return "PIN must be 4 digits";
    }

    return null;
  }
}