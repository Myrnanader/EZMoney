class RegexPatterns {

  /// email
  static final email =
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  /// password (min 8 chars + number)
  static final password =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');

  /// egypt phone
  static final phone =
      RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

  /// name
  static final name =
      RegExp(r'^[a-zA-Z ]+$');

  /// otp
  static final otp =
      RegExp(r'^[0-9]{6}$');

  /// pin (4 digits)
  static final pin =
      RegExp(r'^[0-9]{4}$');
}