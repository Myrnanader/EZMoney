import 'package:e_wallet/core/di/di.dart';
import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';
import 'package:e_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/register_request.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;

  AuthCubit(this.repo) : super(AuthInitial());

  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await repo.login(identifier, password);

      await sl<AppCubit>().checkAuth();

      emit(LoginSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterRequest request) async {
    emit(AuthLoading());

    try {
      await repo.register(request);
      emit(AuthOtpSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
    required String type,
  }) async {
    emit(AuthLoading());

    try {
      final result = await repo.verifyOtp(email: email, otp: otp, type: type);

      if (result.isRegister) {
        emit(OtpVerifiedForRegister());
      }

      if (result.isReset) {
        emit(OtpVerifiedForReset(result.token!));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resendOtp({required String email, required String type}) async {
    try {
      await repo.resendOtp(email, type);
      emit(AuthOtpResent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());

    try {
      await repo.forgotPassword(email);
      emit(AuthOtpSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());

    try {
      await repo.resetPassword(email, token, password, confirmPassword);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> setPin(String pin, String confirmPin) async {
    emit(AuthLoading());

    try {
      await repo.setPin(pin, confirmPin);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> verifyPin(String pin) async {
    emit(AuthLoading());

    try {
      await repo.verifyPin(pin);

      ///  بعد التحقق من PIN → فعل المستخدم
      await sl<AppCubit>().checkAuth();

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());

    try {
      await repo.logout();
      await sl<AppCubit>().checkAuth();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
