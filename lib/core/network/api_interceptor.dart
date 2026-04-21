import 'package:dio/dio.dart';
import 'package:e_wallet/core/services/secure_storage_service.dart';
import 'package:e_wallet/core/di/di.dart';
import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';

class ApiInterceptor extends Interceptor {
  final SecureStorageService storage;

  ApiInterceptor(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read("token");

    ///  Public endpoints (مش محتاجة token)
    final publicEndpoints = [
      "register",
      "login",
      "verify-otp",
      "resend-otp",
      "forgot-password",
      "reset-password",
    ];

    final isPublic = publicEndpoints.any(
      (endpoint) => options.path.contains(endpoint),
    );

    ///  ضيف التوكن بس لو endpoint protected
    if (token != null && token.isNotEmpty && !isPublic) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    ///  لو التوكن انتهى أو invalid
    if (err.response?.statusCode == 401) {
      print(" 401 Unauthorized → Logging out");

      /// امسح التوكن
      await storage.deleteToken();

      /// رجع app state لـ unauthenticated
      sl<AppCubit>().emit(AppUnauthenticated());
    }
    return handler.next(err);
  }
}