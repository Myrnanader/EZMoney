import 'package:e_wallet/core/services/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final SecureStorageService storage;

  AppCubit(this.storage) : super(AppInitial());

  Future<void> checkAuth() async {
    emit(AppLoading());

    final token = await storage.read("token");
    final seenOnboarding = await storage.hasSeenOnboarding();

    if (token != null && token.isNotEmpty) {
      emit(AppAuthenticated());
      return;
    }

    if (!seenOnboarding) {
      emit(AppFirstTime());
      return;
    }

    emit(AppUnauthenticated());
  }

  //  FIX: logout مباشر بدون checkAuth
  Future<void> logout() async {
    await storage.deleteToken();
    emit(AppUnauthenticated());
  }

  //  FIX: بعد register OTP verified → authenticated مباشرة
  void setAuthenticated() {
    emit(AppAuthenticated());
  }
}