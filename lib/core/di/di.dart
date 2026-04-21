import 'package:e_wallet/core/network/dio_helper.dart';
import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';
import 'package:e_wallet/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:e_wallet/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_wallet/features/auth/data/services/auth_api_service.dart';
import 'package:e_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../services/secure_storage_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// CORE
  sl.registerLazySingleton(() => SecureStorageService());

  sl.registerLazySingleton<Dio>(
    () => DioHelper.getDio(sl()),
  );

  /// API
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiService(sl()),
  );

  /// LOCAL
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(sl()),
  );

  /// REPO
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );

  /// CUBITS
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => AppCubit(sl()));
}