import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// обёртка над flutter_secure_storage: храним только токены
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  static const String _accessTokenKey = 'access_token';

  Future<void> saveToken(String token) {
    return _storage.write(key: _accessTokenKey, value: token);
  }

  Future<String?> getToken() {
    return _storage.read(key: _accessTokenKey);
  }

  Future<void> deleteToken() {
    return _storage.delete(key: _accessTokenKey);
  }
}