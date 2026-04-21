class VerifyOtpResult {
  final bool isRegister;
  final bool isReset;
  final String? token;

  VerifyOtpResult._({
    this.isRegister = false,
    this.isReset = false,
    this.token,
  });

  factory VerifyOtpResult.register() {
    return VerifyOtpResult._(isRegister: true);
  }

  factory VerifyOtpResult.reset(String token) {
    return VerifyOtpResult._(
      isReset: true,
      token: token,
    );
  }
}