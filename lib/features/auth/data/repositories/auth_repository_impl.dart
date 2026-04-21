import 'package:e_wallet/features/auth/data/models/verify_otp_result.dart';

import '../data_sources/auth_local_data_source.dart';
import '../services/auth_api_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/register_request.dart';
import '../models/pin_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService api;
  final AuthLocalDataSource local;

  AuthRepositoryImpl(this.api, this.local);

  @override
  Future<void> login(String identifier, String password) async {
    final res = await api.login(identifier, password);
    await local.saveToken(res.data.auth.token);
  }

  @override
  Future<void> register(RegisterRequest request) async {
    await api.register(request);
  }

  @override
  Future<VerifyOtpResult> verifyOtp({
    required String email,
    required String otp,
    required String type,
  }) async {
    final res = await api.verifyOtp(email, otp, type);
    final data = res.data as Map<String, dynamic>?;

    if (type == "register") {
      final token = data?['auth']?['token'];

      if (token != null) {
        await local.saveToken(token);
      }

      return VerifyOtpResult.register();
    }

    if (type == "reset") {
      final resetToken = data?['auth']?['token'];
      return VerifyOtpResult.reset(resetToken ?? "");
    }

    throw Exception("Unknown OTP type");
  }

  @override
  Future<void> resendOtp(String email, String type) async {
    await api.resendOtp(email, type);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await api.forgotPassword(email);
  }

  @override
  Future<void> resetPassword(
    String email,
    String token,
    String password,
    String confirmPassword,
  ) async {
    await api.resetPassword(email, token, password, confirmPassword);
  }

  @override
  Future<void> setPin(String pin, String confirmPin) async {
    await api.setPin(PinRequest(pin: pin, pinConfirmation: confirmPin));
  }

  @override
  Future<void> verifyPin(String pin) async {
    await api.verifyPin({"pin": pin});
  }

  @override
  Future<void> logout() async {
    try {
      await api.logout();
    } catch (_) {
      /// ignore API error
    }
    await local.logout();
  }
}
