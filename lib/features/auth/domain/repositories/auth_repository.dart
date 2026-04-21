import '../../data/models/register_request.dart';
import '../../data/models/verify_otp_result.dart';

abstract class AuthRepository {
  Future<void> login(String identifier, String password);

  Future<void> register(RegisterRequest request);

  Future<VerifyOtpResult> verifyOtp({
    required String email,
    required String otp,
    required String type,
  });

  Future<void> resendOtp(String email, String type);

  Future<void> forgotPassword(String email);

  Future<void> resetPassword(
    String email,
    String token,
    String password,
    String confirmPassword,
  );

  Future<void> setPin(String pin, String confirmPin);

  Future<void> verifyPin(String pin);

  Future<void> logout();
}