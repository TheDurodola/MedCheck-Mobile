abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getLastToken();
  Future<void> clearCache();
}