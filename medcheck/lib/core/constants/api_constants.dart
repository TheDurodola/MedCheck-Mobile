class ApiConstants {
  ApiConstants._();


  static const String baseUrl = 'http://10.0.2.2:8080';


  static const String signin = '$baseUrl/api/v1/auth/signin';
  static const String signup = '$baseUrl/api/v1/auth/signup';
  static const String verifyPack = '$baseUrl/api/v1/verification/pack';
  static const String verifySachet = '$baseUrl/api/v1/verification/sachet';
  static const String consumerProfile = '$baseUrl/api/v1/consumer/profile';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static Map<String, String> authHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

}