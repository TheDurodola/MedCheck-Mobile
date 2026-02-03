import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.role,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['jwt'],
      role: json['authority'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'token': token,
    };
  }
}