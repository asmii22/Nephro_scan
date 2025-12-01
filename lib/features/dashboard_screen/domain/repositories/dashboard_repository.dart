import '../../../sign_in_sign_up_screen/data/models/user_model/user_model.dart';

abstract class DashboardRepository {
  Future<UserModel?> getUserInfo();
}
