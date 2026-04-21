import 'package:e_wallet/core/services/secure_storage_service.dart';

class AuthLocalDataSource {
  final SecureStorageService storage;

  AuthLocalDataSource(this.storage);

  Future<void> saveToken(String token) async {
    await storage.write("token", token);
  }

  Future<String?> getToken() async {
    return await storage.read("token");
  }

  Future<void> logout() async {
    await storage.delete("token");
  }
}