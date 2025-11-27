import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_remote_datasource.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource _signUpRemoteDataSource;
  SignUpRepositoryImpl(this._signUpRemoteDataSource);

  @override
  Future<void> signUpUser({
    required String email,
    required String password,
    UserModel? userModel,
  }) async {
    try {
      await _signUpRemoteDataSource.signUpUser(
        email: email,
        password: password,
        userModel: userModel,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInUser(String email, String password) async {
    try {
      await _signUpRemoteDataSource.signInUser(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    try {
      return _signUpRemoteDataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
