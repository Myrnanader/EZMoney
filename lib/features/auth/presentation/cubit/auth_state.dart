part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthOtpSent extends AuthState {}

class AuthOtpResent extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
class OtpVerifiedForRegister extends AuthState {}

class OtpVerifiedForReset extends AuthState {
  final String token;

  OtpVerifiedForReset(this.token);
}
class ResetPasswordSuccess extends AuthState {}
class LoginSuccess extends AuthState {}