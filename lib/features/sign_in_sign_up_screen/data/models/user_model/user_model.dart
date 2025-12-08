import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../base/utils/strings.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

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
    List<String>? reports,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
  const UserModel._();
}
