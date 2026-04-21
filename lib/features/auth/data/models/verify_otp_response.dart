import 'package:e_wallet/features/auth/data/models/login_response.dart';

class VerifyOtpResponse {
  final User? user;
  final Auth? auth;
  final String? resetToken;

  VerifyOtpResponse({
    this.user,
    this.auth,
    this.resetToken,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      auth: json['auth'] != null ? Auth.fromJson(json['auth']) : null,
      resetToken: json['reset_token'],
    );
  }
}