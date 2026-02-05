abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getLastToken();
  Future<void> clearCache();

  Future<void> cacheFirstname(String token);
  Future<String?> getFirstname();
  Future<void> clearFirstname();
}