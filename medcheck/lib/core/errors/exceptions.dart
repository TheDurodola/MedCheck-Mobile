class ServerException implements Exception {
  final String message;
  ServerException({this.message = 'Server Error'});
}
class CacheException implements Exception {
  final String message;
  CacheException({this.message = 'Server Error'});
}
class InvalidInputException implements Exception {
  final String message;
  InvalidInputException({this.message = 'Server Error'});
}

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = 'Server Error'});
}

class InvalidRoleException implements Exception{
  final String message;

  InvalidRoleException(this.message);
}