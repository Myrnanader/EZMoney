/*import 'package:e_wallet/features/auth/data/models/verify_otp_result.dart';

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
*/
import 'package:dio/dio.dart';
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

  String _parseError(dynamic e) {
    if (e is DioException) {
      final responseData = e.response?.data;

      //  أول حاجة: جيب message من الـ response body
      if (responseData is Map) {
        // لو في errors object → جيب أول error منه
        final errors = responseData['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final firstField = errors.values.first;
          if (firstField is List && firstField.isNotEmpty) {
            return firstField.first.toString();
          }
          return firstField.toString();
        }

        // لو في message مباشرة
        if (responseData['message'] != null) {
          return responseData['message'].toString();
        }
      }

      //  تاني حاجة: network errors
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return "Connection timed out. Please try again.";
        case DioExceptionType.connectionError:
          return "No internet connection.";
        case DioExceptionType.badResponse:
          final status = e.response?.statusCode;
          if (status == 401) return "Invalid credentials.";
          if (status == 429) return "Too many attempts. Please wait.";
          if (status == 500) return "Server error. Please try again later.";
          return "Something went wrong. Please try again.";
        default:
          return "Something went wrong. Please try again.";
      }
    }

    if (e is String) return e;

    return "Something went wrong. Please try again.";
  }

  @override
  Future<void> login(String identifier, String password) async {
    try {
      final res = await api.login(identifier, password);
      await local.saveToken(res.data.auth.token);
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<void> register(RegisterRequest request) async {
    try {
      await api.register(request);
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<VerifyOtpResult> verifyOtp({
    required String email,
    required String otp,
    required String type,
  }) async {
    try {
      final res = await api.verifyOtp(email, otp, type);
      final data = res.data as Map<String, dynamic>?;

      if (type == "register") {
        final token = data?['auth']?['token'];
        if (token != null) await local.saveToken(token);
        return VerifyOtpResult.register();
      }

      if (type == "reset") {
        final resetToken = data?['auth']?['token'];
        return VerifyOtpResult.reset(resetToken ?? "");
      }

      throw "Unknown OTP type";
    } catch (e) {
      if (e is String) rethrow;
      throw _parseError(e);
    }
  }

  @override
  Future<void> resendOtp(String email, String type) async {
    try {
      await api.resendOtp(email, type);
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await api.forgotPassword(email);
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<void> resetPassword(
    String email,
    String token,
    String password,
    String confirmPassword,
  ) async {
    try {
      await api.resetPassword(email, token, password, confirmPassword);
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<void> setPin(String pin, String confirmPin) async {
    try {
      await api.setPin(PinRequest(pin: pin, pinConfirmation: confirmPin));
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<void> verifyPin(String pin) async {
    try {
      await api.verifyPin({"pin": pin});
    } catch (e) {
      throw _parseError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await api.logout();
    } catch (_) {}
    await local.logout();
  }
}