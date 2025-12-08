import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

import '../../../../core/firebase_client/authorized_firebase_client.dart';

abstract class DashboardRemoteDataSource {
  Future<UserModel?> getUserInfo();
  Future<List<String>?> getReportDocIds();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final AuthorizedFirebaseClient _authorizedFirebaseClient;
  DashboardRemoteDataSourceImpl(this._authorizedFirebaseClient);

  @override
  Future<UserModel?> getUserInfo() {
    try {
      return _authorizedFirebaseClient.getUserInfo();
    } catch (e) {
      throw Exception('Get user info failed: $e');
    }
  }

  @override
  Future<List<String>?> getReportDocIds() {
    try {
      return _authorizedFirebaseClient.getReportDocIds();
    } catch (e) {
      throw Exception('Get report document IDs failed: $e');
    }
  }
}
