import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/secure_storage_service.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  Future<void> checkAuthStatus() async {
    final token = await SecureStorageService.getToken();

    if (token != null) {
      emit(state.copyWith(status: AppStatus.authenticated));
    } else {
      emit(state.copyWith(status: AppStatus.unauthenticated));
    }
  }

  void login() {
    emit(state.copyWith(status: AppStatus.authenticated));
  }

  void logout() {
    emit(state.copyWith(status: AppStatus.unauthenticated));
  }
}