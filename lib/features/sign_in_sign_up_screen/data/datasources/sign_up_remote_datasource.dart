import 'package:injectable/injectable.dart';
import 'package:nephroscan/core/firebase_client/auth_firebase_client.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

abstract class SignUpRemoteDataSource {
  Future<void> signUpUser({
    required String email,
    required String password,
    UserModel? userModel,
  });
  Future<void> signInUser(String email, String password);
  Future<void> signOut();
}

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  final AuthFirebaseClient authFirebaseClient;
  SignUpRemoteDataSourceImpl(this.authFirebaseClient);

  @override
  Future<void> signUpUser({
    required String email,
    required String password,
    UserModel? userModel,
  }) async {
    try {
      await authFirebaseClient.signUp(
        email: email,
        password: password,
        userModel: userModel,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInUser(String email, String password) {
    try {
      return authFirebaseClient.signIn(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    try {
      return authFirebaseClient.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
