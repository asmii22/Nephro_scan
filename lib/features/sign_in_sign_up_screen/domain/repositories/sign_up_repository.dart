import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

abstract class SignUpRepository {
  Future<void> signUpUser({
    required String email,
    required String password,
    UserModel? userModel,
  });
  Future<void> signInUser(String email, String password);
  Future<void> signOut();
}
