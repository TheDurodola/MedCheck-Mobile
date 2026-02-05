class RegistrationModel {
  final String firstName; // Matching your JSON key style
  final String username;

  RegistrationModel({required this.username, required this.firstName});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    // Accessing the nested 'data' object
    final userData = json['data'] as Map<String, dynamic>;

    return RegistrationModel(
      username: userData['username'] as String,
      firstName: userData['firstName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'firstName': firstName,
        'username': username,
      }
    };
  }
}