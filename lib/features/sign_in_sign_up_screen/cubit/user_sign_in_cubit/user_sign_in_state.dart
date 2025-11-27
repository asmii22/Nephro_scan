part of 'user_sign_in_cubit.dart';

@freezed
class UserSignInState with _$UserSignInState {
  const factory UserSignInState.initial() = _Initial;
  const factory UserSignInState.loading() = _Loading;
  const factory UserSignInState.signIn() = _SignIn;
  const factory UserSignInState.signUp() = _SignUp;
  const factory UserSignInState.signOut() = _SignOut;
  const factory UserSignInState.error(String? message) = _Error;
}
