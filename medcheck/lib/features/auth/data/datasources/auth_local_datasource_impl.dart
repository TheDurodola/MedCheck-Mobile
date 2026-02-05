import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medcheck/features/auth/data/datasources/abstract_classes/auth_local_datasource.dart';

import '../../../../core/errors/exceptions.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource{
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});

  static const String _tokenKey = 'CACHED_AUTH_TOKEN';
  static const String _userFirstName = "USER_FIRST_NAME";

  @override
  Future<void> cacheToken(String token) async {
    try {
      await secureStorage.write(key: _tokenKey, value: token);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String?> getLastToken() async {
    try {
      return await secureStorage.read(key: _tokenKey);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await secureStorage.delete(key: _tokenKey);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheFirstname(String firstname) async {
    try {
      await secureStorage.write(key: _userFirstName, value: firstname);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> clearFirstname() async {
    try {
      await secureStorage.delete(key: _userFirstName);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String?> getFirstname() async {
    try {
      return await secureStorage.read(key: _userFirstName);
    } catch (e) {
      throw CacheException();
    }
  }
}