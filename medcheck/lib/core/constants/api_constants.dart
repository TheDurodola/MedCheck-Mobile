class ApiConstants {
  ApiConstants._();


  static const String baseUrl = 'http://172.20.10.2:8080';


  static const String signin = '$baseUrl/api/v1/auth/signin';
  static const String signup = '$baseUrl/api/v1/auth/signup';
  static const String verifyPack = '$baseUrl/api/v1/verification/pack';
  static const String verifyTablet = '$baseUrl/api/v1/verification/tablet';
  static const String consumerProfile = '$baseUrl/api/v1/consumer/profile';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

}