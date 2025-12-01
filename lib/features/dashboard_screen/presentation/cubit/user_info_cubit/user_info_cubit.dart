import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/dashboard_screen/domain/repositories/dashboard_repository.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

part 'user_info_cubit.freezed.dart';
part 'user_info_state.dart';

@injectable
class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit({required DashboardRepository dashboardRepository})
    : _dashboardRepository = dashboardRepository,
      super(const UserInfoState.initial());

  final DashboardRepository _dashboardRepository;

  Future<void> getUserInfo() async {
    emit(const UserInfoState.loading());
    try {
      final userInfo = await _dashboardRepository.getUserInfo();
      emit(UserInfoState.success(userInfo));
    } catch (e) {
      emit(UserInfoState.error(e.toString()));
    }
  }
}
