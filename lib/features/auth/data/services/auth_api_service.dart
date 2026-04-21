import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login_response.dart';
import '../models/base_response.dart';
import '../models/register_request.dart';
import '../models/pin_request.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// REGISTER
  @POST("register")
  Future<BaseResponse> register(@Body() RegisterRequest body);

  /// LOGIN
  @FormUrlEncoded()
  @POST("login")
  Future<LoginResponse> login(
    @Field("login") String login,
    @Field("password") String password,
  );

  /// VERIFY OTP
  @POST('/verify-otp')
@FormUrlEncoded()
Future<BaseResponse> verifyOtp(
  @Field('email') String email,
  @Field('otp') String otp,
  @Field('type') String type,
);

  /// RESEND OTP
  @FormUrlEncoded()
  @POST("resend-otp")
  Future<BaseResponse> resendOtp(
    @Field("email") String email,
    @Field("type") String type,
  );

  /// FORGOT PASSWORD
  @FormUrlEncoded()
  @POST("forgot-password")
  Future<BaseResponse> forgotPassword(
    @Field("email") String email,
  );

  /// RESET PASSWORD
  @FormUrlEncoded()
  @POST("reset-password")
  Future<BaseResponse> resetPassword(
    @Field("email") String email,
    @Field("reset_token") String token,
    @Field("password") String password,
    @Field("password_confirmation") String confirm,
  );

  /// SET PIN
  @POST("set-pin")
  Future<BaseResponse> setPin(@Body() PinRequest body);

  /// VERIFY PIN
  @POST("verify-pin")
  Future<BaseResponse> verifyPin(@Body() Map<String, dynamic> body);

  /// LOGOUT
  @POST("logout")
  Future<BaseResponse> logout();
}