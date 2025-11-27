import '../../data/models/user_model/user_model.dart';

class UserEntity {
  final String id;
  final String? name;
  final String? email;
  final String? address;
  final String? phoneNumber;
  final UserRole? role;
  final String? profilePictureUrl;

  UserEntity({
    required this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNumber,
    this.role,
    this.profilePictureUrl,
  });
}
