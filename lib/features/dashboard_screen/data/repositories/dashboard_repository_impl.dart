import 'package:injectable/injectable.dart';

import '../../../sign_in_sign_up_screen/data/models/user_model/user_model.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserModel?> getUserInfo() async {
    try {
      final userInfo = await remoteDataSource.getUserInfo();
      return userInfo;
    } catch (e) {
      rethrow;
    }
  }
}
