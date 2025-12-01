part of 'user_info_cubit.dart';

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState.initial() = _Initial;
  const factory UserInfoState.loading() = _Loading;
  const factory UserInfoState.success(UserModel? userModel) = _Success;
  const factory UserInfoState.error(String? message) = _Error;
}
