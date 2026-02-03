class SignUpRequestModel {
  final String username;
  final String password;

  SignUpRequestModel({
    required this.username,
    required this.password,
  });


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}