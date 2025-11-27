import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole { doctor, patient }

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
    UserRole? role,
    String? profilePicture,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
  const UserModel._();
}
