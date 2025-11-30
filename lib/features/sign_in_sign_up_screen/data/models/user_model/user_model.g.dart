// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
  profilePicture: json['profilePicture'] as String?,
  reports: (json['reports'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'role': _$UserRoleEnumMap[instance.role],
      'profilePicture': instance.profilePicture,
      'reports': instance.reports,
    };

const _$UserRoleEnumMap = {
  UserRole.doctor: 'doctor',
  UserRole.patient: 'patient',
};
