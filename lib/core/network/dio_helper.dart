import 'package:dio/dio.dart';
import 'package:e_wallet/core/network/api_interceptor.dart';
import 'package:e_wallet/core/services/secure_storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio getDio(SecureStorageService storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://ezmoney-production-8dbe.up.railway.app/api/",
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    ///  Token Interceptor
    dio.interceptors.add(ApiInterceptor(storage));

    ///  Logger (Debug Only)
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    return dio;
  }
}