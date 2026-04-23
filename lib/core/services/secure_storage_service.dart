import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: "token");
  }

  Future<void> setOnboardingSeen() async {
    await _storage.write(key: "seen_onboarding", value: "true");
  }

  Future<bool> hasSeenOnboarding() async {
    return (await _storage.read(key: "seen_onboarding")) == "true";
  }
  Future<void> clearAll() async {
  await _storage.deleteAll();
}
}