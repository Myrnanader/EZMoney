import 'package:e_wallet/core/services/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final SecureStorageService storage;

  AppCubit(this.storage) : super(AppInitial());

  ///  check auth
  Future<void> checkAuth() async {
    emit(AppLoading());

    final token = await storage.read("token");
    final seenOnboarding = await storage.hasSeenOnboarding();

    print("TOKEN: $token");

    ///  لو فيه توكن → تحقق من السيرفر
    if (token != null && token.isNotEmpty) {
      try {
        ///  لازم يكون عندك API زي /me أو /profile
        /// استبدل دي بالـ API بتاعك
        // await api.getProfile();

        /// مؤقتًا (لو مفيش endpoint)
        await Future.delayed(const Duration(milliseconds: 300));

        print("STATE → Authenticated");
        emit(AppAuthenticated());
        return;
      } catch (e) {
        ///  التوكن invalid أو السيرفر مسحه
        print("TOKEN INVALID → deleting");

        await storage.deleteToken();

        emit(AppUnauthenticated());
        return;
      }
    }

    ///  أول مرة
    if (!seenOnboarding) {
      emit(AppFirstTime());
      return;
    }

    ///  مش لوجين
    emit(AppUnauthenticated());
  }

  ///  logout
  Future<void> logout() async {
    await storage.deleteToken();
    emit(AppUnauthenticated());
  }
}
