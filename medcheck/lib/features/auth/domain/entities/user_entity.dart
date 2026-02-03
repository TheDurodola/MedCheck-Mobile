import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String role;
  final String token;

  const UserEntity({
    required this.role,
    required this.token,
  });

  @override
  List<Object?> get props => [role, token];
}